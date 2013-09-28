//
//  ICView.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FAServices.h"
#import "UIView+QuartzCore.h"
#import "UILabel+FAServices.h"
#import "UIFont+FAServices.h"

@interface FAView : UIView

@property (nonatomic, weak) id delegate;

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate;


@end
