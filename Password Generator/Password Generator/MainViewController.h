//
//  ViewController.h
//  Password Generator
//
//  Created by Slavi on 10/28/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Password.h"

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *passwords;

@end

