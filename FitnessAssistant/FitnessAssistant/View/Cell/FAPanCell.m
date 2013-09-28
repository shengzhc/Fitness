//
//  FAPanCell.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAPanCell.h"

@interface FAPanCell ()

@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation FAPanCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                        action:@selector(didRecognizerPanGestureRecognizer:)];
        _panGestureRecognizer.delegate = self;
        
        [self addGestureRecognizer:_panGestureRecognizer];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)setContentViewCenter:(CGPoint)center animated:(BOOL)animated { }
- (void)didRecognizerPanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer { }

@end
