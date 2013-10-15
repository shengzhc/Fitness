//
//  FALocalManager.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAMemoryDelegate.h"

@interface FALocalManager : NSObject

+ (BOOL)isEnabled;
- (id)initWithMemoryDelegate:(id < FAMemoryDelegate >)memoryDelegate;

- (void)load;
- (BOOL)save;

@end
