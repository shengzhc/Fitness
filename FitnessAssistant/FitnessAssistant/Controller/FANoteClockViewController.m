//
//  FANoteClockViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteClockViewController.h"

@interface FANoteClockViewController ()

@end

@implementation FANoteClockViewController

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
    self.title = @"Note Clock";
}

- (Class)viewClass
{
    return [FANoteClockView class];
}

@end
