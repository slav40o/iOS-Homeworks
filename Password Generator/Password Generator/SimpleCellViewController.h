//
//  SimpleCellViewController.h
//  Password Generator
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Password.h"

@interface SimpleCellViewController : UITableViewCell

@property (strong, nonatomic) Password *password;
@property (weak, nonatomic) IBOutlet UILabel *accountName;
@property (weak, nonatomic) IBOutlet UILabel *encyptedPassword;
@property (weak, nonatomic) IBOutlet UIButton *carckBtn;

@end
