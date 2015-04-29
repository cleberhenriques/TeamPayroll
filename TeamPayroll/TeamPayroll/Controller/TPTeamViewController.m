//
//  TPTeamViewController.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPTeamViewController.h"
#import "TPCell.h"
#import "DatabaseManager.h"

@interface TPTeamViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation TPTeamViewController

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
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellTeam" forIndexPath:indexPath];
    
    if (cell.delegate && [cell.delegate respondsToSelector:@selector(configureWithObject:)]) {
        [cell.delegate configureWithObject:self.dataSource[indexPath.row]];
    }
    
    return cell;
}

#pragma mark - Lazy Loading

- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[DatabaseManager shared] retrieveAllTeams];
    }
    
    return _dataSource;
}

@end
