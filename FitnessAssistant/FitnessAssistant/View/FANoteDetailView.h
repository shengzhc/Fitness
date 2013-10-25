//
//  FANoteDetailView.h
//  FitnessAssistant
//
//  Created by Fangzhou Lu on 10/14/13.
//  Copyright (c) 2013 iBros. All rights reserved.
//

#import "FAView.h"

typedef enum DetailViewType:NSUInteger{
    NewDetailView = 0,
    EditDetailView
} DetailViewType;

@interface FANoteDetailView : FAView

- (void)updateWithNoteItemEntity:(FANoteItemEntity *)noteItemEntity;

@end
