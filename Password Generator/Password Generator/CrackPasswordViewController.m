//
//  CrackPasswordViewController.m
//  Password Generator
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "CrackPasswordViewController.h"

@interface CrackPasswordViewController ()

@end

@implementation CrackPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    self.passwordLabel.text = self.password.encryptedPass;
    self.accountName.text = self.password.accountName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)decryptBtnTapped:(UIButton *)sender {
    NSString *decrypted = [self.password decryptPassword:self.secretCodeInput.text];
    self.decryptedPasswordLabel.text = decrypted;
}

@end
