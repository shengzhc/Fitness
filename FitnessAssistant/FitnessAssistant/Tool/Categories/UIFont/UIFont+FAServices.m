//
//  UIFont+UIFont_FAServices.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 9/28/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "UIFont+FAServices.h"

@implementation UIFont (FAServices)

+ (UIFont *)lightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"AvenirNextCondensed-UltraLight" size:size];
}

+ (UIFont *)fontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:size];
}

+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:size];
}

@end
