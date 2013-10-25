//
//  FAPopupCoverView.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAPopupCoverView.h"

@interface FAPopupCoverView()

//iOS 7 New Feature - Gravity.
@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;

@end

@implementation FAPopupCoverView{
    popupViewType popupType;
    FANoteEntity *entity;
}

- (id)initWithFrame:(CGRect)frame
               type:(popupViewType)type
         noteEntity:(FANoteEntity *)noteEntity
{
    self = [super initWithFrame:frame];
    if (self) {
        popupType = type;
        entity = noteEntity;
        [self initSelfWithType:popupType];
    }
    return self;
}

- (void)initSelfWithType:(popupViewType)type
{
    _popupView = [[FAPopUpView alloc] initWithType:type noteEntity:entity];
    [self addSubview:_popupView];
}

- (void)layoutSubviews
{
    self.popupView.frame = CGRectMake(self.center.x - 100, 0, 200, 150);
    [self addGravityToPopup];
    [self setAlpha:0.5 withDuration:0.5];
}

- (void)addGravityToPopup
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.popupView]];
    self.gravity.magnitude = 2.5f;
    [self.animator addBehavior:self.gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.popupView]];
    [self.animator addBehavior:collision];
    
    float boundary = self.frame.size.height/2;
    CGPoint startPoint = CGPointMake(0.0, boundary);
    CGPoint endPoint = CGPointMake(self.frame.size.width, boundary);
    [collision addBoundaryWithIdentifier:@"boundary" fromPoint:startPoint toPoint:endPoint];
}

- (void)tapGestureHandler:(UITapGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [[NSNotificationCenter defaultCenter] postNotificationName:DismissNewNoteView object:self];
    }
}

- (void)setPopupviewType:(popupViewType)type withEntity:(FANoteEntity *)noteEntity
{
    popupType = type;
    entity = noteEntity;
}

- (void)reset
{
    [self initSelfWithType:popupType];
}

@end
