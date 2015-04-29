//
//  TPCellSupporter.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPCellSupporter.h"
#import "TPSupporter.h"
#import "UIColor+ColorWithHexAndAlpha.h"

@implementation TPCellSupporter

- (void)awakeFromNib {
    self.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)configureWithObject:(id)object andIndexPath:(NSIndexPath *)indexPath
{
    self.indexPath = indexPath;
    if ([object isKindOfClass:[TPSupporter class]]) {
        self.labelTitle.text = [(TPSupporter *) object name];
        self.labelRegistrationId.text = [(TPSupporter *) object registrationId];
        
        if ([(TPSupporter *) object overdue]) {
            self.labelOverdueStatus.text = @"Payment Overdue";
            self.labelOverdueStatus.textColor = [UIColor redColor];
        }else{
            self.labelOverdueStatus.text = @"Paid";
            self.labelOverdueStatus.textColor = [UIColor colorWithHex:@"44A001" andAlpha:1.0f];
        }
    }
}

@end
