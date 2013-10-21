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


@interface FAPopUpView : FAView

- (void)dismiss;
@property UITextField *nameTextField;

@end
