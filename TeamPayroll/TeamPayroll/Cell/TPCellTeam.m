//
//  TPCellTeam.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPCellTeam.h"
#import "TPTeam.h"
#import "UIImageView+WebCache.h"
#import "NSNumber+Currency.h"

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
        self.labelPayroll.text = [[(TPTeam *) object payroll] toLocaleCurrency];
        self.labelCountOfSupporters.text = [NSString stringWithFormat:@"%@ Supporters", [(TPTeam *) object countOfSupporters]];
        [self.imageLogo sd_setImageWithURL:[NSURL URLWithString:[(TPTeam *) object imgUrl]]
                          placeholderImage:[UIImage imageNamed:@"ImagePlaceholder"]];
    }
}

@end
