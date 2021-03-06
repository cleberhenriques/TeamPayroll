//
//  TPCellTeam.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPCell.h"

@interface TPCellTeam : TPCell <TPCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelPayroll;
@property (weak, nonatomic) IBOutlet UILabel *labelCountOfSupporters;
@property (weak, nonatomic) IBOutlet UIImageView *imageLogo;

@end

