//
//  ICViewController.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FAViewController : UIViewController

@property (nonatomic, weak) id delegate;

- (id)initWithDelegate:(id)delegate;
- (Class)viewClass;

@end
