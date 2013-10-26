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

@property (nonatomic, strong) FANoteView *view;

@property (nonatomic, strong) FANoteEntity *noteEntity;
@property (nonatomic, strong) UIButton *addButton;

@end

@implementation FANoteViewController

- (id)initWithNoteEntity:(FANoteEntity *)noteEntity delegate:(id)delegate
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
        [_addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view updateWithNoteEntity:noteEntity];
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FANoteEntity *noteEntity = (FANoteEntity *)self.noteEntity;
    self.title = noteEntity.name;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.addButton];
}

- (Class)viewClass
{
    return [FANoteView class];
}

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Convenient
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)deleteNoteItemEntityAtIndex:(NSIndexPath *)indexPath
{
    [self.noteEntity.noteItemEntityArray removeObjectAtIndex:indexPath.row];
    [[FARepository sharedRepository] updateNoteEntity:self.noteEntity];
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

- (void)addButtonClicked:(id)sender
{
    FANoteItemEntity *noteItemEntity = [[FANoteItemEntity alloc] init];
    [self presentDetailViewControllerWithNoteItemEntity:noteItemEntity];
}

- (void)presentDetailViewControllerWithNoteItemEntity:(FANoteItemEntity *)noteItemEntity
{
    FANoteDetailViewController *detailViewController = [[FANoteDetailViewController alloc] initWithDelegate:self noteItemEntity:noteItemEntity];
    [self.navigationController presentViewController:detailViewController
                                            animated:YES
                                          completion:nil];
}

- (void)doneButtonClicked:(id)object
{
    if ([object isKindOfClass:[FANoteItemEntity class]]) {
        if (![self.noteEntity.noteItemEntityArray containsObject:object]) {
            [self.noteEntity.noteItemEntityArray addObject:object];
            [self.view.tableView reloadData];
        }
        
        [[FARepository sharedRepository] updateNoteEntity:self.noteEntity];
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
