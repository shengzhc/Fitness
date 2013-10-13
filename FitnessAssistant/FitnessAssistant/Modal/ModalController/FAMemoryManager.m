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
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation FAMemoryManager

+ (FAMemoryManager *)sharedMemoryManager
{
    static FAMemoryManager *memoryManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        memoryManager = [[FAMemoryManager alloc] init];
    });
    
    return memoryManager;
}

- (id)init
{
    self = [super init];
    
    if (self) {

        _localManager = [FALocalManager sharedLocalManager];
        _iCloudManager = [FAiCloudManager sharediCloudManager];
    }
    
    return self;
}


@end
