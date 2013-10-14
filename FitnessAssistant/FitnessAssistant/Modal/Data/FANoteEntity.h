//
//  FANoteEntity.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FANoteItemEntity.h"

#define FANoteEntityKeyName @"name"
#define FANoteEntityKeyNoteItemEntityArray @"noteItemEntityArray"
#define FANoteEntityKeyNoteStatus @"status"
#define FANoteEntityKeyFinishedDateArray @"finishedDateArray"
#define FANoteEntityKeyCoolDownForSuspend @"coolDownForSuspend"
#define FANoteEntityKeyCoolDownBetweenItems @"coolDownBetweenItems"

typedef enum {
    
    FANoteEntityStatusTypeReady = 0,
    FANoteEntityStatusTypeRunning,
    FANoteEntityStatusTypePaused,
    FANoteEntityStatusTypeFinished,
    FANoteEntityStatusTypeSuspend,
    
}FANoteEntityStatusType;

@interface FANoteEntity : NSObject < NSCoding >

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *noteItemEntityArray;
@property (nonatomic, assign) FANoteEntityStatusType status;

@property (nonatomic, strong) NSMutableArray *finishedDateArray;
//User sets, unit should be hour
@property (nonatomic, assign) NSTimeInterval coolDownForSuspend;

//unit should be second
@property (nonatomic, assign) NSTimeInterval coolDownBetweenItems;

+ (FANoteEntity *)defaultEntity;

@end
