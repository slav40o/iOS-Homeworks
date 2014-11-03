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

@synthesize data;
@synthesize currentTabData;

+ (id)tabViewWhitData:(NSMutableArray*)data {
    TabView *view = [[[NSBundle mainBundle] loadNibNamed:@"TabView" owner:nil options:nil] lastObject];
    view.data = data;
    [view loadButtons];
    view.currentTabData = data[0];
    [view refresh];
    // make sure customView is not nil or the wrong class!
    if ([view isKindOfClass:[TabView class]])
        return view;
    else
        return nil;
}

- (void)baseInit {
    self.data = [NSMutableArray new];
    self.currentTabData = nil;
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
    for (int i = 0; i < self.data.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, 100, 50)];
        [button setTitle:[NSString stringWithFormat:@"%@", [self.data[i] title]] forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(changeTab:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.tabButtonsScrollView addSubview:button];
        
        x += button.frame.size.width;
    }
    
    self.tabButtonsScrollView.backgroundColor = [UIColor redColor];
}

-(void)changeTab:(UIButton*)sender{
    for (int i = 0; i < self.data.count; i++) {
        if ([sender.titleLabel.text isEqualToString:[[self.data objectAtIndex:i] title]]) {
            self.currentTabData = self.data[i];
            [self refresh];
            break;
        }
    }
}

- (void)refresh {
    self.titleTextLabel.text = self.currentTabData.title;
    self.bugDescriptionTextView.text = self.currentTabData.details;
    self.bugImageView.image = self.currentTabData.image;
}

@end
