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
@property UIButton *doneButton;

@end

@implementation FAPopUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0f;
        
        _closeButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup-close.png"]
                                         highlightedImage:[UIImage imageNamed:@"popup-close-highlighted.png"]];
        [_closeButton sizeToFit];
        [self addSubview:_closeButton];
        
        _longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(gestureHandler:)];
        _longPressGestureRecognizer.minimumPressDuration = 0.01f;
        //Default value - (Yes) will block the touchEvent to the button & textfield on it.
        _longPressGestureRecognizer.cancelsTouchesInView = NO;
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
        [_doneButton sizeToFit];
        [self addSubview:_doneButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [self.closeButton setCenter:CGPointMake(0.0, 0.0)];
    
    [self.nameTextField setFrame:CGRectMake(0, 0, 150, 30)];
    [self.nameTextField setCenter:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2)];
    [self.nameTextField becomeFirstResponder];
    
    [self.nameLabel setCenter:CGPointMake(self.nameTextField.center.x, self.nameTextField.center.y - 40)];
    [self.doneButton setCenter:CGPointMake(self.nameTextField.center.x, self.nameTextField.center.y + 40)];
}

- (void)doneButtonHandler:(UIButton *)sender
{    
    if ([self.nameTextField.text isEqual:EmptyString]) {
        [self shakeSelf];
    }else{
        [self dismiss];
    }
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
    [[NSNotificationCenter defaultCenter] postNotificationName:DismissNewNoteView object:self];
}

- (void)shakeSelf
{
    CGPoint center = self.center;
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        self.center = CGPointMake(self.center.x - 10, self.center.y);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.07 animations:^{
            self.center = CGPointMake(self.center.x + 20, self.center.y);
        } completion:^(BOOL finished) {
            [self setCenter:center];
        }];
    }];
}

@end
