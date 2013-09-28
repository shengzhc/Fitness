//
//  UIView+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIView+FAServices.h"
#import "FAGeometry.h"

@implementation UIView (FAServices)

- (CGRect)alignedRectInSuperviewForSize:(CGSize)size
                                 offset:(CGSize)offset
                                options:(FAAlignmentOptions)options
{
    return FASizeAlignInFrame(size, [[self superview] bounds], offset, options);
}

- (NSUInteger)horizontalEnding
{
    return self.frame.origin.x + self.frame.size.width;
}

- (NSUInteger)verticalEnding
{
    return self.frame.origin.y + self.frame.size.height;
}

- (UIImage *)snapshotImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

+ (UIWindow *)mainWindow
{
    return [[UIApplication sharedApplication] keyWindow];
}


@end
