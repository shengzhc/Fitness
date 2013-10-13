//
//  FAICloudManager.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAiCloudManager.h"
#import "FADocument.h"

@interface FAiCloudManager ()

@property (nonatomic, strong) FADocument *doc;
@property (nonatomic, strong) NSMetadataQuery *query;

@end

@implementation FAiCloudManager

+ (FAiCloudManager *)sharediCloudManager
{
    static FAiCloudManager *iCloudManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        iCloudManager = [[FAiCloudManager alloc] init];
    });
    
    return iCloudManager;
}

+ (BOOL)isEnabled
{
    if ([[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil]) {
        
        return YES;
    }
    
    return NO;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        
        _query = [[NSMetadataQuery alloc] init];
        _query.searchScopes = @[NSMetadataQueryUbiquitousDataScope];
        _query.predicate = [NSPredicate predicateWithFormat:@"%K == %@", NSMetadataItemFSNameKey, [self filename]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishGatheringNotification:) name:NSMetadataQueryDidFinishGatheringNotification object:_query];
        
        [_query startQuery];
    }
    
    return self;
}

- (void)didFinishGatheringNotification:(NSNotification *)notification
{
    NSMetadataQuery *query = [notification object];
    
    [query disableUpdates];
    [query stopQuery];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSMetadataQueryDidFinishGatheringNotification object:query];
    _query = nil;
    
    [self loadData:query];
}

- (void)loadData:(NSMetadataQuery *)query
{
    if ([query resultCount] == 0)
    {
        NSLog(@"File not found on iCloud");
        NSURL *url = [[[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil] URLByAppendingPathComponent:[self filename]];
        self.doc = [[FADocument alloc] initWithFileURL:url];
        
        [self.doc saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            
            NSLog(@"Saving %@", [NSNumber numberWithBool:success]);

            [self.doc openWithCompletionHandler:^(BOOL success) {
                
                NSLog(@"Open %@", [NSNumber numberWithBool:success]);
            }];
        }];
    }
    else
    {
        NSMetadataItem *item = [query resultAtIndex:0];
        NSURL *url = [item valueForAttribute:NSMetadataItemURLKey];
    
        self.doc = [[FADocument alloc] initWithFileURL:url];

        [self.doc openWithCompletionHandler:^(BOOL success) {
            
            NSLog(@"Open %@", [NSNumber numberWithBool:success]);
        }];
    }
}

- (NSString *)filename
{
    return @"note_icloud.dat";
}
@end
