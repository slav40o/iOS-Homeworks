//
//  ListData.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "ListData.h"
#import "List.h"

@implementation ListData{
    NSMutableArray *lists;
}

-(instancetype)init{
    self = [super init];
    if (self != nil) {
        lists = [[NSMutableArray alloc] initWithCapacity:4];
    }
    
    return self;
}

-(NSInteger)count{
    return lists.count;
}

-(List*)getListByIndex:(NSInteger)index{
    if (index < 0 || index >= lists.count) {
        return nil;
    }
    return lists[index];
}

-(void)addList: (List*)list{
    [lists addObject:list];
}

-(void)removeList:(List*)list{
    [lists removeObject:list];
}

-(void)removeListByIndex: (NSInteger)index{
    [lists removeObjectAtIndex:index];
}

-(NSArray*)all{
    return [lists mutableCopy];
}

@end
