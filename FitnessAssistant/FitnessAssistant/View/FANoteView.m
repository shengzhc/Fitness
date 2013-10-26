//
//  FANoteView.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteView.h"
#import "FANoteViewController.h"

@interface FANoteView ()

@property (nonatomic, strong) UIButton *clockButton;
@property (nonatomic, strong) FANoteCell *interactiveCell;
@property (nonatomic, strong) FANoteEntity *noteEntity;

@end

@implementation FANoteView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        _clockButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clockButton setTitle:@"START" forState:UIControlStateNormal];
        [_clockButton setBackgroundImage:[[UIImage imageNamed:@"orangeButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_clockButton setBackgroundImage:[[UIImage imageNamed:@"orangeButtonHighlight"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18) resizingMode:UIImageResizingModeStretch] forState:UIControlStateHighlighted];
        [_clockButton addTarget:self action:@selector(clockButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _clockButton.titleLabel.font = [UIFont fontWithSize:22];
        
        
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:_tableView];
        [self addSubview:_clockButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.clockButton.frame = [self.clockButton alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width - 10, 40) offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsHorizontalCenter | FAAlignmentOptionsBottom)];
    self.tableView.frame = [self.tableView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height - self.clockButton.bounds.size.height) offset:CGSizeMake(0, 0) options:(FAAlignmentOptionsHorizontalCenter | FAAlignmentOptionsTop)];
}

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Convenient
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)updateWithNoteEntity:(FANoteEntity *)noteEntity
{
    self.noteEntity = noteEntity;
    [self.tableView reloadData];
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark UITableViewDataSource & UITableViewDelegate
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.noteEntity.noteItemEntityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FACell *cell = [FACellFactory cellForTableView:tableView cellType:CellTypeNote];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    FANoteItemEntity *data = [self.noteEntity.noteItemEntityArray objectAtIndex:indexPath.row];
    cell.textLabel.text = data.name;
    [cell setData:data delegate:self];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(presentDetailViewControllerWithNoteItemEntity:)]) {
        
        [self.delegate performSelector:@selector(presentDetailViewControllerWithNoteItemEntity:)
                            withObject:nil];
    }
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Cell Delegate
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)clockButtonClicked:(UIButton *)button
{
    [(FANoteViewController *)self.delegate clockButtonClicked:button];
}

- (void)shouldDeleteAtCell:(FACell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self.delegate deleteNoteItemEntityAtIndex:indexPath];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didBeginInteractWithCell:(FACell *)cell
{
    if (!self.interactiveCell) {
        
        self.interactiveCell = (FANoteCell *)cell;
        return;
    }
    
    if (self.interactiveCell != cell) {
        
        [self.interactiveCell restoreCellAnimated:YES];
        self.interactiveCell = (FANoteCell *)cell;
    }
}

@end
