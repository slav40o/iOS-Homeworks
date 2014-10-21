//
//  ToDoList.m
//  Methods
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoList.h"
#import "ToDo.h"

@implementation ToDoList

NSMutableArray* toDos;

-(instancetype)init{
    self = [super init];
    if (self) {
        toDos = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(instancetype)initWithSize: (int)size{
    self = [super init];
    if (self) {
        toDos = [[NSMutableArray alloc] initWithCapacity:size];
    }
    
    return self;
}


-(void)addToDo: (ToDo*)toDo{
    [toDos addObject:toDo];
}

-(void)clearAll{
    toDos = [[NSMutableArray alloc] init];
}

-(NSArray*)allToDos{
    NSArray *array = [toDos copy];
    return array;
}

-(NSUInteger)getCount{
    return toDos.count;
}

@end
