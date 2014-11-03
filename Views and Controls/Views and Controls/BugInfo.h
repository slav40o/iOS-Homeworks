//
//  CellContent.h
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "TabData.h"
#import <UIKit/UIKit.h>

@interface BugInfo : NSObject<TabData>

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)image andDetails:(NSString*)details;

@end
