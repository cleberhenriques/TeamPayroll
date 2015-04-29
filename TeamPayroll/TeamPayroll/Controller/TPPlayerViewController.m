//
//  TPPlayerViewController.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPPlayerViewController.h"
#import "TPTeam.h"
#import "TPCell.h"
@interface TPPlayerViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TPPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Tableview delegates and Datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.team.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellPlayer" forIndexPath:indexPath];
    
    if (cell.delegate && [cell.delegate respondsToSelector:@selector(configureWithObject:andIndexPath:)]) {
        [cell.delegate configureWithObject:self.team.players[indexPath.row] andIndexPath:indexPath];
    }
    
    return cell;
}

@end
