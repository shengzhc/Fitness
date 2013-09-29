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
    }
    return self;
}

- (void)layoutSubviews
{
    [self.closeButton sizeToFit];
    self.closeButton.center = CGPointMake(0.0, 0.0);  //Locate the close at the top left corner.
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
    
    [UIView animateWithDuration:0.5f animations:^{
        self.center = CGPointMake(self.center.x, self.superview.frame.origin.y - self.frame.size.height/2);
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
        [self removeFromSuperview];
    } ];
}

@end
