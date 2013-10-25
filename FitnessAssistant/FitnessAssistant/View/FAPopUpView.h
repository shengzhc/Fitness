//
//  FAPopUpView.h
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 9/29/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAView.h"
#define DismissNewNoteView @"DissmissNewNoteView"
#define EmptyString @""

typedef enum PopupViewType:NSInteger{
    NEW = 0,
    EDIT
} popupViewType;

@interface FAPopUpView : FAView

- (id)initWithType:(popupViewType)type noteEntity:(FANoteEntity *)noteEntity;
- (void)dismiss;

@property UITextField *nameTextField;

@end
