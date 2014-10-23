//
//  CreateEventViewController.h
//  Events
//
//  Created by Slavi on 10/22/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
@interface CreateEventViewController : UIViewController

@property (strong) Event *event;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *createButton;

@end
