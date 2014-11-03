//
//  TabsViewController.m
//  Views and Controls
//
//  Created by Slavi on 11/1/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "TabsViewController.h"
#import "TabView.h"
#import <UIKit/UIKit.h>

@interface TabsViewController ()

@end

@implementation TabsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TabView *tabView = [TabView tabViewWhitData:self.bugs];
    [self.view addSubview:tabView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
