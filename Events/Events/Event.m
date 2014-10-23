//
//  Event.m
//  Events
//
//  Created by Slavi on 10/22/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@implementation Event

-(instancetype)init{
    self = [super init];
    if (self) {
        self.guests = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(instancetype)initWithTitle: (NSString*)title
                    Category:(NSString*)cat
                 Description:(NSString*)desc{
    Event *ev = [[Event alloc] init];
    ev.title = title;
    ev.category = cat;
    ev.descript = desc;
    ev.date = [NSDate date];
    ev.guests = [[NSMutableArray alloc] init];
    return ev;
}

-(instancetype)initWithTitle: (NSString*)title
                    Category:(NSString*)cat
                 Description:(NSString*)desc
                        Date: (NSDate*)date{
    Event *ev = [[Event alloc] init];
    ev.title = title;
    ev.category = cat;
    ev.descript = desc;
    ev.date = date;
    ev.guests = [[NSMutableArray alloc] init];
    return ev;
}

@end
