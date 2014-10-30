//
//  Note.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

-(instancetype)initWithTitle:(NSString*)title andDescription:(NSString*)desc;
-(instancetype)initWithTitle:(NSString*)title description:(NSString*)desc andEndDate:(NSDate*)date;

@property NSString *title;
@property NSString *detailDescription;
@property NSDate *endDate;

@end
