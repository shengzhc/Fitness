//
//  FANoteBookViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteBookViewController.h"

@interface FANoteBookViewController ()

@end

@implementation FANoteBookViewController


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
    self.title = @"Note Book";
}

- (Class)viewClass
{
    return [FANoteBookView class];
}

@end
