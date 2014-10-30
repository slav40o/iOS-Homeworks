//
//  List.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject

-(instancetype)initWithTitle:(NSString*)title andCategory:(NSString*)category;
-(instancetype)initWithTitle:(NSString*)title category:(NSString*)category andNotes:(NSArray*)notes;

@property NSString *title;
@property NSString *category;
@property NSMutableArray *notes;

@end
