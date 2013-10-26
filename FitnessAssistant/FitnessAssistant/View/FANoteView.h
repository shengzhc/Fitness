//
//  FANoteView.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAView.h"

@interface FANoteView : FAView < UITableViewDataSource, UITableViewDelegate, FANoteCellDelegate >

@property (nonatomic, strong) UITableView *tableView;

- (void)updateWithNoteEntity:(FANoteEntity *)noteEntity;

@end
