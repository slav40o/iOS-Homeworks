//
//  TabView.m
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "TabView.h"
#import <UIKit/UIKit.h>
#import "BugInfo.h"
@interface TabView()

@end

@implementation TabView

+ (id)tabViewWhitBugs:(NSMutableArray*)bugs {
    TabView *view = [[[NSBundle mainBundle] loadNibNamed:@"TabView" owner:nil options:nil] lastObject];
    view.bugs = bugs;
    [view loadButtons];
    view.currentBug = bugs[0];
    [view refresh];
    // make sure customView is not nil or the wrong class!
    if ([view isKindOfClass:[TabView class]])
        return view;
    else
        return nil;
}

- (void)baseInit {
    self.bugs = [NSMutableArray new];
    self.currentBug = nil;
    [self loadButtons];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}

-(void)loadButtons{
    int x = 0;
    for (int i = 0; i < self.bugs.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, 100, 50)];
        [button setTitle:[NSString stringWithFormat:@"%@", [self.bugs[i] title]] forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(changeTab:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.tabButtonsScrollView addSubview:button];
        
        x += button.frame.size.width;
    }
    
    self.tabButtonsScrollView.backgroundColor = [UIColor redColor];
}

-(void)changeTab:(UIButton*)sender{
    for (int i = 0; i < self.bugs.count; i++) {
        if ([sender.titleLabel.text isEqualToString:[[self.bugs objectAtIndex:i] title]]) {
            self.currentBug = self.bugs[i];
            [self refresh];
            break;
        }
    }
}

- (void)refresh {
    self.titleTextLabel.text = self.currentBug.title;
    self.bugDescriptionTextView.text = self.currentBug.details;
    self.bugImageView.image = self.currentBug.image;
}

@end
