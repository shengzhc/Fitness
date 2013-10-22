//
//  FANoteViewController.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAViewController.h"
#import "FANoteView.h"


@interface FANoteViewController : FAViewController

- (id)initWithNoteEntity:(id)noteEntity delegate:(id)delegate;
- (void)clockButtonClicked:(UIButton *)button;
- (void)presentDetailViewController;

@end
