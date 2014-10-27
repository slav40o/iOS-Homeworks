//
//  ViewController.h
//  Events
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

    - (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end

