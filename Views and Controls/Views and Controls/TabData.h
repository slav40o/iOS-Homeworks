//
//  TabData.h
//  Views and Controls
//
//  Created by Slavi on 11/2/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabData <NSObject>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *details;

@end
