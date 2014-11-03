//
//  ViewController.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "MainViewController.h"
#import "ListData.h"
#import "List.h"
#import "TableViewCell.h"
#import "ListDetailsViewController.h"
#import "Note.h"
#import <Parse/Parse.h>

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toListDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ListDetailsViewController *destViewController = (ListDetailsViewController*)[segue destinationViewController];
        List *list = [data getListByIndex:indexPath.row];
        destViewController.list = list;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        List *list = [data getListByIndex:indexPath.row];
        [data removeListByIndex:indexPath.row];
        [list deleteInBackground];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *listCellIdentifier = @"ListTableCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCellIdentifier];
    }
    
    List *currList = [data getListByIndex:indexPath.row];
    UIColor *color = [currList getUIColor];
    cell.titleLabel.text = currList.title;
    cell.categoryLabel.text = currList.category;
    cell.contentView.backgroundColor = color;
    return cell;
}

-(void)fetchData{
    data = [[ListData alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"List"];
    __weak MainViewController *weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (List *object in objects) {
                [data addList:object];
                [weakSelf.tableView reloadData];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end
