//
//  FADocument.h
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/13/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FADocumentDelegate <NSObject>

- (void)didUpdateWithContent:(id)content;
- (id)contentForiCloud;

@end

@interface FADocument : UIDocument

@property (nonatomic, weak) id < FADocumentDelegate > delegate;

@end
