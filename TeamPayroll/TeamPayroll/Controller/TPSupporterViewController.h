//
//  TPSupporterViewController.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPTeam.h"
@interface TPSupporterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) TPTeam *team;

@end
