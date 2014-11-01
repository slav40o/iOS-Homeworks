//
//  CellContent.m
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "BugInfo.h"
#import <UIKit/UIKit.h>

@implementation BugInfo

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)image andDetails:(NSString*)details{
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.details = details;
    }
    
    return self;
}

@end
