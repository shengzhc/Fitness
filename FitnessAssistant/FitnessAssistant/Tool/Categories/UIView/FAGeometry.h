//
//  KP.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/11/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#ifndef __ICGEOMETRY_H_
#define __ICGEOMETRY_H_

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

typedef enum
{
    FAAlignmentOptionsLeft          = 1 << 0,
    FAAlignmentOptionsRight         = 1 << 1,
    FAAlignmentOptionsTop           = 1 << 2,
    FAAlignmentOptionsBottom        = 1 << 3,
    FAAlignmentOptionsHorizontalCenter = 1 << 4,
    FAAlignmentOptionsVerticalCenter    = 1 << 5
} FAAlignmentOptions;

CGRect FASizeAlignInFrame(CGSize size, CGRect frame, CGSize offset, FAAlignmentOptions options);



#endif