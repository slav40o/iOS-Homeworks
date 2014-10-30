//
//  CreateListViewController.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "CreateListViewController.h"
#import "MainViewController.h"
#import "List.h"

@interface CreateListViewController ()

@end

@implementation CreateListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)createBtnTapped:(UIButton *)sender {
    NSString *title = self.titleInput.text;
    NSString *category = self.categoryInput.text;
    if (title == nil || category == nil || title.length < 2 || category.length < 2) {
        // TO DO Alert for unapropriate data entered
    }
    else{
        List *newList = [[List alloc] initWithTitle:title andCategory:category];
        MainViewController *prev = [self.navigationController.viewControllers objectAtIndex:0];
        [prev.data addList:newList];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
