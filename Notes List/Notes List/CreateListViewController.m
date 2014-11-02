//
//  CreateListViewController.m
//  Notes List
//
//  Created by Slavi on 10/29/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "CreateListViewController.h"
#import "MainViewController.h"
#import "List.h"

@interface CreateListViewController ()

@end

@implementation CreateListViewController{
    NSArray *colors;
    NSInteger selectedColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    colors = @[ @"White", @"Gray", @"Green", @"Orange", @"Red", @"Yellow", @"Cyan", @"Magenta"];
    self.colorPicker.dataSource = self;
    self.colorPicker.delegate = self;
    selectedColor = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return colors.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return colors[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectedColor = row;
}

- (IBAction)createBtnTapped:(UIButton *)sender {
    NSString *title = self.titleInput.text;
    NSString *category = self.categoryInput.text;
    if (title == nil || title.length > 20 || title.length < 2 ) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Title!"
                                    message:@"Title is required \n(from 2 to 20 symbols)"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
    }
    else if(category == nil || category.length < 2 || category.length > 20){
        [[[UIAlertView alloc] initWithTitle:@"Invalid Category!"
                                    message:@"Category is required \n(from 2 to 20 symbols)"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
    }
    else{
        List *newList = [[List alloc] initWithTitle:title category:category andColor:[self getColor]];
        MainViewController *prev = [self.navigationController.viewControllers objectAtIndex:0];
        [prev.data addList:newList];
        [[[UIAlertView alloc] initWithTitle:@"Success!"
                                    message:@"The new list is created."
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil]
         show];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(UIColor*)getColor{
    switch (selectedColor) {
        case 0: return [UIColor whiteColor];
        case 1: return [UIColor grayColor];
        case 2: return [UIColor greenColor];
        case 3: return [UIColor orangeColor];
        case 4: return [UIColor redColor];
        case 5:return [UIColor yellowColor];
        case 6: return [UIColor cyanColor];
        case 7: return [UIColor magentaColor];
        default: return [UIColor whiteColor];
    }
}

@end
