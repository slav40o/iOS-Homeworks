//
//  EditNoteViewController.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "EditNoteViewController.h"

@interface EditNoteViewController ()

@end

@implementation EditNoteViewController{
    BOOL isInEditMode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewValues];
    [self disableEditingValues];
    self.saveBtn.hidden = YES;
    isInEditMode = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeEditMode:(id)sender {
    if (isInEditMode) {
        isInEditMode = NO;
        self.saveBtn.hidden = YES;
        [self.editButton setTitle: @"Edit" forState: UIControlStateNormal];
        [self setViewValues];
        [self disableEditingValues];
    }
    else{
        [self enableEditingValues];
        self.saveBtn.hidden = NO;
        isInEditMode = YES;
        [self.editButton setTitle: @"Cancel" forState: UIControlStateNormal];
    }
}

- (IBAction)saveChanges:(id)sender {
    NSString *changedTitle = self.titleTextField.text;
    NSString *changedDescription = self.descriptionView.text;
    NSDate *changedEndDate = self.datePicker.date;
    if (changedTitle == nil || changedTitle.length > 20 || changedTitle.length < 2 ) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Title!"
                                    message:@"Title is required \n(from 2 to 20 symbols)"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
    }
    else if (changedDescription == nil || changedDescription.length < 10){
        [[[UIAlertView alloc] initWithTitle:@"Invalid Description!"
                                    message:@"Description is required \n(at least 10 symbols)"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
    }
    else{
        self.note.title = changedTitle;
        self.note.detailDescription = changedDescription;
        self.note.endDate = changedEndDate;
        [self changeEditMode: self];
        
        [[[UIAlertView alloc] initWithTitle:@"Success!"
                                    message:@"Changes are saved and updated."
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
    }
    
    [self setViewValues];
}


-(void)setViewValues{
    self.titleTextField.text = self.note.title;
    self.descriptionView.text = self.note.detailDescription;
    if (self.note.endDate != nil) {
        self.datePicker.date = self.note.endDate;
    }
}

-(void)enableEditingValues{
    self.titleTextField.enabled = YES;
    self.datePicker.enabled = YES;
    self.datePicker.exclusiveTouch = YES;
    self.descriptionView.editable = YES;
}

-(void)disableEditingValues{
    self.titleTextField.enabled = NO;
    self.datePicker.enabled = NO;
    self.datePicker.exclusiveTouch = NO;
    self.descriptionView.editable = NO;
}

@end
