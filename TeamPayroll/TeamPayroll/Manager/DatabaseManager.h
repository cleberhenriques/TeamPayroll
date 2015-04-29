//
//  DatabaseManager.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TPOrderBy) {
    TPOrderByGreatestPayroll,
    TPOrderByBiggestNumOfSupporters
};

@interface DatabaseManager : NSObject

+(instancetype)shared;
+(void)createDataBaseIfNeeded;
+(void)deleteDatabase;

- (NSArray *)retrieveAllTeamsOrderedBy:(TPOrderBy)order;
@end
