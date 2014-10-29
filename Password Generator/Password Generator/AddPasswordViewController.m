//
//  AddPasswordViewController.m
//  Password Generator
//
//  Created by Slavi on 10/28/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AddPasswordViewController.h"
#import "Password.h"

@interface AddPasswordViewController ()

@end

@implementation AddPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender == self.addBtn) {
        NSString *name = self.accountInput.text;
        NSString *password = self.passwordInput.text;
        NSString *secretCode = self.secretCodeInput.text;
        if ([name isEqualToString:@""] || [password isEqualToString:@""] || [secretCode isEqualToString:@""]) {
            self.password = nil;
        }
        else{
            Password *pass = [[Password alloc] initWithName:name password:password andDecryptCode:secretCode];
            self.password = pass;
        }
    }
    else{
        self.password = nil;
    }
}

@end
