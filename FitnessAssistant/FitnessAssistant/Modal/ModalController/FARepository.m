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
        
        _memoryManager = [FAMemoryManager sharedMemoryManager];
    }
    
    return self;
}

- (NSString *)description
{
    return [self.memoryManager description];
}

@end
