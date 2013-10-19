//
//  FANoteBookViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteBookViewController.h"
#import "FAStatisticViewController.h"
#import "FANoteViewController.h"
#import "FANoteClockViewController.h"
#import "FAPopupCoverView.h"
#import "FAMenuCoverView.h"

@interface FANoteBookViewController ()

@property (nonatomic, strong) FANoteBookView *view;
@property (nonatomic, strong) UIButton *menuBtn;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) FAStatisticViewController *statisticViewController;
@property FAPopupCoverView *popupCoverView;
@property FAMenuCoverView *menuCoverView;

@end

@implementation FANoteBookViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self) {
        
        _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_menuBtn setTitle:@"Menu" forState:UIControlStateNormal];
        [_menuBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_menuBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _menuBtn.titleLabel.font = [UIFont fontWithSize:16];
        [_menuBtn addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_menuBtn sizeToFit];
        
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setTitle:@"New" forState:UIControlStateNormal];
        [_addBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_addBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _addBtn.titleLabel.font = [UIFont fontWithSize:16];
        [_addBtn addTarget:self action:@selector(addBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_addBtn sizeToFit];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didUpdateNotes:) name:FARepositoryNotesUpdateNotification object:nil];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Note Book";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.menuBtn];
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:self.addBtn]];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:FARepositoryNotesUpdateNotification object:nil];
}

- (Class)viewClass
{
    return [FANoteBookView class];
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Convenience
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (FAStatisticViewController *)statisticViewController
{
    if (!_statisticViewController) {
        
        _statisticViewController = [[FAStatisticViewController alloc] initWithDelegate:self];
    }
    
    return _statisticViewController;
}

- (void)presentNoteViewControllerWithNoteEntity:(id)entity
{
    FANoteViewController *noteViewController = [[FANoteViewController alloc] initWithNoteEntity:entity delegate:self];
    [self.navigationController pushViewController:noteViewController animated:YES];
}

- (void)presentClockViewControllerWithNoteEntity:(id)entity
{
    FANoteClockViewController *noteClockViewController = [[FANoteClockViewController alloc] initWithNoteEntity:entity delegate:self];
    UINavigationController *modalNavController = [[UINavigationController alloc] initWithRootViewController:noteClockViewController];
    [self presentViewController:modalNavController animated:YES completion:^{
        [self.navigationController popToViewController:self animated:NO];
    }];
}

- (void)dismissClockViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didUpdateNotes:(NSNotification *)notification
{
    [self.view.tableView reloadData];
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Button
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)menuBtnClicked:(UIButton *)sender
{
    if (self.menuCoverView == nil) {
        self.menuCoverView = [[FAMenuCoverView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    } else {
        [self.menuCoverView reset];
    }
    
    
    [[UIApplication sharedApplication].windows[0] addSubview:self.menuCoverView];
    [self.menuCoverView comeIn];
}

- (void)addBtnClicked:(UIButton *)sender
{
//  Now work as New button.
//    FANoteEntity *noteEntity = [FANoteEntity defaultEntity];
//    [[FARepository sharedRepository] addNoteEntity:noteEntity];
//    [self.view.tableView reloadData];
//    return;
    
    if (self.popupCoverView == nil) {
        self.popupCoverView = [[FAPopupCoverView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    } else {
        [self.popupCoverView reset];
    }
    
    [[UIApplication sharedApplication].windows[0] addSubview:self.popupCoverView];
    
}
@end
