//
//  CreateEventViewController.m
//  Events
//
//  Created by Slavi on 10/22/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "CreateEventViewController.h"
#import "Event.h"

@interface CreateEventViewController ()

@end

@implementation CreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if (sender != self.createButton) {
        //return;
    }
    
    Event *ev = [[Event alloc]init];
    ev.title = self.titleTextField.text;
    ev.category = self.categoryTextField.text;
    ev.descript = self.descriptionTextField.text;
    ev.date = self.datePickerField.date;
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
