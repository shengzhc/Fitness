//
//  FANoteBookViewController.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAViewController.h"
#import "FANoteBookView.h"

@interface FANoteBookViewController : FAViewController

- (void)presentNoteViewControllerWithNoteEntity:(id)entity;
- (void)presentClockViewControllerWithNoteEntity:(id)entity;
- (void)dismissClockViewController;

@end
