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

- (void)configureWithObject:(id)object
{
    if ([object isKindOfClass:[TPTeam class]]) {
        self.labelTitle.text = [(TPTeam *) object name];
    }
}

@end
