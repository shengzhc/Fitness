//
//  FANoteBookCell.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAPanCell.h"

@protocol FANoteBookCellDelegate <NSObject>

- (void)editButtonClickedAtCell:(FACell *)cell;
- (void)deleteButtonClickedAtCell:(FACell *)cell;
- (void)activateQuickStartAtCell:(FACell *)cell;

@optional

- (void)didBeginInteractWithCell:(FACell *)cell;

@end

@interface FANoteBookCell : FAPanCell

@property (nonatomic, strong) id < FANoteBookCellDelegate > delgate;

@end
