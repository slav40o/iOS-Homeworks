//
//  ListDetailsViewController.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "ListDetailsViewController.h"
#import "NoteViewCell.h"
#import "Note.h"
#import "EditNoteViewController.h"

@interface ListDetailsViewController ()

@end

@implementation ListDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.list.title;
    self.categoryTextLabel.text = self.list.category;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.notes.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *listCellIdentifier = @"NoteTableCell";
    NoteViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifier];
    if (cell == nil) {
        cell = [[NoteViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCellIdentifier];
    }
    
    Note *currNote = [self.list.notes objectAtIndex:indexPath.row];
    cell.noteTitle.text = currNote.title;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toNoteDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        EditNoteViewController *destViewController = (EditNoteViewController*)[navController topViewController];
        Note *note = [self.list.notes objectAtIndex:indexPath.row];
        destViewController.note = note;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
