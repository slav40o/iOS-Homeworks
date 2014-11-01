//
//  TableViewCell.h
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BugInfo.h"

@interface TableViewCell : UITableViewCell

@property BugInfo *content;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end
