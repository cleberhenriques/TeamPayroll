//
//  Team.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *players;
@property (strong, nonatomic) NSArray *supporters;

@end
