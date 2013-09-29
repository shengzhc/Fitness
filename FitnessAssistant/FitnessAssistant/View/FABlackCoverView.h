//
//  FABlackCoverView.h
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAView.h"

@interface FABlackCoverView : FAView

- (void)setBackgroundColor:(UIColor *)backgroundColor withDuration:(float)time;
- (void)setAlpha:(CGFloat)alpha withDuration:(float)time;
- (void)removeBackgroundWithDuration:(float)time;

@end
