//
//  FANoteItemEntity.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteItemEntity.h"

@implementation FANoteItemEntity

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        
        _name = [aDecoder decodeObjectForKey:FANoteItemEntityKeyName];
        _weight = [aDecoder decodeObjectForKey:FANoteItemEntityKeyWeight];
        _unit = (WeightUnitType)[[aDecoder decodeObjectForKey:FANoteItemEntityKeyUnitType] intValue];
        _reps = [aDecoder decodeObjectForKey:FANoteItemEntityKeyReps];
        _sets = [aDecoder decodeObjectForKey:FANoteItemEntityKeySets];
        _timeOfSet = [aDecoder decodeObjectForKey:FANoteItemEntityKeyTimeOfSet];
        _timeBetweenSets = [[aDecoder decodeObjectForKey:FANoteItemEntityKeyTimeBetweenSets] doubleValue];
        _isWeightAutoIncrement = [[aDecoder decodeObjectForKey:FANoteItemEntityKeyIsWeightAutoIncrement] boolValue];
        _countForWeightAutoIncrement = [aDecoder decodeObjectForKey:FANoteItemEntityKeyCountForWeightAutoIncrement];
        _weightAutoIncrement = [aDecoder decodeObjectForKey:FANoteItemEntityKeyWeightAutoIncrement];
        _countForNoteItem = [aDecoder decodeObjectForKey:FANoteItemEntityKeyCountForNoteItem];
        
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:FANoteItemEntityKeyName];
    [aCoder encodeObject:self.weight forKey:FANoteItemEntityKeyWeight];
    [aCoder encodeObject:[NSNumber numberWithInt:self.unit] forKey:FANoteItemEntityKeyUnitType];
    [aCoder encodeObject:self.reps forKey:FANoteItemEntityKeyReps];
    [aCoder encodeObject:self.sets forKey:FANoteItemEntityKeySets];
    [aCoder encodeObject:self.timeOfSet forKey:FANoteItemEntityKeyTimeOfSet];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.timeBetweenSets] forKey:FANoteItemEntityKeyTimeBetweenSets];
    [aCoder encodeObject:[NSNumber numberWithBool:self.isWeightAutoIncrement] forKey:FANoteItemEntityKeyIsWeightAutoIncrement];
    [aCoder encodeObject:self.countForWeightAutoIncrement forKey:FANoteItemEntityKeyCountForWeightAutoIncrement];
    [aCoder encodeObject:self.weightAutoIncrement forKey:FANoteItemEntityKeyWeightAutoIncrement];
    [aCoder encodeObject:self.countForNoteItem forKey:FANoteItemEntityKeyCountForNoteItem];
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[FANoteItemEntity class]]) {
        return [self.name isEqualToString:[object valueForKey:@"name"]];
    }
    
    return NO;
}

@end
