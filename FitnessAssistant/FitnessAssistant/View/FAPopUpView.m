//
//  FAPopUpView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAPopUpView.h"
#import <CoreGraphics/CoreGraphics.h>

#define CLOSERADIOUS 30.0

@interface FAPopUpView()

@property UIImageView *closeButton;
@property UILongPressGestureRecognizer *longPressGestureRecognizer;
@property UILabel *nameLabel;
@property UITextField *nameTextField;
@property UIButton *doneButton;

@end

@implementation FAPopUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0f;
        
        _closeButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup-close.png"] highlightedImage:[UIImage imageNamed:@"popup-close-highlighted.png"]];
        [self addSubview:_closeButton];
        
        _longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandler:)];
        _longPressGestureRecognizer.minimumPressDuration = 0.01f;
        [self addGestureRecognizer:_longPressGestureRecognizer];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"New Note";
        [_nameLabel sizeToFit];
        [self addSubview:_nameLabel];
        
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.layer.borderWidth = 1.0;
        _nameTextField.layer.borderColor = [UIColor blueColor].CGColor;
        [self addSubview:_nameTextField];
        
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_doneButton addTarget:self action:@selector(doneButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [self addSubview:_doneButton];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [self.closeButton sizeToFit];
    self.closeButton.center = CGPointMake(0.0, 0.0);  //Locate the close at the top left corner.
}

- (void)doneButtonHandler:(UIButton *)sender
{
    
}

- (void)gestureHandler:(UILongPressGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self];
    
    // The valid area is the pioints within the distance of CLOSERADIOUS
    if ((pow(location.x, 2) + pow(location.y, 2)) < pow(CLOSERADIOUS, 2)) {
        self.closeButton.highlighted = YES;
        if (recognizer.state == UIGestureRecognizerStateEnded) {
            [self dismiss];
        }
    } else {
        self.closeButton.highlighted = NO;
    }
}

- (void)dismiss
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FANewPopUpDone" object:self];
}

@end
