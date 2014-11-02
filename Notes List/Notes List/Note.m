//
//  Note.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "Note.h"
#import <Parse/PFObject+Subclass.h>

@implementation Note

@dynamic title;
@dynamic endDate;
@dynamic detailDescription;

+(void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName {
    return @"Note";
}

-(instancetype)initWithTitle:(NSString*)title andDescription:(NSString*)desc{
    self = [super init];
    if (self != nil) {
        self.title = title;
        self.detailDescription = desc;
    }
    
    return self;
}

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)desc andEndDate:(NSDate*)date{
    self = [self initWithTitle:title andDescription:desc];
    if (self != nil) {
        self.endDate = date;
    }
    
    return self;
}

@end
