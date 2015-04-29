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
#import "TPSupporter.h"

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

- (NSArray *)retrieveAllTeamsOrderedBy:(TPOrderBy)order
{
    NSMutableArray *teams = [[NSMutableArray alloc] init];
    BOOL success = [self.database open];
    
    if (success) {
        NSString *orderString;
        
        switch (order) {
            case TPOrderByGreatestPayroll:
                orderString = @"ORDER BY payroll DESC;";
                break;
            case TPOrderByBiggestNumOfSupporters:
                orderString = @"ORDER BY countSupporters DESC;";
                break;
            case TPOrderByGreatestPayrollAndBiggestNumOfSupporters:
                orderString = @"ORDER BY payroll DESC, countSupporters DESC;";
            default:
                break;
        }
        
        NSString *sqlSelectQuery = [NSString stringWithFormat: @"SELECT team.id, team.name, "
                                                                "IFNULL(p.payroll,0) AS payroll, "
                                                                "IFNULL(s.countSupporters,0) AS countSupporters "
                                                                "FROM team "
                                                                "LEFT JOIN (SELECT player.id_team, sum(player.salary) AS payroll FROM player GROUP BY player.id_team) p "
                                                                "ON (team.id = p.id_team) "
                                                                "LEFT JOIN (SELECT supporter.id_team, count(supporter.id) AS countSupporters FROM supporter GROUP BY supporter.id_team) s "
                                                                "ON (team.id = s.id_team) %@", orderString];
        
        FMResultSet *resultSet = [self.database executeQuery:sqlSelectQuery];
        while([resultSet next]) {
            
            TPTeam *team = [TPTeam new];
            team._id  = [resultSet intForColumn:@"id"];
            team.name = [resultSet stringForColumn:@"name"];
            team.payroll = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"payroll"]];
            team.countOfSupporters = [NSNumber numberWithInt:[resultSet intForColumn:@"countSupporters"]];
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
            player.salary = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"salary"]];
            [players addObject:player];
        }
        
        [self.database close];
    }else{
        NSLog(@"Error opening DB");
    }
    
    return players;
}

- (NSArray *)retrieveSupportersOfTeam:(TPTeam *)team
{
    NSMutableArray *supporters = [[NSMutableArray alloc] init];
    BOOL success = [self.database open];
    
    if (success) {
        NSString *sqlSelectQuery = [NSString stringWithFormat: @"SELECT supporter.id, "
                                    "supporter.name, "
                                    "supporter.registrationId, "
                                    "supporter.overdue "
                                    "FROM supporter "
                                    "WHERE supporter.id_team = ?"];
        
        FMResultSet *resultSet = [self.database executeQuery:sqlSelectQuery withArgumentsInArray:@[@(team._id)]];
        
        while([resultSet next]) {
            
            TPSupporter *supporter = [TPSupporter new];
            supporter._id  = [resultSet intForColumn:@"id"];
            supporter.name = [resultSet stringForColumn:@"name"];
            supporter.registrationId = [resultSet stringForColumn:@"registrationId"];
            supporter.overdue = [resultSet intForColumn:@"overdue"];
            [supporters addObject:supporter];
        }
        
        [self.database close];
    }else{
        NSLog(@"Error opening DB");
    }
    
    return supporters;
}

@end
