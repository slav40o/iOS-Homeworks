//
//  List.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "List.h"

@implementation List

-(instancetype)initWithTitle:(NSString*)title andCategory:(NSString*)category{
    self = [super init];
    if (self != nil) {
        self.title = title;
        self.category = category;
        self.notes = [[NSMutableArray alloc] initWithCapacity:4];
    }
    
    return self;
}

-(instancetype)initWithTitle:(NSString*)title category:(NSString*)category andNotes:(NSArray*)notes{
    self = [self initWithTitle:title andCategory:category];
    if (self != nil) {
        self.notes = [[NSMutableArray alloc] initWithArray:notes];
    }
    
    return self;
}

@end
