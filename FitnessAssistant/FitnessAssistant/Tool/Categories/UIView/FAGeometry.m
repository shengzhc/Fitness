//
//  KP.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/11/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "FAGeometry.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Geometric Alignment
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
CGRect FASizeAlignInFrame(CGSize size, CGRect frame, CGSize offset, FAAlignmentOptions options)
{
    CGFloat xOrigin, yOrigin;
    
    if (options & FAAlignmentOptionsLeft)
    {
        xOrigin = 0 + offset.width;
    }
    else if (options & FAAlignmentOptionsRight)
    {
        xOrigin = frame.size.width - size.width - offset.width;
    }
    else if (options & FAAlignmentOptionsHorizontalCenter)
    {
        xOrigin = (frame.size.width - size.width)/2.0;
    }
    else
    {
        xOrigin = 0 + offset.width;
    }
    
    if (options & FAAlignmentOptionsTop)
    {
        yOrigin = 0 + offset.height;
    }
    else if (options & FAAlignmentOptionsBottom)
    {
        yOrigin = frame.size.height - size.height - offset.height;
    }
    else if (options & FAAlignmentOptionsVerticalCenter)
    {
        yOrigin = (frame.size.height - size.height)/2.0;
    }
    else
    {
        yOrigin = 0 + offset.height;
    }
    
    return CGRectMake(xOrigin, yOrigin,
                      size.width, size.height);
}
