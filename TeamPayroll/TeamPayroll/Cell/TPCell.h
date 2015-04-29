//
//  TPCell.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TPCellDelegate;

@interface TPCell : UITableViewCell

@property (weak, nonatomic) id<TPCellDelegate> delegate;
@property (weak, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

@protocol TPCellDelegate <NSObject>

@required
- (void)configureWithObject:(id)object andIndexPath:(NSIndexPath *)indexPath;

@end

