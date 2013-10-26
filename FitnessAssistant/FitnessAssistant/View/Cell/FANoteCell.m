//
//  FANoteCell.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteCell.h"

#define BOUNDARY_WIDTH 200.0f

@interface FANoteCell ()

@property (nonatomic, strong) UIImageView *deleteBarImageView;
@property (nonatomic, strong) UILabel *deleteLabel;

@end

@implementation FANoteCell {
    
    CGPoint _originContentCenter;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.contentView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        _deleteBarImageView = [[UIImageView alloc] init];
        _deleteBarImageView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:90.0/255.0 blue:50/255.0 alpha:1.0];
        _deleteLabel = [UILabel labelWithFrame:CGRectZero text:@"Deleting..." alignment:NSTextAlignmentCenter font:[UIFont boldFontWithSize:20] textColor:[UIColor whiteColor]];
        [_deleteBarImageView addSubview:_deleteLabel];
        [self.contentView.superview insertSubview:_deleteBarImageView belowSubview:self.contentView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = CGRectInset(self.contentView.frame, 0, 2);
    self.contentView.frame = frame;
    self.deleteBarImageView.frame = [self.deleteBarImageView alignedRectInSuperviewForSize:CGSizeMake(BOUNDARY_WIDTH, self.contentView.bounds.size.height) offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsRight | FAAlignmentOptionsVerticalCenter)];
    [self.deleteLabel sizeToFit];
    self.deleteLabel.frame = [self.deleteLabel alignedRectInSuperviewForSize:self.deleteLabel.bounds.size offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsHorizontalCenter | FAAlignmentOptionsVerticalCenter)];
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Gesture Recognizer
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)didRecognizerPanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint transitionInView = [panGestureRecognizer translationInView:self.contentView];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        _originContentCenter = self.contentView.center;
        
        if ([self.delegate respondsToSelector:@selector(didBeginInteractWithCell:)]) {
            
            [self.delegate performSelector:@selector(didBeginInteractWithCell:) withObject:self];
        }
        
        return;
    }
    
    CGPoint destContentCenter = CGPointMake(_originContentCenter.x + transitionInView.x, _originContentCenter.y);
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        [self setContentViewCenter:destContentCenter animated:NO];
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
        if (destContentCenter.x < _originContentCenter.x - BOUNDARY_WIDTH * 0.8) {
            
            [self.delegate shouldDeleteAtCell:self];
            return;
        }
        
        [self setContentViewCenter:_originContentCenter animated:YES];
    }
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Convenience
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)setContentViewCenter:(CGPoint)center animated:(BOOL)animated
{
    if (center.x > _originContentCenter.x || center.x < _originContentCenter.x - BOUNDARY_WIDTH) {
        return;
    }

    if (!animated) {
        self.contentView.center = center;
        CGFloat factor = fabs(_originContentCenter.x - center.x)/(BOUNDARY_WIDTH * 0.8);
        self.deleteBarImageView.backgroundColor = [UIColor colorWithRed:(220.0 - 60 * factor)/255.0 green:(90.0 - 30 * factor)/255.0 blue:(50 - 15 * factor)/255.0 alpha:1.0];
    }
    else {
        
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^ {
                             self.contentView.center = center;
                             self.deleteBarImageView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:90.0/255.0 blue:50/255.0 alpha:1.0];
                         }
                         completion:^(BOOL finished) {
                         }];
    }
}

@end
