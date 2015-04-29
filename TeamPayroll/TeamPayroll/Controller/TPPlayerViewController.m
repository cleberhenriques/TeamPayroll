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
#import "TPSupporterViewController.h"

@interface TPPlayerViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TPPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Supporters" style:UIBarButtonItemStylePlain target:self action:@selector(buttonSupportersTouched)];
    self.navigationItem.rightBarButtonItem = anotherButton;
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

#pragma mark - Actions

- (void)buttonSupportersTouched
{
    [self performSegueWithIdentifier:@"segueToSupporters" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *destinationController = segue.destinationViewController;
 
    TPSupporterViewController *supporterController = [[destinationController viewControllers] objectAtIndex:0];
    
    supporterController.team = self.team;
}

@end
