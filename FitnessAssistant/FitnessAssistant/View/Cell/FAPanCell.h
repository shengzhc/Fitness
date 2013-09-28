//
//  FAPanCell.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FACell.h"

@interface FAPanCell : FACell < UIGestureRecognizerDelegate >

- (void)didRecognizerPanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;
- (void)setContentViewCenter:(CGPoint)center animated:(BOOL)animated;

@end
