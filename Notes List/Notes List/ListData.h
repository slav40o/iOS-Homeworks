//
//  ListData.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

@interface ListData : NSObject

-(instancetype)init;
-(NSInteger)count;
-(void)addList:(List*)list;
-(List*)getListByIndex:(NSInteger)index;
-(void)removeList:(List*)list;
-(void)removeListByIndex:(NSInteger)index;
-(NSArray*)all;

@end
