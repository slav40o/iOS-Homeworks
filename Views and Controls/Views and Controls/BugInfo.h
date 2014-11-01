//
//  CellContent.h
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BugInfo : NSObject

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)image andDetails:(NSString*)details;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *details;

@end
