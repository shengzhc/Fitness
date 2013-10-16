//
//  FANoteDetailView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 10/14/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteDetailView.h"
#import <CoreGraphics/CoreGraphics.h>

#define VERTICALOFFSET 40
#define HORIZONOFFSET 10

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
        [nameLabel setTextAlignment:NSTextAlignmentRight];
        nameTextField = [[UITextField alloc] init];
        
        weightLabel = [[UILabel alloc] init];
        [weightLabel setTextAlignment:NSTextAlignmentRight];
        weightTextField = [[UITextField alloc] init];
        weightUnitSegment = [[UISegmentedControl alloc] initWithItems:@[@"Kg", @"lb"]];
        
        repsLabel = [[UILabel alloc] init];
        [repsLabel setTextAlignment:NSTextAlignmentRight];
        repsTextField = [[UITextField alloc] init];
        repsSlider = [[UISlider alloc] init];
        
        setsLabel = [[UILabel alloc] init];
        [setsLabel setTextAlignment:NSTextAlignmentRight];
        setsTextField = [[UITextField alloc] init];
        setsSlider = [[UISlider alloc] init];
        
        timeOfSetsLabel = [[UILabel alloc] init];
        [timeOfSetsLabel setTextAlignment:NSTextAlignmentRight];
        timeOfSetsTextField = [[UITextField alloc] init];
        timeOfSetsSlider = [[UISlider alloc] init];
        
        CDLabel = [[UILabel alloc] init];
        [CDLabel setTextAlignment:NSTextAlignmentRight];
        CDTextField = [[UITextField alloc] init];
        CDSlider = [[UISlider alloc] init];
        
        autoIncreaseLabel = [[UILabel alloc] init];
        [autoIncreaseLabel setTextAlignment:NSTextAlignmentRight];
        autoIncreaseWeightLabel = [[UILabel alloc] init];
        [autoIncreaseWeightLabel setTextAlignment:NSTextAlignmentRight];
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
//        [scrollView addSubview:autoIncreaseWeightSlider];
        
    }
    return self;
}

- (void)layoutSubviews
{
    scrollView.frame = CGRectInset(self.frame, 10, 10);
    
    nameLabel.text = @"Name";
    nameLabel.frame = CGRectMake(5, 5, 100, 25);
    nameTextField.frame = CGRectMake(CGRectGetMaxX(nameLabel.frame)+HORIZONOFFSET, CGRectGetMinY(nameLabel.frame), 150, CGRectGetHeight(nameLabel.frame));
    [self setBorderFor:nameTextField];
    
    weightLabel.text = @"Weight";
    weightLabel.frame = CGRectOffset(nameLabel.frame, 0, VERTICALOFFSET);
    weightTextField.frame = CGRectMake(CGRectGetMinX(nameTextField.frame), CGRectGetMinY(weightLabel.frame), 40, CGRectGetHeight(weightLabel.frame));//[self getRectWithVerticalOffset:nameTextField.frame];
    [self setBorderFor:weightTextField];
    weightUnitSegment.frame = CGRectMake(CGRectGetMaxX(weightTextField.frame)+HORIZONOFFSET, CGRectGetMinY(weightTextField.frame), 50, CGRectGetHeight(weightTextField.frame));
    
    repsLabel.text = @"Reps";
    repsLabel.frame = CGRectOffset(weightLabel.frame, 0, VERTICALOFFSET);
    repsTextField.frame = [self getRectWithVerticalOffset:weightTextField.frame];
    [self setBorderFor:repsTextField];
    repsSlider.frame = CGRectMake(CGRectGetMaxX(repsTextField.frame)+HORIZONOFFSET, CGRectGetMinY(repsTextField.frame), 100, CGRectGetHeight(repsTextField.frame));
    
    setsLabel.text = @"Sets";
    setsLabel.frame = CGRectOffset(repsLabel.frame, 0, VERTICALOFFSET);
    setsTextField.frame = [self getRectWithVerticalOffset:repsTextField.frame];
    [self setBorderFor:setsTextField];
    setsSlider.frame = [self getRectWithVerticalOffset:repsSlider.frame];
    
    timeOfSetsLabel.text = @"Time of Sets";
    timeOfSetsLabel.frame = CGRectOffset(setsLabel.frame, 0, VERTICALOFFSET);
    timeOfSetsTextField.frame = [self getRectWithVerticalOffset:setsTextField.frame];
    [self setBorderFor:timeOfSetsTextField];
    timeOfSetsSlider.frame = [self getRectWithVerticalOffset:setsSlider.frame];
    
    CDLabel.text = @"CoolDown";
    CDLabel.frame = CGRectOffset(timeOfSetsLabel.frame, 0, VERTICALOFFSET);
    CDTextField.frame = [self getRectWithVerticalOffset:timeOfSetsTextField.frame];
    [self setBorderFor:CDTextField];
    CDSlider.frame = [self getRectWithVerticalOffset:timeOfSetsSlider.frame];
    
    autoIncreaseLabel.text = @"Auto Increase";
    autoIncreaseLabel.frame = CGRectOffset(CDLabel.frame, 0, VERTICALOFFSET);
    autoIncreaseSwitch.frame = CGRectMake(CGRectGetMaxX(autoIncreaseLabel.frame)+HORIZONOFFSET, CGRectGetMinY(autoIncreaseLabel.frame), 50, CGRectGetHeight(autoIncreaseLabel.frame));
    
    autoIncreaseWeightLabel.text = @"Auto Weight";
    autoIncreaseWeightLabel.frame = CGRectOffset(autoIncreaseLabel.frame, 0, VERTICALOFFSET);
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame), CGRectGetMaxY(autoIncreaseWeightLabel.frame) + VERTICALOFFSET);
    
}

- (void)setBorderFor:(UITextField *)textField
{
    textField.layer.borderWidth = 0.8;
    textField.layer.borderColor = [UIColor blueColor].CGColor;
    textField.layer.cornerRadius = 4.0;
}

- (CGRect)getRectWithVerticalOffset:(CGRect)frame
{
    return CGRectOffset(frame, 0, VERTICALOFFSET);
}

@end
