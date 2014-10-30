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

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    data = [[ListData alloc] init];
    List *list1 = [[List alloc] initWithTitle:@"iOS Tasks" andCategory:@"Homework"];
    List *list2 = [[List alloc] initWithTitle:@"JS Tasks" andCategory:@"Homework"];
    [data addList:list1];
    [data addList:list2];
    Note *iOsNote1 = [[Note alloc] initWithTitle:@"Custom Views" andDescription:@"Do the homework for the custom views lecture."];
    Note *iOsNote2 = [[Note alloc] initWithTitle:@"Delegates" andDescription:@"Do the homework for the delegates in iOS lecture."];
    Note *JSsNote = [[Note alloc] initWithTitle:@"Angular" andDescription:@"Do the homework for the angular lecture."];
    [list1.notes addObject:iOsNote1];
    [list1.notes addObject:iOsNote2];
    [list2.notes addObject:JSsNote];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
        [data removeListByIndex:indexPath.row];
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
    cell.titleLabel.text = currList.title;
    cell.categoryLabel.text = currList.category;
    return cell;
}

@end
