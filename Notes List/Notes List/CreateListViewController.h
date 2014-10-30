//
//  CreateListViewController.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *categoryInput;
- (IBAction)createBtnTapped:(UIButton *)sender;

@end
