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

- (void)comeIn
{
    self.menuView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height - 125);
    [self setAlpha:0.5 withDuration:DURATIONTIME];
    [self.menuView menuUp];
}

- (void)reset
{
    self.menuView = [[FAMenuView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.menuView];

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
