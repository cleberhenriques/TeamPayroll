//
//  TPCellPlayer.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPCellPlayer.h"
#import "TPPlayer.h"
#import "NSNumber+Currency.h"
#import "UIImageView+WebCache.h"
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
        self.labelSalary.text = [[(TPPlayer *) object salary] toLocaleCurrency];
        self.labelAge.text = [NSString stringWithFormat:@"%@ Years", [(TPPlayer *) object age]];
        [self.imagePlayer sd_setImageWithURL:[NSURL URLWithString:[(TPPlayer *) object imgUrl]] placeholderImage:[UIImage imageNamed:@"PersonPlaceholder"]];
    }
}
@end
