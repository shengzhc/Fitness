//
//  FABlackCoverView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FABlackCoverView.h"

@implementation FABlackCoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor withDuration:(float)time
{
    [UIView animateWithDuration:time animations:^{
        self.backgroundColor = backgroundColor;
    }];
}

- (void)setAlpha:(CGFloat)alpha withDuration:(float)time{
    [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:alpha] withDuration:time];
}

- (void)removeBackgroundWithDuration:(float)time{
    [UIView animateWithDuration:time animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
