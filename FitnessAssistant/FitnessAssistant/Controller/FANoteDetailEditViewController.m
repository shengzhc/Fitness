//
//  FANoteDetailEditViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteDetailEditViewController.h"

@interface FANoteDetailEditViewController ()

@end

@implementation FANoteDetailEditViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Note Detail";
}

- (Class)viewClass
{
    return [FANoteDetailEditView class];
}

@end
