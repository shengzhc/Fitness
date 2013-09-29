//
//  FANoteViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteViewController.h"
#import "FANoteBookViewController.h"

@interface FANoteViewController ()

@property (nonatomic, strong) id noteEntity;

@end

@implementation FANoteViewController

- (id)initWithNoteEntity:(id)noteEntity delegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self) {
        
        _noteEntity = noteEntity;
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

- (void)clockButtonClicked:(UIButton *)button
{
    [(FANoteBookViewController *)self.delegate presentClockViewControllerWithNoteEntity:self.noteEntity];
}
@end
