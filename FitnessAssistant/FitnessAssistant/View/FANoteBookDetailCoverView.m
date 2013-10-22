//
//  FANoteBookDetailCoverView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 10/14/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteBookDetailCoverView.h"


@implementation FANoteBookDetailCoverView{
    FANoteDetailView *noteDetailView;
    DetailViewType detailViewType;
}

- (id)initWithFrame:(CGRect)frame
           withType:(DetailViewType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        detailViewType = type;
        noteDetailView = [[FANoteDetailView alloc] initWithType:type];
        [self addSubview:noteDetailView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reset) name:@"cancelDetail" object:Nil];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    noteDetailView.frame = CGRectInset(self.frame, 10.0, 20.0);
}

- (void)comeIn
{
    [UIView animateWithDuration:0.5f animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        noteDetailView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    }];
}

- (void)reset
{
    [UIView animateWithDuration:0.5f animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        noteDetailView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    } completion:^(BOOL finished) {
        [noteDetailView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
