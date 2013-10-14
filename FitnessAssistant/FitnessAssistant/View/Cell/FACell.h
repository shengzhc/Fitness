//
//  FACell.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+FAServices.h"
#import "UIFont+FAServices.h"
#import "UIView+FAServices.h"

@interface FACell : UITableViewCell

@property (nonatomic, strong) id delegate;
@property (nonatomic, strong) id data;

- (void)setData:(id)data
       delegate:(id)delegate;

@end
