//
//  FANoteBookViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteBookViewController.h"
#import "FAStatisticViewController.h"

@interface FANoteBookViewController ()

@property (nonatomic, strong) UIButton *menuBtn;
@property (nonatomic, strong) UIButton *statisticBtn;
@property (nonatomic, strong) FAStatisticViewController *statisticViewController;

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
        
        _statisticBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_statisticBtn setTitle:@"Statistic" forState:UIControlStateNormal];
        [_statisticBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_statisticBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _statisticBtn.titleLabel.font = [UIFont fontWithSize:16];
        [_statisticBtn addTarget:self action:@selector(statisticBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_statisticBtn sizeToFit];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Note Book";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.menuBtn];
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:self.statisticBtn]];
}

- (Class)viewClass
{
    return [FANoteBookView class];
}

- (FAStatisticViewController *)statisticViewController
{
    if (!_statisticViewController) {
        
        _statisticViewController = [[FAStatisticViewController alloc] initWithDelegate:self];
    }
    
    return _statisticViewController;
}

- (void)menuBtnClicked:(UIButton *)sender
{
    
}

- (void)statisticBtnClicked:(UIButton *)sender
{
    [self.navigationController pushViewController:self.statisticViewController animated:YES];
}
@end
