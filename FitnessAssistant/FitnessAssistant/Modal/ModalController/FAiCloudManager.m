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

@property (nonatomic, weak) id< FAMemoryDelegate > memoryDelegate;
@property (nonatomic, strong) FADocument *doc;
@property (nonatomic, strong) NSMetadataQuery *query;

@end

@implementation FAiCloudManager

+ (BOOL)isEnabled
{
    if ([[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil]) {
        
        return YES;
    }
    
    return NO;
}

- (id)initWithMemoryDelegate:(id < FAMemoryDelegate >)memoryDelegate
{
    self = [super init];
    
    if (self) {
        
        _memoryDelegate = memoryDelegate;
    }
    
    return self;
}

- (void)load
{
    self.query = [[NSMetadataQuery alloc] init];
    self.query.searchScopes = @[NSMetadataQueryUbiquitousDataScope];
    self.query.predicate = [NSPredicate predicateWithFormat:@"%K == %@", NSMetadataItemFSNameKey, [self filename]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishGatheringNotification:) name:NSMetadataQueryDidFinishGatheringNotification object:self.query];
    [self.query startQuery];
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Notification
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)didFinishGatheringNotification:(NSNotification *)notification
{
    NSMetadataQuery *query = [notification object];
    
    [query disableUpdates];
    [query stopQuery];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSMetadataQueryDidFinishGatheringNotification object:query];
    _query = nil;
    
    [self loadiCloud:query];
}

- (void)loadiCloud:(NSMetadataQuery *)query
{
    if ([query resultCount] == 0)
    {
        NSLog(@"File not found on iCloud");
        NSURL *url = [[[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil] URLByAppendingPathComponent:[self filename]];
        self.doc = [[FADocument alloc] initWithFileURL:url];
        self.doc.delegate = self;
        
        [self.doc saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            
            NSLog(@"Saving %@", [NSNumber numberWithBool:success]);

            [self.doc openWithCompletionHandler:^(BOOL success) {
                
                NSLog(@"Open %@", [NSNumber numberWithBool:success]);
            }];
        }];
    }
    else {
        
        NSMetadataItem *item = [query resultAtIndex:0];
        NSURL *url = [item valueForAttribute:NSMetadataItemURLKey];
    
        self.doc = [[FADocument alloc] initWithFileURL:url];
        self.doc.delegate = self;

        [self.doc openWithCompletionHandler:^(BOOL success) {
            
            NSLog(@"Open %@", [NSNumber numberWithBool:success]);
        }];
    }
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark FADocumentDelegate
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)didUpdateWithContent:(id)content
{
    [self.memoryDelegate updateMemoryWithObject:content];
}

- (id)contentForiCloud
{
    return [self.memoryDelegate memoryDataSource];
}

- (NSString *)filename
{
    return @"note_icloud.dat";
}
@end
