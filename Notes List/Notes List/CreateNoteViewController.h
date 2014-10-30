//
//  CreateNoteViewController.h
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateNoteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *noteTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)createNote:(id)sender;

@end
