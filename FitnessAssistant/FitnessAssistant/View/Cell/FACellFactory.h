//
//  FACellFactory.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FACell.h"
#import "FANoteBookCell.h"
#import "FANoteCell.h"

typedef enum
{
    CellTypeNoteBook,
    CellTypeNote,
    CellTypeDefault
}CellType;

@interface FACellFactory : NSObject

+ (FACell *)cellForTableView:(UITableView *)tableView cellType:(CellType)cellType;

@end
