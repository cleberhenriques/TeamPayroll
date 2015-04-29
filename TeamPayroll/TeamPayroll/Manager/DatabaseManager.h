//
//  DatabaseManager.h
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseManager : NSObject

+(instancetype)shared;
+(void)createDataBaseIfNeeded;
+(void)deleteDatabase;

@end