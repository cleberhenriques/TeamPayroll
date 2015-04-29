//
//  Team.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/28/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "TPTeam.h"
#import "DatabaseManager.h"

@implementation TPTeam

- (NSString *)description
{
    return [NSString stringWithFormat:@"[TPTeam] - Name: %@", self.name];
}

- (void)fetchPlayers
{
    self.players = [[DatabaseManager shared] retrievePlayersOfTeam:self];
}
@end
