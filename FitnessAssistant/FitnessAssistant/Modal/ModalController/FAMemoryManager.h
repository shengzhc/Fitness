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
#import "FAMemoryDelegate.h"

@interface FAMemoryManager : NSObject < FAMemoryDelegate >

@property (readonly, strong) NSMutableDictionary *notes;

- (id)initWithRepository:(id)repository;

- (void)updateNoteEntity:(FANoteEntity *)noteEntity;
- (void)deleteNoteEntity:(FANoteEntity *)noteEntity;

@end
