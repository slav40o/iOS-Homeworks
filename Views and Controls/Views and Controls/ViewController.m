//
//  ViewController.m
//  Views and Controls
//
//  Created by Slavi on 10/31/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "ViewController.h"
#import "BugInfo.h"
#import "TableViewCell.h"
#import <UIKit/UIKit.h>
#import "TabsViewController.h"

@interface ViewController ()

@property NSMutableArray *cellsContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TabsViewController *destination = segue.destinationViewController;
    destination.bugs = self.cellsContent;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellsContent.count;
}

static NSString *cellIdentifier = @"simpleCell";

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.content = self.cellsContent[indexPath.row];
    return cell;
}

-(void)fillData{
    BugInfo *potatoBug = [[BugInfo alloc] initWithTitle:@"Potato Bug"
                                                  image:[UIImage imageNamed:@"potatoBug.jpg"]
                                             andDetails:@"Potato bug is really the potato of the bugs."];
    BugInfo *ladyBug = [[BugInfo alloc] initWithTitle:@"Ladybug"
                                                image:[UIImage imageNamed:@"ladybug.jpg"]
                                           andDetails:@"The lady of the bugs or A.K.A. Miss Bug :)"];
    BugInfo *centipede = [[BugInfo alloc] initWithTitle:@"Centipede"
                                                  image:[UIImage imageNamed:@"centipede.jpg"]
                                             andDetails:@"I do not know a single shit about this. It's awful I guess."];
    BugInfo *wolfSpider = [[BugInfo alloc] initWithTitle:@"Wolf Spider"
                                                   image:[UIImage imageNamed:@"wolfSpider.jpg"]
                                              andDetails:@"It's fucking wolf ... and spider ... WTF?!?"];
    
    self.cellsContent =[[NSMutableArray alloc] initWithObjects:potatoBug, ladyBug, centipede, wolfSpider, nil];
}

@end
