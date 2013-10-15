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
@property (nonatomic, weak) id repository;

@end

@implementation FAMemoryManager

- (id)initWithRepository:(id)repository
{
    self = [super init];
    
    if (self) {
        
        _repository = repository;
        _localManager = nil;
        _iCloudManager = nil;
        _notes = [NSMutableDictionary new];
        
        if ([FALocalManager isEnabled]) {
            _localManager = [[FALocalManager alloc] initWithMemoryDelegate:self];
        }
        
        if ([FAiCloudManager isEnabled]) {
            _iCloudManager = [[FAiCloudManager alloc] initWithMemoryDelegate:self];
        }
        
        [self load];
    }
    
    return self;
}

- (void)load
{
    if (self.localManager) {
        [self.localManager load];
    }
    
    if (self.iCloudManager) {
        [self.iCloudManager load];
    }
}

- (void)save
{
    if (self.localManager) {
        [self.localManager save];
    }
    
    if (self.iCloudManager) {
        [self.iCloudManager save];
    }
}

- (void)deleteNoteEntity:(FANoteEntity *)noteEntity
{
    if ([self.notes valueForKey:noteEntity.name]) {
        [self.notes removeObjectForKey:noteEntity.name];
        [self save];
    }
}

- (void)updateNoteEntity:(FANoteEntity *)noteEntity
{
    [self.notes setObject:noteEntity forKey:noteEntity.name];
    [self save];
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
    
    if ([self.repository respondsToSelector:@selector(didUpdateMemory:)]) {
        [self.repository performSelector:@selector(didUpdateMemory:) withObject:self.notes.allValues];
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
