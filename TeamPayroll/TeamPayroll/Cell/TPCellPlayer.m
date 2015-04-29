//
//  TPCellPlayer.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPCellPlayer.h"
#import "TPPlayer.h"

@implementation TPCellPlayer

- (void)awakeFromNib {
    self.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)configureWithObject:(id)object andIndexPath:(NSIndexPath *)indexPath
{
    self.indexPath = indexPath;
    if ([object isKindOfClass:[TPPlayer class]]) {
        self.labelTitle.text = [(TPPlayer *) object name];
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
        NSString *salaryFormatted = [numberFormatter stringFromNumber:[(TPPlayer *) object salary]];
        
        self.labelSalary.text = salaryFormatted;
        self.labelAge.text = [NSString stringWithFormat:@"%@ Years", [(TPPlayer *) object age]];
    }
}
@end
