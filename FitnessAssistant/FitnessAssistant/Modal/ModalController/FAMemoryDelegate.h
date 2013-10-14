//
//  FAMemoryDelegate.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/13/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FAMemoryDelegate <NSObject>

- (id)memoryDataSource;
- (void)updateMemoryWithObject:(id)object;

@end
