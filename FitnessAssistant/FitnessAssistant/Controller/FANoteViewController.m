//
//  FANoteViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteViewController.h"
#import "FANoteBookViewController.h"
#import "FANoteDetailViewController.h"

@interface FANoteViewController ()

@property (nonatomic, strong) id noteEntity;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) FANoteDetailViewController *noteDetailViewController;

@end

@implementation FANoteViewController

- (id)initWithNoteEntity:(id)noteEntity delegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self) {
        
        _noteEntity = noteEntity;
        
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setTitle:@"New" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _addButton.titleLabel.font = [UIFont fontWithSize:16];
        [_addButton sizeToFit];
        [_addButton addTarget:self action:@selector(addButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Note";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.addButton];
}

- (Class)viewClass
{
    return [FANoteView class];
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Button
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)clockButtonClicked:(UIButton *)button
{
    [(FANoteBookViewController *)self.delegate presentClockViewControllerWithNoteEntity:self.noteEntity];
}

- (void)addButtonClicked
{
    [self presentDetailViewController];
}

- (void)presentDetailViewController
{
    self.noteDetailViewController = [[FANoteDetailViewController alloc] init];
    [self.navigationController presentViewController:self.noteDetailViewController animated:YES completion:^{
        NSLog(@"Done");
    }];
}
@end
