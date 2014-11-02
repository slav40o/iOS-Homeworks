//
//  List.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface List : PFObject<PFSubclassing>

+(NSString*)parseClassName;

-(instancetype)initWithTitle:(NSString*)title andCategory:(NSString*)category;
-(instancetype)initWithTitle:(NSString*)title category:(NSString*)category andColor:(UIColor*)color;
-(instancetype)initWithTitle:(NSString*)title category:(NSString*)category andNotes:(NSArray*)notes;

@property NSString *title;
@property NSString *category;
@property NSMutableArray *notes;
@property NSString *color;

-(UIColor*)getUIColor;

@end
