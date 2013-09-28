//
//  FACell.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FACell.h"

@interface FACell ()

@property (nonatomic, strong) id delegate;

@end

@implementation FACell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setData:(id)data
       delegate:(id)delegate
{
    self.delegate = delegate;
}

@end
