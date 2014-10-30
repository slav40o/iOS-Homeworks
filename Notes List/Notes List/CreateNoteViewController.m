//
//  CreateNoteViewController.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "CreateNoteViewController.h"
#import "Note.h"
#import "ListDetailsViewController.h"

@interface CreateNoteViewController ()

@end

@implementation CreateNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInputTextFieldStyles];
    
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
    
    if (title == nil || title.length > 20 || title.length < 2 ) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Title!"
                                    message:@"Title is required \n(from 2 to 20 symbols)"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
    }
    else if(description == nil || description.length < 10){
        [[[UIAlertView alloc] initWithTitle:@"Invalid Description!"
                                    message:@"Description is required \n(at least 10 symbols)"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
    }
    else{
        Note *newNote = [[Note alloc] initWithTitle:title description:description andEndDate:date];
        NSInteger index = self.navigationController.viewControllers.count - 2;
        ListDetailsViewController *prev = [self.navigationController.viewControllers objectAtIndex:index];
        [prev.list.notes addObject:newNote];
        
        [[[UIAlertView alloc] initWithTitle:@"Success!"
                                    message:@"The note is created and added to your list."
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)setInputTextFieldStyles{
    [self.descriptionTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [self.descriptionTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.descriptionTextView.layer setBorderWidth: 1.0];
    [self.descriptionTextView.layer setCornerRadius:8.0f];
    [self.descriptionTextView.layer setMasksToBounds:YES];
    [self.noteTitleTextField.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.noteTitleTextField.layer setBorderWidth: 1.0];
    [self.noteTitleTextField.layer setCornerRadius:8.0f];
    [self.noteTitleTextField.layer setMasksToBounds:YES];
}

@end
