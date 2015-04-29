//
//  TPCellSupporter.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPCell.h"

@interface TPCellSupporter : TPCell <TPCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelRegistrationId;
@property (weak, nonatomic) IBOutlet UILabel *labelOverdueStatus;

@end
