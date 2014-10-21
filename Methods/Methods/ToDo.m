//
//  ToDo.m
//  Methods
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDo.h"

@implementation ToDo

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(instancetype)initWithEndDate: (NSDate*)date andToDo: (NSString*)whatToDo{
    ToDo *toDo = [[ToDo alloc] init];
    toDo.endDate = date;
    toDo.toDO = whatToDo;
    
    return toDo;
}

@end
