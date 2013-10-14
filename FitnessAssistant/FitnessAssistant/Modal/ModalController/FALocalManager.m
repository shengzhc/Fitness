//
//  FALocalManager.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FALocalManager.h"

@interface FALocalManager ()

@property (nonatomic, weak) id< FAMemoryDelegate > memoryDelegate;

@end

@implementation FALocalManager

+ (BOOL)isEnabled
{
    return YES;
}

- (id)initWithMemoryDelegate:(id)memoryDelegate;
{
    self = [super init];
    
    if (self) {
        
        _memoryDelegate = memoryDelegate;
    }
    
    return self;
}

- (void)load
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self filepath]]) {
        
        id object = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filepath]];
        [self.memoryDelegate updateMemoryWithObject:object];
    }
}

- (BOOL)save
{
    id object = [self.memoryDelegate memoryDataSource];
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
