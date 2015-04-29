//
//  TPCellPlayer.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPCell.h"

@interface TPCellPlayer : TPCell <TPCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelAge;
@property (weak, nonatomic) IBOutlet UILabel *labelSalary;
@property (weak, nonatomic) IBOutlet UIImageView *imagePlayer;

@end
