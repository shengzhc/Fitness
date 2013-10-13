//
//  FAMemoryManager.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FALocalManager.h"
#import "FAiCloudManager.h"

@interface FAMemoryManager : NSObject

+ (FAMemoryManager *)sharedMemoryManager;

@end
