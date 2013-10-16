//
//  FANoteDetailView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 10/14/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteDetailView.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation FANoteDetailView{
    UIScrollView *scrollView;
    
    UILabel *nameLabel;
    UITextField *nameTextField;
    
    UILabel *weightLabel;
    UITextField *weightTextField;
    UISegmentedControl *weightUnitSegment;
    
    UILabel *repsLabel;
    UITextField *repsTextField;
    UISlider *repsSlider;
    
    UILabel *setsLabel;
    UITextField *setsTextField;
    UISlider *setsSlider;
    
    UILabel *timeOfSetsLabel;
    UITextField *timeOfSetsTextField;
    UISlider *timeOfSetsSlider;
    
    UILabel *CDLabel;
    UITextField *CDTextField;
    UISlider *CDSlider;
    
    UILabel *autoIncreaseLabel;
    UISwitch *autoIncreaseSwitch;
    UILabel *autoIncreaseWeightLabel;
    UITextField *autoIncreaseWeightTextField;
    UISlider *autoIncreaseWeightSlider;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
        
        scrollView = [[UIScrollView alloc] init];
        
        nameLabel = [[UILabel alloc] init];
        nameTextField = [[UITextField alloc] init];
        
        weightLabel = [[UILabel alloc] init];
        weightTextField = [[UITextField alloc] init];
        weightUnitSegment = [[UISegmentedControl alloc] init];
        
        repsLabel = [[UILabel alloc] init];
        repsTextField = [[UITextField alloc] init];
        repsSlider = [[UISlider alloc] init];
        
        setsLabel = [[UILabel alloc] init];
        setsTextField = [[UITextField alloc] init];
        setsSlider = [[UISlider alloc] init];
        
        timeOfSetsLabel = [[UILabel alloc] init];
        timeOfSetsTextField = [[UITextField alloc] init];
        timeOfSetsSlider = [[UISlider alloc] init];
        
        CDLabel = [[UILabel alloc] init];
        CDTextField = [[UITextField alloc] init];
        CDSlider = [[UISlider alloc] init];
        
        autoIncreaseLabel = [[UILabel alloc] init];
        autoIncreaseWeightLabel = [[UILabel alloc] init];
        autoIncreaseWeightTextField = [[UITextField alloc] init];
        autoIncreaseSwitch = [[UISwitch alloc] init];
        autoIncreaseWeightSlider = [[UISlider alloc] init];
        
        [self addSubview:scrollView];
        [scrollView addSubview:nameLabel];
        [scrollView addSubview:nameTextField];
        [scrollView addSubview:weightLabel];
        [scrollView addSubview:weightTextField];
        [scrollView addSubview:weightUnitSegment];
        [scrollView addSubview:repsLabel];
        [scrollView addSubview:repsTextField];
        [scrollView addSubview:repsSlider];
        [scrollView addSubview:setsLabel];
        [scrollView addSubview:setsTextField];
        [scrollView addSubview:setsSlider];
        [scrollView addSubview:timeOfSetsLabel];
        [scrollView addSubview:timeOfSetsTextField];
        [scrollView addSubview:timeOfSetsSlider];
        [scrollView addSubview:CDLabel];
        [scrollView addSubview:CDTextField];
        [scrollView addSubview:CDSlider];
        [scrollView addSubview:autoIncreaseLabel];
        [scrollView addSubview:autoIncreaseSwitch];
        [scrollView addSubview:autoIncreaseWeightLabel];
        [scrollView addSubview:autoIncreaseWeightTextField];
        [scrollView addSubview:autoIncreaseWeightSlider];
        
    }
    return self;
}

@end
