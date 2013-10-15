//
//  FADocument.m
//  FitnessAssistant
//
//  Created by Shengzhe Chen on 10/13/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FADocument.h"

@interface FADocument ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation FADocument

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError
{
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:contents];
    [self.delegate didUpdateWithContent:object];
    return YES;
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError
{
    id content = [self.delegate contentForiCloud];
    return [NSKeyedArchiver archivedDataWithRootObject:content];
}

@end
