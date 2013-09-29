//
//  FANoteClockViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteClockViewController.h"
#import "FANoteBookViewController.h"

@interface FANoteClockViewController ()

@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) id noteEntity;

@end

@implementation FANoteClockViewController

- (id)initWithNoteEntity:(id)noteEntity delegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self) {
        
        _noteEntity = noteEntity;
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setTitle:@"Close" forState:UIControlStateNormal];
        [_closeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_closeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _closeButton.titleLabel.font = [UIFont fontWithSize:16];
        [_closeButton sizeToFit];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Note Clock";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.closeButton];
}

- (Class)viewClass
{
    return [FANoteClockView class];
}

- (void)closeButtonClicked:(id)sender
{
    [(FANoteBookViewController *)self.delegate dismissClockViewController];
}

@end
