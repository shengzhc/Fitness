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

@property (nonatomic, strong) FANoteItemEntity *noteItemEntity;
@property (nonatomic, strong) FANoteDetailView *view;

@end

@implementation FANoteDetailViewController

- (id)initWithDelegate:(id)delegate noteItemEntity:(FANoteItemEntity *)noteItemEntity
{
    self = [super initWithDelegate:delegate];
    
    if (self) {

        _noteItemEntity = noteItemEntity;
        [self.view updateWithNoteItemEntity:_noteItemEntity];
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
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClicked:)];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClicked:)];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"Detail"];
    navigationItem.leftBarButtonItem = cancel;
    navigationItem.rightBarButtonItem = done;
    
    navigationBar.items = [NSArray arrayWithObjects:navigationItem, nil];
}

- (void)doneButtonClicked:(id)sender
{
    [self.view updateNoteItemEntity];
    
    if ([self.delegate respondsToSelector:@selector(doneButtonClicked:)]) {
        [self.delegate performSelector:@selector(doneButtonClicked:) withObject:self.noteItemEntity];
    }
}

- (void)cancelButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(cancelButtonClicked:)]) {
        [self.delegate performSelector:@selector(cancelButtonClicked:) withObject:nil];
    }
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
