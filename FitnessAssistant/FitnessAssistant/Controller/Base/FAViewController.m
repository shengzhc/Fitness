//
//  ICViewController.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "FAViewController.h"
#import "FAView.h"

@interface FAViewController ()

@property (nonatomic, strong) FAView *view;

@end

@implementation FAViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super init];
    
    if (self)
    {
        self.delegate = delegate;
    }
    
    return self;
}

- (void)loadView
{
    self.view = [[[self viewClass] alloc] initWithFrame:[UIScreen mainScreen].applicationFrame
                                               delegate:self];
}

- (Class)viewClass
{
    return [FAView class];
}


@end
