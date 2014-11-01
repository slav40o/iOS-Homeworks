//
//  TabView.h
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BugInfo.h"

@interface TabView : UIView

+ (id)tabViewWhitBugs:(NSMutableArray*)bugs;

@property NSMutableArray *bugs;
@property BugInfo *currentBug;
@property (weak, nonatomic) IBOutlet UILabel *titleTextLabel;
@property (weak, nonatomic) IBOutlet UITextView *bugDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *bugImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *tabButtonsScrollView;

-(void)refresh;

@end
