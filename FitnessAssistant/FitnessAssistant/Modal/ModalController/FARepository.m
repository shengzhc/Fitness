//
//  FARepository.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FARepository.h"
#import "FAMemoryManager.h"

@interface FARepository ()

@property (nonatomic, strong) FAMemoryManager *memoryManager;

@end

@implementation FARepository

+ (FARepository *)sharedRepository
{
    static FARepository *repository;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        repository = [[FARepository alloc] init];
    });
    
    return repository;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        
        _memoryManager = [[FAMemoryManager alloc] initWithRepository:self];
    }
    
    return self;
}

- (NSInteger)numberOfNoteEntity
{
    return [self.memoryManager.notes allValues].count;
}

- (FANoteEntity *)noteEntityForKey:(NSString *)key
{
    return [self.memoryManager.notes valueForKey:key];
}

- (FANoteEntity *)noteEntityForIndex:(NSInteger)index
{
    if (index < self.memoryManager.notes.count) {
        
        return [[self.memoryManager.notes allValues] objectAtIndex:index];
    }
    
    return nil;
}

- (void)deleteNoteEntity:(FANoteEntity *)noteEntity
{
    [self.memoryManager deleteNoteEntity:noteEntity];
}

- (void)updateNoteEntity:(FANoteEntity *)noteEntity
{
    [self.memoryManager updateNoteEntity:noteEntity];
}

- (void)addNoteEntity:(FANoteEntity *)noteEntity
{
    [self updateNoteEntity:noteEntity];
}

- (void)didUpdateMemory:(id)object
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (NSString *)description
{
    return [self.memoryManager description];
}

@end
