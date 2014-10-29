//
//  ViewController.m
//  Password Generator
//
//  Created by Slavi on 10/28/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "MainViewController.h"
#import "AddPasswordViewController.h"
#import "SimpleCellViewController.h"
#import "CrackPasswordViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController{
    NSMutableArray *passes;
    NSInteger lastClickedRow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Password *pass = [[Password alloc] initWithName:@"Pesho" password:@"123123" andDecryptCode:@"abc"];
    Password *pass2 = [[Password alloc] initWithName:@"Gosho" password:@"123456" andDecryptCode:@"abc"];
    pass.isCreated = NO;
    pass2.isCreated = NO;
    passes = [[NSMutableArray alloc] initWithObjects:pass, pass2, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ToDecryptPassword"])
    {
        CrackPasswordViewController *vc = [segue destinationViewController];
        vc.password = passes[lastClickedRow];
    }
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    AddPasswordViewController *source = [segue sourceViewController];
    
    if (source.password != nil && source.password.isCreated == YES) {
        source.password.isCreated = NO;
        [passes addObject:source.password];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return passes.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleCell";
    
    SimpleCellViewController *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[SimpleCellViewController alloc] init];
    }
    
    lastClickedRow = indexPath.row;
    NSLog(@"%i", lastClickedRow);
    Password *pass = passes[indexPath.row];
    cell.accountName.text = pass.accountName;
    cell.password = pass;
    cell.encyptedPassword.text = pass.encryptedPass;
    
    return  cell;
}

@end
