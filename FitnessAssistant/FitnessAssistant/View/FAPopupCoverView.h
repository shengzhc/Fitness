//
//  FAPopupCoverView.h
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FABlackCoverView.h"
#import "FAPopUpView.h"


@interface FAPopupCoverView : FABlackCoverView

@property FAPopUpView *popupView;

- (id)initWithFrame:(CGRect)frame
               type:(popupViewType)type
         noteEntity:(FANoteEntity *)noteEntity;
- (void)reset;
- (void)setPopupviewType:(popupViewType)type withEntity:(FANoteEntity *)noteEntity;

@end
