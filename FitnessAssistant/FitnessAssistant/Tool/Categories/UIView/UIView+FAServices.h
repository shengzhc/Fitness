//
//  UIView+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAGeometry.h"

@interface UIView (FAServices)

- (CGRect)alignedRectInSuperviewForSize:(CGSize)size
                                 offset:(CGSize)offset
                                options:(FAAlignmentOptions)options;

- (NSUInteger)horizontalEnding;
- (NSUInteger)verticalEnding;
- (UIImage *)snapshotImage;
+ (UIWindow *)mainWindow;

@end
