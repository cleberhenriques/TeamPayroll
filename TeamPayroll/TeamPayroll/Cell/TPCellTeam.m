//
//  TPCellTeam.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPCellTeam.h"
#import "TPTeam.h"

@implementation TPCellTeam

- (void)awakeFromNib {
    self.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureWithObject:(id)object andIndexPath:(NSIndexPath *)indexPath
{
    self.indexPath = indexPath;
    if ([object isKindOfClass:[TPTeam class]]) {
        self.labelTitle.text = [(TPTeam *) object name];
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
        NSString *numberAsString = [numberFormatter stringFromNumber:[(TPTeam *) object payroll]];
        
        self.labelPayroll.text = numberAsString;
        self.labelCountOfSupporters.text = [NSString stringWithFormat:@"%@ Supporters", [(TPTeam *) object countOfSupporters]];
    }
}

@end