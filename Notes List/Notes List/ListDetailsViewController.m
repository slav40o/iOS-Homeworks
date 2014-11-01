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
    self.doneEditBtn.hidden = YES;
    self.tableView.separatorColor = self.list.color;
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.list.notes removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toNoteDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EditNoteViewController *destViewController = (EditNoteViewController*)[segue destinationViewController];
        Note *note = [self.list.notes objectAtIndex:indexPath.row];
        destViewController.note = note;
    }
}

- (IBAction)doneEditingBtnTapped:(UIButton *)sender {
    [self.tableView setEditing:NO animated:YES];
    self.doneEditBtn.hidden = YES;
}

- (IBAction)editBtnTapped:(id)sender {
    [self.tableView setEditing:YES animated:YES];
    self.doneEditBtn.hidden = NO;
}
@end
