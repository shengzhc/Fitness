//
//  FALocalManager.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FALocalManager.h"

@implementation FALocalManager

+ (FALocalManager *)sharedLocalManager
{
    static FALocalManager *localManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localManager = [[FALocalManager alloc] init];
    });
    
    return localManager;
}

+ (BOOL)isEnabled
{
    return YES;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (id)load
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self filepath]]) {
        
        return [NSKeyedUnarchiver unarchiveObjectWithFile:[self filepath]];
    }
    
    return nil;
}

- (BOOL)save:(id)object
{
    return [NSKeyedArchiver archiveRootObject:object toFile:[self filepath]];
}

- (NSString *)filepath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:[self filename]];
}

- (NSString *)filename
{
    return @"note_local.dat";
}

@end
