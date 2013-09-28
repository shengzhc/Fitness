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
@property (nonatomic, strong) UIImageView *quickStartImageView;
@property (nonatomic, strong) UILabel *quickStartLabel;

@end

@implementation FANoteBookCell {
    
    CGPoint _originContentCenter;
    CGPoint _leftBoundaryCenter;
    CGPoint _rightBoundaryCenter;
    CGPoint _cBoundCenter;
    
    CGFloat _panGestureVelocity;
    BOOL _isPanning;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_editButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_editButton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:200/255.0 blue:0/255.0 alpha:0.8]];
        [_editButton setTitle:@"EDIT" forState:UIControlStateNormal];
        [_editButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _editButton.titleLabel.font = [UIFont boldFontWithSize:16];
        _editButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_deleteButton setBackgroundColor:[UIColor colorWithRed:230/255.0 green:0/255.0 blue:0/255.0 alpha:0.8]];
        [_deleteButton setTitle:@"DELETE" forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _deleteButton.titleLabel.font = [UIFont boldFontWithSize:16];
        _deleteButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        _quickStartImageView = [[UIImageView alloc] init];
        _quickStartImageView.backgroundColor = [UIColor redColor];
        
        _quickStartLabel = [UILabel labelWithFrame:CGRectZero
                                              text:@"Starting..."
                                         alignment:NSTextAlignmentCenter
                                              font:[UIFont fontWithSize:26]
                                         textColor:[UIColor blackColor]];
        [_quickStartLabel sizeToFit];
        [_quickStartImageView addSubview:_quickStartLabel];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView.superview insertSubview:_editButton belowSubview:self.contentView];
        [self.contentView.superview insertSubview:_deleteButton belowSubview:self.contentView];
        [self.contentView.superview insertSubview:_quickStartImageView belowSubview:self.contentView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat edgeLength = self.contentView.bounds.size.height;
    
    self.deleteButton.frame = [self.deleteButton alignedRectInSuperviewForSize:CGSizeMake(BUTTON_WIDTH, edgeLength) offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsVerticalCenter | FAAlignmentOptionsRight)];
    self.editButton.frame = [self.editButton alignedRectInSuperviewForSize:CGSizeMake(BUTTON_WIDTH, edgeLength) offset:CGSizeMake(BUTTON_WIDTH, 0) options:(FAAlignmentOptionsVerticalCenter | FAAlignmentOptionsRight)];
    self.quickStartImageView.frame = [self.quickStartImageView alignedRectInSuperviewForSize:CGSizeMake(self.contentView.bounds.size.width - BUTTON_WIDTH * 2.0, self.contentView.bounds.size.height - 2) offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsVerticalCenter | FAAlignmentOptionsLeft)];
    self.quickStartLabel.frame = [self.quickStartLabel alignedRectInSuperviewForSize:self.quickStartLabel.bounds.size offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsHorizontalCenter | FAAlignmentOptionsVerticalCenter)];
    
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
        
        _panGestureVelocity = fabs([panGestureRecognizer velocityInView:self.contentView].x);
        
        if (destContentCenter.x - _leftBoundaryCenter.x <= BUTTON_WIDTH) {
            
            [self setContentViewCenter:_leftBoundaryCenter animated:YES];
        }
        else if (_cBoundCenter.x - destContentCenter.x >=0 &&  _cBoundCenter.x - destContentCenter.x <= BUTTON_WIDTH) {
            
            [self setContentViewCenter:_cBoundCenter animated:YES];
        }
        else if ((destContentCenter.x - _cBoundCenter.x) > self.quickStartLabel.horizontalEnding) {
            
            [self setContentViewCenter:_rightBoundaryCenter animated:YES];
        }
        else {
            
            [self setContentViewCenter:_cBoundCenter animated:YES];
        }
    }
}

- (void)setContentViewCenter:(CGPoint)center animated:(BOOL)animated
{
    if (center.x < _leftBoundaryCenter.x || center.x > _rightBoundaryCenter.x) {
        
        return;
    }
    
    CGFloat destAlaph = 0.0;
    
    if (center.x > _cBoundCenter.x) {
        
        destAlaph = 0.2 + (center.x - _cBoundCenter.x) / self.quickStartLabel.horizontalEnding * 0.8;
        if (destAlaph > 1.0) {
            destAlaph = 1.0;
        }
    }
    else {
        destAlaph = 0.2;
    }
    
    if (!animated) {
        
        self.contentView.center = center;
        self.quickStartImageView.alpha = destAlaph;
        self.quickStartLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:destAlaph];
    }
    else {
        
        CGFloat offset = fabsf(self.contentView.center.x - center.x);
        CGFloat speed = TRANSITION_SPEED > _panGestureVelocity ? TRANSITION_SPEED : _panGestureVelocity;
        CGFloat duration = offset / speed;
        
        if (duration > 0.15) {
            duration = 0.15f;
        }
        
        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^ {
                             
                             self.contentView.center = center;
                             self.quickStartImageView.alpha = destAlaph;
                             self.quickStartLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:destAlaph];
                         }
                         completion:^(BOOL finished) {
                             
                             if (destAlaph == 1.0) {

                                 [self.delegate activateQuickStartAtCell:self];
                             }
                         }];
    }
}

- (void)buttonClicked:(UIButton *)button
{
    [self setContentViewCenter:_cBoundCenter animated:YES];
    
    if (button == self.editButton) {
        
        [self.delegate performSelector:@selector(editButtonClickedAtCell:) withObject:self];
    }
    else if (button == self.deleteButton) {
        
        [self.delegate performSelector:@selector(deleteButtonClickedAtCell:) withObject:self];
    }
    
}



@end
