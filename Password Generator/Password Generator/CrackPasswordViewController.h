//
//  CrackPasswordViewController.h
//  Password Generator
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Password.h"

@interface CrackPasswordViewController : UIViewController

@property (strong, nonatomic) Password *password;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *decryptedPasswordLabel;
@property (weak, nonatomic) IBOutlet UILabel *accountName;
@property (weak, nonatomic) IBOutlet UITextField *secretCodeInput;
- (IBAction)decryptBtnTapped:(UIButton *)sender;

@end
