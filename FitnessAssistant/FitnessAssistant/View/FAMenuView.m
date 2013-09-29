//
//  FAMenuView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAMenuView.h"

@implementation FAMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.alpha = 0.8;
    }
    return self;
}

- (void)menuUp
{
    [UIView animateWithDuration:0.5f animations:^{
        self.center = CGPointMake(self.center.x, self.center.y - self.frame.size.height);
    }];
}

- (void)menuDown
{
    [UIView animateWithDuration:0.5f animations:^{
        self.center = CGPointMake(self.center.x, self.center.y + self.frame.size.height);
    }];
}

@end
