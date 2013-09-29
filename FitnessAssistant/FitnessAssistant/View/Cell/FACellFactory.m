//
//  FACellFactory.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FACellFactory.h"

@implementation FACellFactory

+ (FACell *)cellForTableView:(UITableView *)tableView
                    cellType:(CellType)cellType
{
    FACell *cell = nil;
    
    switch (cellType) {
        case CellTypeNoteBook:
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellTypeNoteBook"];
            if (!cell) {
                
                cell = [[FANoteBookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellTypeNoteBook"];
            
            }
            break;
        case CellTypeNote:
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellTypeNote"];
            if (!cell) {
                
                cell = [[FANoteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellTypeNote"];
            }
            break;
        case CellTypeDefault:
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellTypeDefault"];
            if (!cell) {
                
                cell = [[FACell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellTypeDefault"];
            }
            break;
        default:
            break;
    }
    
    return cell;
}

@end
