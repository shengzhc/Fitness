//
//  FAMenuCoverView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAMenuCoverView.h"
#import "FAMenuView.h"

#define DURATIONTIME 0.5

@interface FAMenuCoverView()

@property FAMenuView *menuView;

@end

@implementation FAMenuCoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _menuView = [[FAMenuView alloc] initWithFrame:CGRectZero];
        [self addSubview:_menuView];
    }
    return self;
}

- (void)layoutSubviews
{
}

- (void)comeIn
{
    self.menuView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height - 125);
    
    [self setAlpha:0.5 withDuration:DURATIONTIME];
    [self.menuView menuUp];
    
//    [UIView animateWithDuration:DURATIONTIME animations:^{
//        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
//        //self.alpha = 0.5;
//        self.menuView.center = self.center;//CGPointMake(self.menuView.center.x, self.menuView.center.y - self.menuView.frame.size.height);
//    }];
    
}

- (void)reset
{
    
}

- (void)tapGestureHandler:(UITapGestureRecognizer *)recognizer
{
    [self dismiss];
}

- (void)dismiss
{
    [self setAlpha:0.0 withDuration:DURATIONTIME];
    [self.menuView menuDown];
}

@end
