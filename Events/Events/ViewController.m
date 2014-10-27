//
//  ViewController.m
//  Events
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "ViewController.h"
#import "Event.h"
#import "EventManager.h"
#import "CreateEventViewController.h"

@interface ViewController ()

@end

@implementation ViewController

EventManger *manager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    manager = [[EventManger alloc] init];
    Event *ev = [[Event alloc] initWithTitle:@"First test" Category:@"EPIC" Description:@"Just a thing"];
    [manager addEvent:ev];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [manager count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"simpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Event *currEv = [manager.all objectAtIndex:indexPath.row];
    cell.textLabel.text = currEv.title;
    //cell.backgroundColor = [[UIColor alloc] initWithRed:90 green:255 blue:90 alpha:1];
    
    return  cell;
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    CreateEventViewController *source = [segue sourceViewController];
    Event *newEv = source.event;
    if (isValid(newEv)) {
        [manager addEvent:newEv];
        [self.tableView reloadData];
        
    }
}

bool isValid(Event* ev){
    if (ev == nil) {
        return NO;
    }
    
    if (ev.title == nil || ev.date == nil || ev.category == nil) {
        return NO;
    }
    return YES;
}

@end
