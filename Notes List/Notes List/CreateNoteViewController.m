//
//  CreateNoteViewController.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "CreateNoteViewController.h"
#import "Note.h"
#import "ListDetailsViewController.h"

@interface CreateNoteViewController ()

@end

@implementation CreateNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)createNote:(id)sender {
    NSString *title = self.noteTitleTextField.text;
    NSString *description = self.descriptionTextView.text;
    NSDate *date = self.datePicker.date;
    
    if (title == nil || description == nil || title.length < 2 || description.length < 2) {
        // TO DO Alert for unapropriate data entered
        [[[UIAlertView alloc] initWithTitle:@"Test" message:@"gfsd" delegate:nil cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil] show];
    }
    else{
        Note *newNote = [[Note alloc] initWithTitle:title description:description andEndDate:date];
        NSInteger index = self.navigationController.viewControllers.count - 2;
        ListDetailsViewController *prev = [self.navigationController.viewControllers objectAtIndex:index];
        [prev.list.notes addObject:newNote];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
