//
//  FANoteDetailViewController.m
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 10/21/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteDetailViewController.h"
#import "FANoteDetailView.h"

@interface FANoteDetailViewController ()

@end

@implementation FANoteDetailViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissDetailView)
                                                     name:@"cancelDetail"
                                                   object:nil];
    }
    return self;
}

- (Class)viewClass
{
    return [FANoteDetailView class];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64)];
    [self.view addSubview:navigationBar];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissDetailView)];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDetailView)];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"Detail"];
    navigationItem.leftBarButtonItem = cancel;
    navigationItem.rightBarButtonItem = done;
    
    navigationBar.items = [NSArray arrayWithObjects:navigationItem, nil];
}

- (void)dismissDetailView
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismiss Detail View.");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
