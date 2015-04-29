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
#import "TPTeam.h"
#import "TPPlayerViewController.h"

@interface TPTeamViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) UIAlertController *filterController;

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
    
    if (cell.delegate && [cell.delegate respondsToSelector:@selector(configureWithObject:andIndexPath:)]) {
        [cell.delegate configureWithObject:self.dataSource[indexPath.row] andIndexPath:indexPath];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[TPCell class]]) {
        TPCell *cell = (TPCell *)sender;
        TPPlayerViewController *destinationController = segue.destinationViewController;
        destinationController.team = self.dataSource[cell.indexPath.row];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0f;
}

#pragma mark - Actions
- (IBAction)didTouchedFilter:(id)sender {
    [self presentViewController:self.filterController animated:YES completion:nil];
}

#pragma mark - Lazy Loading

- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[DatabaseManager shared] retrieveAllTeamsOrderedBy:TPOrderByBiggestNumOfSupporters];
    }
    
    return _dataSource;
}

- (UIAlertController *)filterController
{
    if (!   _filterController) {
        _filterController = [UIAlertController  alertControllerWithTitle:@"Filter"  message:@"Filter Teams By:"  preferredStyle:UIAlertControllerStyleActionSheet];
        [_filterController addAction:[self actionFilterByPayroll]];
        [_filterController addAction:[self actionFilterByNumberOfSupporters]];
        [_filterController addAction:[self actionFilterBothDesc]];
    }
    return _filterController;
}

#pragma mark - UIAlertController actions

- (UIAlertAction *)actionFilterByPayroll
{
    return [UIAlertAction
             actionWithTitle:@"Greatest Payroll"
             style:UIAlertActionStyleDefault
             handler:^(UIAlertAction * action)
             {
                 self.dataSource = [[DatabaseManager shared] retrieveAllTeamsOrderedBy:TPOrderByGreatestPayroll];
                 [_filterController dismissViewControllerAnimated:YES completion:nil];
                 [self.tableView reloadData];
             }];
}

- (UIAlertAction *)actionFilterByNumberOfSupporters
{
    return [UIAlertAction
             actionWithTitle:@"Biggest Number of Supporters"
             style:UIAlertActionStyleDefault
             handler:^(UIAlertAction * action)
             {
                 self.dataSource = [[DatabaseManager shared] retrieveAllTeamsOrderedBy:TPOrderByBiggestNumOfSupporters];
                 [_filterController dismissViewControllerAnimated:YES completion:nil];
                 [self.tableView reloadData];
             }];
}

- (UIAlertAction *)actionFilterBothDesc
{
    return [UIAlertAction
            actionWithTitle:@"Greatest Payroll & Biggest Number of Supporters"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action)
            {
                self.dataSource = [[DatabaseManager shared] retrieveAllTeamsOrderedBy:TPOrderByGreatestPayrollAndBiggestNumOfSupporters];
                [_filterController dismissViewControllerAnimated:YES completion:nil];
                [self.tableView reloadData];
            }];
}
@end
