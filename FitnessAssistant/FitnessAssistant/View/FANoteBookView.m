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

@property (nonatomic, strong) UIButton *addNoteBtn;
@property (nonatomic, strong) UITableView *tableView;

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
        
        [self addSubview:_tableView];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FACell *cell = [FACellFactory cellForTableView:tableView cellType:CellTypeNoteBook];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%i", indexPath.row];
    [cell setData:nil delegate:self];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(FANoteBookViewController *)self.delegate presentNoteViewControllerWithNoteEntity:nil];
}

- (void)editButtonClickedAtCell:(FACell *)cell
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)deleteButtonClickedAtCell:(FACell *)cell
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)activateQuickStartAtCell:(FACell *)cell
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
