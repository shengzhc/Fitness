//
//  UILabel+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UILabel+FAServices.h"

@implementation UILabel (FAServices)

+ (UILabel *)labelWithText:(NSString *)text
{
    return [self labelWithFrame:CGRectZero
                           text:text
                      alignment:NSTextAlignmentLeft
                           font:[UIFont systemFontOfSize:13]
                      textColor:[UIColor blackColor]];
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
{
    return [self labelWithFrame:CGRectZero
                           text:text
                      alignment:NSTextAlignmentLeft
                           font:font
                      textColor:[UIColor blackColor]];
}

+ (UILabel *)labelWithTextColor:(UIColor *)color
{
    return [self labelWithTextColor:color
                          alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithTextColor:(UIColor *)color
                      alignment:(NSTextAlignment)alignment
{
    return [self labelWithFrame:CGRectZero
                           text:@""
                      alignment:alignment
                           font:[UIFont systemFontOfSize:13]
                      textColor:color];
}


+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
{
    return [self labelWithFrame:CGRectZero
                           text:@""
                      alignment:NSTextAlignmentLeft
                           font:font
                      textColor:textColor];
}


+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  alignment:(NSTextAlignment)alignment
{
    return [self labelWithFrame:frame
                           text:text
                      alignment:alignment
                           font:[UIFont systemFontOfSize:13]
                      textColor:[UIColor blackColor]];
}

+ (UILabel *)labelWithAlignment:(NSTextAlignment)alignment
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor
{
    return [self labelWithFrame:CGRectZero
                           text:@""
                      alignment:alignment
                           font:font
                      textColor:textColor];
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  alignment:(NSTextAlignment)alignment
                  textColor:(UIColor *)textColor
{
    return [self labelWithFrame:frame
                           text:text
                      alignment:alignment
                           font:[UIFont systemFontOfSize:13]
                      textColor:textColor];
}


+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  alignment:(NSTextAlignment)alignment
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
{
    UILabel *result = [[UILabel alloc] initWithFrame:frame];
    
    if (result)
    {
        result.textColor = textColor;
        result.text = text;
        result.font = font;
        result.backgroundColor = [UIColor clearColor];
        result.textAlignment = alignment;
    }
    
    return result;
}




@end
