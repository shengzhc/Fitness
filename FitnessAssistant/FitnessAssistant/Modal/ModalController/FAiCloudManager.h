//
//  FAICloudManager.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAiCloudManager : NSObject

+ (FAiCloudManager *)sharediCloudManager;
+ (BOOL)isEnabled;

@end
