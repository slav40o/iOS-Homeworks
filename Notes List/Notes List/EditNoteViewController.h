//
//  EditNoteViewController.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface EditNoteViewController : UIViewController

@property (strong, nonatomic) Note *note;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextView *descriptionView;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
- (IBAction)changeEditMode:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveChanges:(id)sender;

@end
