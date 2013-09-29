//
//  FANoteView.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteView.h"
#import "FANoteViewController.h"

@interface FANoteView ()

@property (nonatomic, strong) UIButton *clockButton;

@end

@implementation FANoteView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        _clockButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clockButton setTitle:@"START" forState:UIControlStateNormal];
        [_clockButton setBackgroundImage:[[UIImage imageNamed:@"orangeButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_clockButton setBackgroundImage:[[UIImage imageNamed:@"orangeButtonHighlight"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18) resizingMode:UIImageResizingModeStretch] forState:UIControlStateHighlighted];
        [_clockButton addTarget:self action:@selector(clockButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _clockButton.titleLabel.font = [UIFont fontWithSize:22];
        [self addSubview:_clockButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.clockButton.frame = [self.clockButton alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width - 10, 40) offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsHorizontalCenter | FAAlignmentOptionsBottom)];
}

- (void)clockButtonClicked:(UIButton *)button
{
    [(FANoteViewController *)self.delegate clockButtonClicked:button];
}

@end
