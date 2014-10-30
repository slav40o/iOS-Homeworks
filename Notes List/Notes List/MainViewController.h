//
//  ViewController.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListData.h"

@interface MainViewController : UITableViewController

@property (strong, nonatomic) ListData *data;

@end

