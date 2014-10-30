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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    if (changedTitle == nil || changedDescription == nil || changedTitle.length < 2 || changedDescription.length < 10) {
        // TO DO Alert for invalid data passed
    }
    else{
        self.note.title = changedTitle;
        self.note.detailDescription = changedDescription;
        self.note.endDate = changedEndDate;
        [self changeEditMode: self];
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
