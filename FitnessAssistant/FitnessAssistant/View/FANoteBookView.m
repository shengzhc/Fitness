//
//  FANoteBookView.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FANoteBookView.h"
#import "FANoteBookViewController.h"

@interface FANoteBookView ()

@property (nonatomic, strong) FANoteBookCell *interactiveCell;

@end

@implementation FANoteBookView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self) {
        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:_tableView];
       
        self.multipleTouchEnabled = NO;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark UITableViewDataSource & UITableViewDelegate
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[FARepository sharedRepository] numberOfNoteEntity];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FACell *cell = [FACellFactory cellForTableView:tableView cellType:CellTypeNoteBook];
    FANoteEntity *noteEntity = [[FARepository sharedRepository] noteEntityForIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = noteEntity.name;
    [cell setData:noteEntity delegate:self];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(FANoteBookViewController *)self.delegate presentNoteViewControllerWithNoteEntity:nil];
}

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#pragma mark Cell Delegate
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (void)didBeginInteractWithCell:(FACell *)cell
{
    if (!self.interactiveCell) {
        
        self.interactiveCell = (FANoteBookCell *)cell;
        return;
    }
    
    if (self.interactiveCell != cell) {
        
        [self.interactiveCell restoreCellAnimated:YES];
        self.interactiveCell = (FANoteBookCell *)cell;
    }
}

- (void)editButtonClickedAtCell:(FACell *)cell
{
    int indexOfCell = [self.tableView indexPathForCell:cell].row;
    FANoteEntity *noteEntity = [[FARepository sharedRepository] noteEntityForIndex:indexOfCell];
    [(FANoteBookViewController *)self.delegate popupCoverViewInWithType:EDIT withNoteEntity:noteEntity];
}

- (void)deleteButtonClickedAtCell:(FACell *)cell
{
    [[FARepository sharedRepository] deleteNoteEntity:cell.data];
    [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:cell]] withRowAnimation:UITableViewRowAnimationTop];
}

- (void)activateQuickStartAtCell:(FACell *)cell
{
    [(FANoteBookViewController *)self.delegate presentClockViewControllerWithNoteEntity:nil];
}

@end
