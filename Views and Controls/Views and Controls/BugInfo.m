//
//  CellContent.m
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "BugInfo.h"
#import <UIKit/UIKit.h>
#import "TabData.h"

@implementation BugInfo

@synthesize image;
@synthesize details;
@synthesize title;

-(instancetype)initWithTitle:(NSString*)bugTitle image:(UIImage*)bugImage andDetails:(NSString*)bugDetails{
    self = [super init];
    if (self) {
        self.title = bugTitle;
        self.image = bugImage;
        self.details = bugDetails;
    }
    
    return self;
}

@end
