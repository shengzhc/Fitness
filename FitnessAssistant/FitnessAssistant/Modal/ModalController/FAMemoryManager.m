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
        
        _localManager = nil;
        _iCloudManager = nil;
        
        if ([FALocalManager isEnabled]) {
            _localManager = [FALocalManager sharedLocalManager];
        }
        
        if ([FAiCloudManager isEnabled]) {
            _iCloudManager = [FAiCloudManager sharediCloudManager];
        }
    }
    
    return self;
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
