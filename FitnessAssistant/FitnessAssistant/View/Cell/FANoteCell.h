//
//  FANoteCell.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAPanCell.h"

@protocol FANoteCellDelegate <NSObject>

- (void)editButtonClickedAtCell:(FACell *)cell;
- (void)deleteButtonClickedAtCell:(FACell *)cell;

@optional

- (void)didBeginInteractWithCell:(FACell *)cell;

@end

@interface FANoteCell : FAPanCell

@end
