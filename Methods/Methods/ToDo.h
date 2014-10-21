//
//  ToDo.h
//  Methods
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

-(instancetype)init;
-(instancetype)initWithEndDate: (NSDate*)data andToDo: (NSString*)toDO;

@property (strong) NSString* toDO;
@property (strong) NSDate* endDate;

@end
