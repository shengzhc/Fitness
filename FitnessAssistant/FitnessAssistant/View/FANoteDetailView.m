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
    
    UIButton *doneButton;
    UIButton *cancelButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
        
        scrollView = [[UIScrollView alloc] init];
        [self addSubview:scrollView];
        scrollView.backgroundColor = [UIColor clearColor];

        nameLabel = [[UILabel alloc] init];
        [nameLabel setTextAlignment:NSTextAlignmentRight];
        nameLabel.text = @"Name";
        [scrollView addSubview:nameLabel];
       
        nameTextField = [[UITextField alloc] init];
        [scrollView addSubview:nameTextField];

        weightLabel = [[UILabel alloc] init];
        [weightLabel setTextAlignment:NSTextAlignmentRight];
        weightLabel.text = @"Weight";
        [scrollView addSubview:weightLabel];
        
        weightTextField = [[UITextField alloc] init];
        [scrollView addSubview:weightTextField];
        
        weightUnitSegment = [[UISegmentedControl alloc] initWithItems:@[@"Kg", @"lb"]];
        [scrollView addSubview:weightUnitSegment];
        
        repsLabel = [[UILabel alloc] init];
        [repsLabel setTextAlignment:NSTextAlignmentRight];
        repsLabel.text = @"Reps";
        [scrollView addSubview:repsLabel];

        repsTextField = [[UITextField alloc] init];
        [scrollView addSubview:repsTextField];

        repsSlider = [[UISlider alloc] init];
        [scrollView addSubview:repsSlider];
        
        setsLabel = [[UILabel alloc] init];
        [setsLabel setTextAlignment:NSTextAlignmentRight];
        setsLabel.text = @"Sets";
        [scrollView addSubview:setsLabel];

        setsTextField = [[UITextField alloc] init];
        [scrollView addSubview:setsTextField];

        setsSlider = [[UISlider alloc] init];
        [scrollView addSubview:setsSlider];
        
        timeOfSetsLabel = [[UILabel alloc] init];
        [timeOfSetsLabel setTextAlignment:NSTextAlignmentRight];
        timeOfSetsLabel.text = @"Time of Sets";
        [scrollView addSubview:timeOfSetsLabel];

        timeOfSetsTextField = [[UITextField alloc] init];
        [scrollView addSubview:timeOfSetsTextField];

        timeOfSetsSlider = [[UISlider alloc] init];
        [scrollView addSubview:timeOfSetsSlider];
        
        CDLabel = [[UILabel alloc] init];
        [CDLabel setTextAlignment:NSTextAlignmentRight];
        CDLabel.text = @"CoolDown";
        [scrollView addSubview:CDLabel];

        CDTextField = [[UITextField alloc] init];
        [scrollView addSubview:CDTextField];

        CDSlider = [[UISlider alloc] init];
        [scrollView addSubview:CDSlider];
        
        autoIncreaseLabel = [[UILabel alloc] init];
        [autoIncreaseLabel setTextAlignment:NSTextAlignmentRight];
        autoIncreaseLabel.text = @"Auto Increase";
        [scrollView addSubview:autoIncreaseLabel];

        autoIncreaseWeightLabel = [[UILabel alloc] init];
        [autoIncreaseWeightLabel setTextAlignment:NSTextAlignmentRight];
        autoIncreaseWeightLabel.text = @"Auto Weight";
        [scrollView addSubview:autoIncreaseWeightLabel];

        autoIncreaseWeightTextField = [[UITextField alloc] init];
        [scrollView addSubview:autoIncreaseWeightTextField];

        autoIncreaseSwitch = [[UISwitch alloc] init];
        [scrollView addSubview:autoIncreaseSwitch];

        autoIncreaseWeightSlider = [[UISlider alloc] init];
        [scrollView addSubview:autoIncreaseWeightSlider];
        
        cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [scrollView addSubview:cancelButton];
        
        doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [doneButton addTarget:self action:@selector(doneButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [doneButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [doneButton  setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [scrollView addSubview:doneButton];
    }
    return self;
}

- (void)layoutSubviews
{
    scrollView.frame = CGRectInset(self.bounds, 5, 30);
    scrollView.backgroundColor = [UIColor clearColor];
    
    nameLabel.frame = CGRectMake(15, 5, 100, 25);
    nameTextField.frame = CGRectMake(CGRectGetMaxX(nameLabel.frame)+HORIZONOFFSET, CGRectGetMinY(nameLabel.frame), 150, CGRectGetHeight(nameLabel.frame));
    [self setBorderFor:nameTextField];
    
    weightLabel.frame = CGRectOffset(nameLabel.frame, 0, VERTICALOFFSET);
    weightTextField.frame = CGRectMake(CGRectGetMinX(nameTextField.frame), CGRectGetMinY(weightLabel.frame), 40, CGRectGetHeight(weightLabel.frame));//[self getRectWithVerticalOffset:nameTextField.frame];
    [self setBorderFor:weightTextField];
    weightUnitSegment.frame = CGRectMake(CGRectGetMaxX(weightTextField.frame)+HORIZONOFFSET, CGRectGetMinY(weightTextField.frame), 50, CGRectGetHeight(weightTextField.frame));
    
    repsLabel.frame = CGRectOffset(weightLabel.frame, 0, VERTICALOFFSET);
    repsTextField.frame = [self getRectWithVerticalOffset:weightTextField.frame];
    [self setBorderFor:repsTextField];
    repsSlider.frame = CGRectMake(CGRectGetMaxX(repsTextField.frame)+HORIZONOFFSET, CGRectGetMinY(repsTextField.frame), 100, CGRectGetHeight(repsTextField.frame));
    
    setsLabel.frame = CGRectOffset(repsLabel.frame, 0, VERTICALOFFSET);
    setsTextField.frame = [self getRectWithVerticalOffset:repsTextField.frame];
    [self setBorderFor:setsTextField];
    setsSlider.frame = [self getRectWithVerticalOffset:repsSlider.frame];
    
    timeOfSetsLabel.frame = CGRectOffset(setsLabel.frame, 0, VERTICALOFFSET);
    timeOfSetsTextField.frame = [self getRectWithVerticalOffset:setsTextField.frame];
    [self setBorderFor:timeOfSetsTextField];
    timeOfSetsSlider.frame = [self getRectWithVerticalOffset:setsSlider.frame];
    
    CDLabel.frame = CGRectOffset(timeOfSetsLabel.frame, 0, VERTICALOFFSET);
    CDTextField.frame = [self getRectWithVerticalOffset:timeOfSetsTextField.frame];
    [self setBorderFor:CDTextField];
    CDSlider.frame = [self getRectWithVerticalOffset:timeOfSetsSlider.frame];
    
    autoIncreaseLabel.frame = CGRectOffset(CDLabel.frame, 0, VERTICALOFFSET);
    [autoIncreaseLabel sizeToFit];
    autoIncreaseSwitch.frame = CGRectMake(CGRectGetMaxX(autoIncreaseLabel.frame)+HORIZONOFFSET, CGRectGetMinY(autoIncreaseLabel.frame), 50, CGRectGetHeight(autoIncreaseLabel.frame));
    
    autoIncreaseWeightLabel.frame = CGRectOffset(CDLabel.frame, 0, VERTICALOFFSET*2);
    autoIncreaseWeightTextField.frame = CGRectOffset(CDTextField.frame, 0, VERTICALOFFSET*2);
    [self setBorderFor:autoIncreaseWeightTextField];
    
    autoIncreaseWeightSlider.frame = CGRectOffset(CDSlider.frame, 0, VERTICALOFFSET*2);
    
    cancelButton.frame = CGRectMake(40, CGRectGetMaxY(autoIncreaseWeightLabel.frame)+50, 80, 30);
    cancelButton.layer.cornerRadius = 6.0;
    doneButton.frame = CGRectOffset(cancelButton.frame, 140, 0);
    doneButton.layer.cornerRadius = 6.0;
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame), CGRectGetMaxY(doneButton.frame) + VERTICALOFFSET);
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

- (void)cancelButtonHandler:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelDetail" object:self];
}

- (void)doneButtonHandler:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelDetail" object:self];
}

@end
