//
//  FAMemoryManager.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAMemoryManager.h"
#import "FANoteItemEntity.h"
#import "FANoteEntity.h"

@interface FAMemoryManager ()

@property (nonatomic, strong) FALocalManager *localManager;
@property (nonatomic, strong) FAiCloudManager *iCloudManager;

@property (nonatomic, strong) NSMutableDictionary *notes;

@end

@implementation FAMemoryManager

- (id)init
{
    self = [super init];
    
    if (self) {
        
        _localManager = nil;
        _iCloudManager = nil;
        _notes = [NSMutableDictionary new];
        
        if ([FALocalManager isEnabled]) {
            _localManager = [[FALocalManager alloc] initWithMemoryDelegate:self];
            [self loadFromLocal];
        }
        
        if ([FAiCloudManager isEnabled]) {
            _iCloudManager = [[FAiCloudManager alloc] initWithMemoryDelegate:self];
            [self loadFromiCloud];
        }
    }
    
    return self;
}

- (void)loadFromLocal
{
    [self.localManager load];
}

- (void)loadFromiCloud
{
    [self.iCloudManager load];
}

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark FAMemoryDelegate
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (id)memoryDataSource
{
    return [self.notes allValues];
}

- (void)updateMemoryWithObject:(id)object
{
    for (FANoteEntity *noteEntity in object) {
        
        [self.notes setObject:noteEntity forKey:noteEntity.name];
    }
}

- (NSString *)description
{
    NSMutableString *desc = [[NSMutableString alloc] init];
    
    if (self.localManager) {
        
        [desc appendString:@"Local Manager Enabled.\n"];
    }
    
    if (self.iCloudManager) {
        [desc appendString:@"iCould Manager Enabled.\n"];
    }
    
    return desc;
}

@end
