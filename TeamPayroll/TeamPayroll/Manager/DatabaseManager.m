//
//  DatabaseManager.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "DatabaseManager.h"
#import "FMDatabase.h"
#import "TPTeam.h"
#import "TPPlayer.h"

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
    
    NSLog(@"%@", path);
    
    return path;
}

+ (NSString *)createDatabase
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TeamPayroll" ofType:@"sql"];
    NSString *content = [NSString stringWithContentsOfFile:path  encoding:NSUTF8StringEncoding error:NULL];
    
    return content;
}

- (NSArray *)retrieveAllTeamsOrderedBy:(TPOrderBy)order
{
    NSMutableArray *teams = [[NSMutableArray alloc] init];
    BOOL success = [self.database open];
    
    if (success) {
        NSString *orderField;
        
        switch (order) {
            case TPOrderByGreatestPayroll:
                orderField = @"greatestPayroll";
                break;
            case TPOrderByBiggestNumOfSupporters:
                orderField = @"biggestNumOfSupporters";
                break;
            default:
                break;
        }
        
        NSString *sqlSelectQuery = [NSString stringWithFormat: @"SELECT team.id, "
                                                                "team.name, "
                                                                "sum(DISTINCT player.salary) AS greatestPayroll, "
                                                                "count(DISTINCT supporter.id) as biggestNumOfSupporters "
                                                                "FROM team LEFT JOIN player on team.id = player.id_team "
                                                                "LEFT JOIN supporter ON team.id = supporter.id_team "
                                                                "GROUP BY team.name "
                                                                "ORDER BY %@ DESC;", orderField];
        
        FMResultSet *resultSet = [self.database executeQuery:sqlSelectQuery];
        while([resultSet next]) {
            
            TPTeam *team = [TPTeam new];
            team._id  = [resultSet intForColumn:@"id"];
            team.name = [resultSet stringForColumn:@"name"];
            
            [teams addObject:team];
        }
        
        [self.database close];
    }else{
        NSLog(@"Error opening DB");
    }
    
    return teams;
}

- (NSArray *)retrievePlayersOfTeam:(TPTeam *)team
{
    NSMutableArray *players = [[NSMutableArray alloc] init];
    BOOL success = [self.database open];
    
    if (success) {
        NSString *sqlSelectQuery = [NSString stringWithFormat: @"SELECT player.id, "
                                                                "player.name, "
                                                                "player.age, "
                                                                "player.salary "
                                                                "FROM player "
                                                                "WHERE player.id_team = ?"];
        
        FMResultSet *resultSet = [self.database executeQuery:sqlSelectQuery withArgumentsInArray:@[@(team._id)]];
        
        while([resultSet next]) {
            
            TPPlayer *player = [TPPlayer new];
            player._id  = [resultSet intForColumn:@"id"];
            player.name = [resultSet stringForColumn:@"name"];
            player.age = [NSNumber numberWithInt:[resultSet intForColumn:@"age"]];
            player.salary = [NSNumber numberWithInt:[resultSet intForColumn:@"salary"]];
            [players addObject:player];
        }
        
        [self.database close];
    }else{
        NSLog(@"Error opening DB");
    }
    
    return players;
}


@end
