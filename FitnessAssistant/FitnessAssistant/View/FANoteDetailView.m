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

@interface FANoteDetailView ()

@property (nonatomic, strong) FANoteItemEntity *noteItemEntity;

@end

@implementation FANoteDetailView {
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

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = [super initWithFrame:frame delegate:delegate];
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
        
        weightUnitSegment = [[UISegmentedControl alloc] initWithItems:@[@"Lb", @"Kg"]];
        [weightUnitSegment setSelectedSegmentIndex:0];
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
    }
    return self;
}

- (void)layoutSubviews
{
    scrollView.frame =   CGRectMake(0, 64, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - 64);
    scrollView.backgroundColor = [UIColor clearColor];
    
    nameLabel.frame = CGRectMake(15, 30, 100, 25);
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
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame), CGRectGetMaxY(autoIncreaseWeightSlider.frame) + VERTICALOFFSET);
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

- (void)updateWithNoteItemEntity:(FANoteItemEntity *)noteItemEntity
{
    self.noteItemEntity = noteItemEntity;
    nameTextField.text = self.noteItemEntity.name;
    weightTextField.text = [NSString stringWithFormat:@"%@", self.noteItemEntity.weight];
    weightUnitSegment.selected = self.noteItemEntity.unit == WeightUnitTypeKG ? NO : YES;
    repsTextField.text = [self.noteItemEntity.reps stringValue];
    repsSlider.value = [self.noteItemEntity.reps floatValue];
    setsTextField.text = [self.noteItemEntity.sets stringValue];
    setsSlider.value = [self.noteItemEntity.sets floatValue];
    timeOfSetsTextField.text = [self.noteItemEntity.timeOfSet stringValue];
    timeOfSetsSlider.value = [self.noteItemEntity.timeOfSet floatValue];
    CDTextField.text = [NSString stringWithFormat:@"%f", self.noteItemEntity.timeBetweenSets];
    CDSlider.value = self.noteItemEntity.timeBetweenSets;
    autoIncreaseSwitch.selected = self.noteItemEntity.isWeightAutoIncrement;
    autoIncreaseWeightTextField.text = [self.noteItemEntity.weightAutoIncrement stringValue];
    autoIncreaseWeightSlider.value = [self.noteItemEntity.weightAutoIncrement floatValue];
    
}

- (void)updateNoteItemEntity
{
    self.noteItemEntity.name = nameTextField.text;
    self.noteItemEntity.weight = [NSNumber numberWithFloat:[weightTextField.text floatValue]];
    self.noteItemEntity.unit = weightUnitSegment.selectedSegmentIndex == 0 ? WeightUnitTypePound : WeightUnitTypeKG;
    self.noteItemEntity.reps = [NSNumber numberWithFloat:repsSlider.value];
    self.noteItemEntity.sets = [NSNumber numberWithFloat:setsSlider.value];
    self.noteItemEntity.timeOfSet = [NSNumber numberWithFloat:timeOfSetsSlider.value];
    self.noteItemEntity.timeBetweenSets = CDSlider.value;
    self.noteItemEntity.isWeightAutoIncrement = autoIncreaseSwitch.selected;
    self.noteItemEntity.weightAutoIncrement = [NSNumber numberWithFloat:autoIncreaseWeightSlider.value];
}
@end
