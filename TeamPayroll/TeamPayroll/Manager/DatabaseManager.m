//
//  DatabaseManager.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "DatabaseManager.h"
#import "FMDatabase.h"

@interface DatabaseManager ()

@property (strong, nonatomic) FMDatabase *database;

@end

@implementation DatabaseManager

+(instancetype)shared
{
    static DatabaseManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DatabaseManager new];
        [self createDataBaseIfNeeded];
        manager.database = [FMDatabase databaseWithPath:[self dbPath]];
    });
    return manager;
}

+(void)createDataBaseIfNeeded
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self dbPath]]) {
        FMDatabase *database = [FMDatabase databaseWithPath:[self dbPath]];
        [database open];
        [database executeStatements:[self createDatabase]];
        [database close];
    }
}
+(void)deleteDatabase
{
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[self dbPath] error:&error];
}

+(NSString *)dbPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"TeamPayroll.sqlite"];
    
    return path;
}

+ (NSString *)createDatabase
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TeamPayroll" ofType:@"sql"];
    NSString *content = [NSString stringWithContentsOfFile:path  encoding:NSUTF8StringEncoding error:NULL];
    
    return content;
}
@end
