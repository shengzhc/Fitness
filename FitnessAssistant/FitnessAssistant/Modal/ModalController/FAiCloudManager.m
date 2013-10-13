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

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

@end
