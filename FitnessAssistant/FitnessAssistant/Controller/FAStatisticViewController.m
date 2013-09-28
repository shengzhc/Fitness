//
//  FAStatisticViewController.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/27/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAStatisticViewController.h"

@interface FAStatisticViewController ()

@end

@implementation FAStatisticViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Statistic";
}

- (Class)viewClass
{
    return [FAStatisticView class];
}

@end
