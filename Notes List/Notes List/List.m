//
//  List.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "List.h"
#import <UIKit/UIKit.h>

@implementation List

@dynamic color;
@dynamic category;
@dynamic notes;
@dynamic title;

+(void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName {
    return @"List";
}

-(instancetype)initWithTitle:(NSString*)title andCategory:(NSString*)category{
    self = [super init];
    if (self != nil) {
        self.title = title;
        self.category = category;
        self.notes = [[NSMutableArray alloc] initWithCapacity:4];
        self.color = [[CIColor colorWithCGColor:[[UIColor whiteColor] CGColor]] stringRepresentation];
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

-(instancetype)initWithTitle:(NSString*)title category:(NSString*)category andColor:(UIColor*)color{
    self = [self initWithTitle:title andCategory:category];
    if (self != nil) {
        CGColorRef colorRef = color.CGColor;
        NSString *colorString = [CIColor colorWithCGColor:colorRef].stringRepresentation;
        self.color = colorString;
    }
    
    return self;
}

-(UIColor*)getUIColor{
    CIColor *coreColor = [CIColor colorWithString:self.color];
    UIColor *color = [UIColor colorWithCIColor:coreColor];
    return color;
}

@end
