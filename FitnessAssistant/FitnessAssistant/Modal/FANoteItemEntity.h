//
//  FANoteItemEntity.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/12/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    WeightUnitTypePound = 0,
    WeightUnitTypeKG
    
}WeightUnitType;

@interface FANoteItemEntity : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *weight;
@property (nonatomic, assign) WeightUnitType unit;
@property (nonatomic, strong) NSNumber *reps;
@property (nonatomic, strong) NSNumber *sets;
@property (nonatomic, strong) NSNumber *elapseTime;

// Total consuming time = timeOfSet * sets + (sets-1) * timeBetweenSets;
@property (nonatomic, strong) NSNumber *timeOfSet;
// unit should be second
@property (nonatomic, assign) NSTimeInterval timeBetweenSets;

@property (nonatomic, assign) BOOL isWeightAutoIncrement;

// The maximal times for increasing weight
@property (nonatomic, strong) NSNumber *countForWeightAutoIncrement;
@property (nonatomic, strong) NSNumber *weightAutoIncrement;

// How many time have the user worked on this item
@property (nonatomic, strong) NSNumber *countForNoteItem;

@end
