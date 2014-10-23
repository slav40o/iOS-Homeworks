//
//  EventManager.m
//  Events
//
//  Created by Slavi on 10/22/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventManager.h"

@implementation EventManger

NSMutableArray *events;

-(instancetype)init{
    self = [super init];
    if (self) {
        events = [[NSMutableArray alloc]init];
    }
    
    return  self;
}

-(void)addEvent: (Event*)ev{
    [events addObject:ev];
}

-(NSArray*)all{
    NSArray *all = [events mutableCopy];
    return all;
}


-(NSInteger)count{
    return events.count;
}

-(NSArray*)allByCategory: (NSString*)category{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    int length = events.count;
    for (int i = 0; i < length; i++) {
        Event *currEv = events[i];
        if ([currEv.category isEqualToString:category]) {
            [result addObject:currEv];
        }
    }
    
    return [result mutableCopy];
}

-(NSArray*)allSortedBy: (NSString*)sortType{
    NSSortDescriptor *descriptor;
    if ([sortType isEqualToString:@"date"] || [sortType isEqualToString:@"title"]) {
        descriptor = [[NSSortDescriptor alloc] initWithKey:sortType ascending:YES];
    }
    else {
        NSException *ex = [[NSException alloc] initWithName:@"InvalidSortType" reason:@"Type must be date or title" userInfo:[NSDictionary init]];
        [ex raise];
    }
    
    NSArray *result = [events sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    return result;
}

@end