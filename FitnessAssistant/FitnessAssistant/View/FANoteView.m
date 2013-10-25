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
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) FANoteCell *interactiveCell;

@end

@implementation FANoteView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self) {
        
        _datasource = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"]];
        
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
#pragma mark UITableViewDataSource & UITableViewDelegate
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FACell *cell = [FACellFactory cellForTableView:tableView cellType:CellTypeNote];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];
    [cell setData:nil delegate:self];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
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
    [self.datasource removeObjectAtIndex:indexPath.row];
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
