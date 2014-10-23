//
//  Event.h
//  Events
//
//  Created by Slavi on 10/22/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

-(instancetype)init;
-(instancetype)initWithTitle: (NSString*)title
                    Category:(NSString*)cat
                 Description:(NSString*)desc;
-(instancetype)initWithTitle: (NSString*)title
                    Category:(NSString*)cat
                 Description:(NSString*)desc
                        Date: (NSDate*)date;

@property (strong) NSString *title;
@property (strong) NSString *category;
@property (strong) NSString *descript;
@property (strong) NSDate *date;
@property (strong) NSMutableArray *guests;

@end