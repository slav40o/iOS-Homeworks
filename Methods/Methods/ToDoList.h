//
//  ToDoList.h
//  Methods
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDo.h"
@interface ToDoList : NSObject

-(instancetype)init;
-(instancetype)initWithSize: (int)size;

-(void)addToDo: (ToDo*)toDo;
-(void)clearAll;
-(NSArray*)allToDos;
-(NSUInteger)getCount;

@end
