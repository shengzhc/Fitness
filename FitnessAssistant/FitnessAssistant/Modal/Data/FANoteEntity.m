//
//  FANoteEntity.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteEntity.h"

@implementation FANoteEntity

- (id)init
{
    self = [super init];
    
    if (self) {
        
        _noteItemEntityArray = [NSMutableArray new];
        _finishedDateArray = [NSMutableArray new];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        
        _name = [aDecoder decodeObjectForKey:FANoteEntityKeyName];
        _noteItemEntityArray = [[aDecoder decodeObjectForKey:FANoteEntityKeyNoteItemEntityArray] mutableCopy];
        _status = (FANoteEntityStatusType)[[aDecoder decodeObjectForKey:FANoteEntityKeyNoteStatus] intValue];
        _finishedDateArray = [[aDecoder decodeObjectForKey:FANoteEntityKeyFinishedDateArray] mutableCopy];
        _coolDownForSuspend = [[aDecoder decodeObjectForKey:FANoteEntityKeyCoolDownForSuspend] doubleValue];
        _coolDownBetweenItems = [[aDecoder decodeObjectForKey:FANoteEntityKeyCoolDownBetweenItems] doubleValue];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:FANoteEntityKeyName];
    [aCoder encodeObject:self.noteItemEntityArray forKey:FANoteEntityKeyNoteItemEntityArray];
    [aCoder encodeObject:[NSNumber numberWithInt:self.status] forKey:FANoteEntityKeyNoteStatus];
    [aCoder encodeObject:self.finishedDateArray forKey:FANoteEntityKeyFinishedDateArray];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.coolDownForSuspend] forKey:FANoteEntityKeyCoolDownForSuspend];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.coolDownBetweenItems] forKey:FANoteEntityKeyCoolDownBetweenItems];
}
@end
