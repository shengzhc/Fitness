//
//  FARepository.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FANoteItemEntity.h"
#import "FANoteEntity.h"

@interface FARepository : NSObject

+ (FARepository *)sharedRepository;

- (NSInteger)numberOfNoteEntity;
- (FANoteEntity *)noteEntityForKey:(NSString *)key;
- (FANoteEntity *)noteEntityForIndex:(NSInteger)index;

- (void)addNoteEntity:(FANoteEntity *)noteEntity;
- (void)updateNoteEntity:(FANoteEntity *)noteEntity;
- (void)deleteNoteEntity:(FANoteEntity *)noteEntity;

@end
