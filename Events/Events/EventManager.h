//
//  EventManager.h
//  Events
//
//  Created by Slavi on 10/22/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventManger : NSObject

-(instancetype)init;

-(void)addEvent: (Event*)ev;
-(NSArray*)all;
-(NSArray*)allByCategory: (NSString*)category;
-(NSArray*)allSortedBy: (NSString*)sortType;

-(NSInteger)count;

@end