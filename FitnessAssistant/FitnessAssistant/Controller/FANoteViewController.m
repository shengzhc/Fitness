//
//  FANoteViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteViewController.h"

@interface FANoteViewController ()

@end

@implementation FANoteViewController

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
    self.title = @"Note";
}

- (Class)viewClass
{
    return [FANoteView class];
}

@end
