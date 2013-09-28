//
//  FANoteBookCell.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteBookCell.h"

#define BUTTON_WIDTH 60.0f
#define TRANSITION_SPEED 200.0f

@interface FANoteBookCell ()

@property (nonatomic, strong) UIButton *editButton;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation FANoteBookCell {
    
    CGPoint _originContentCenter;
    CGPoint _leftBoundaryCenter;
    CGPoint _rightBoundaryCenter;
    CGPoint _cBoundCenter;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_editButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_editButton setBackgroundColor:[UIColor colorWithRed:144/255.0 green:166/255.0 blue:58/255.0 alpha:1.0]];
        [_editButton setTitle:@"EDIT" forState:UIControlStateNormal];
        [_editButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _editButton.titleLabel.font = [UIFont boldFontWithSize:16];
        _editButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_deleteButton setBackgroundColor:[UIColor colorWithRed:179/255.0 green:52/255.0 blue:28/255.0 alpha:1.0]];
        [_deleteButton setTitle:@"DELETE" forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _deleteButton.titleLabel.font = [UIFont boldFontWithSize:16];
        _deleteButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView.superview insertSubview:_editButton belowSubview:self.contentView];
        [self.contentView.superview insertSubview:_deleteButton belowSubview:self.contentView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat edgeLength = self.contentView.bounds.size.height;
    
    self.deleteButton.frame = [self.deleteButton alignedRectInSuperviewForSize:CGSizeMake(BUTTON_WIDTH, edgeLength) offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsHorizontalCenter | FAAlignmentOptionsRight)];
    self.editButton.frame = [self.editButton alignedRectInSuperviewForSize:CGSizeMake(BUTTON_WIDTH, edgeLength) offset:CGSizeMake(BUTTON_WIDTH, 0) options:(FAAlignmentOptionsHorizontalCenter | FAAlignmentOptionsRight)];
    
    _cBoundCenter = CGPointMake(CGRectGetMidX(self.contentView.bounds), CGRectGetMidY(self.contentView.bounds));
    
    _leftBoundaryCenter = CGPointMake(_cBoundCenter.x - BUTTON_WIDTH * 2.0, _cBoundCenter.y);
    _rightBoundaryCenter = CGPointMake(_cBoundCenter.x + self.bounds.size.width - BUTTON_WIDTH * 2.0, _cBoundCenter.y);
}

- (void)didRecognizerPanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint transitionInView = [panGestureRecognizer translationInView:self.contentView];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        _originContentCenter = self.contentView.center;
        return;
    }
    
    CGPoint destContentCenter = CGPointMake(_originContentCenter.x + transitionInView.x, _originContentCenter.y);
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        [self setContentViewCenter:destContentCenter animated:NO];
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
        if (destContentCenter.x - _leftBoundaryCenter.x <= BUTTON_WIDTH) {
            
            [self setContentViewCenter:_leftBoundaryCenter animated:YES];
        }
        else if (_cBoundCenter.x - destContentCenter.x <= BUTTON_WIDTH) {
            
            [self setContentViewCenter:_cBoundCenter animated:YES];
        }
    }
}

- (void)setContentViewCenter:(CGPoint)center animated:(BOOL)animated
{
    if (center.x < _leftBoundaryCenter.x || center.x > _rightBoundaryCenter.x) {
        
        return;
    }
    
    if (!animated) {
        
        self.contentView.center = center;
    }
    else {
        
        CGFloat offset = fabsf(self.contentView.center.x - center.x);
        CGFloat duration = offset / TRANSITION_SPEED;
        
        [UIView animateWithDuration:duration delay:0.01
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^ {
                             
                             self.contentView.center = center;
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
    }
}

- (void)buttonClicked:(UIButton *)button
{
    if (button == self.editButton) {
        
        NSLog(@"Edit Button");
    }
    else if (button == self.deleteButton) {
        
        NSLog(@"Delete Button");
    }
    
}



@end
