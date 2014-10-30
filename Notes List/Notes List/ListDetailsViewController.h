//
//  ListDetailsViewController.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"
#import "NoteViewCell.h"

@interface ListDetailsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property List *list;
@property (weak, nonatomic) IBOutlet UILabel *titleListLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryTextLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
