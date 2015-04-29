//
//  TPSupporterViewController.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPSupporterViewController.h"
#import "TPCell.h"

@interface TPSupporterViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TPSupporterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview delegates and Datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.team.supporters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSupporter" forIndexPath:indexPath];
    
    if (cell.delegate && [cell.delegate respondsToSelector:@selector(configureWithObject:andIndexPath:)]) {
        [cell.delegate configureWithObject:self.team.supporters[indexPath.row] andIndexPath:indexPath];
    }
    
    return cell;
}

#pragma mark - Actions
- (IBAction)buttonCloseTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
