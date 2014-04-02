//
//  Player.m
//  003-Storyboards
//
//  Created by liluo on 4/2/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//

#import "Player.h"

@implementation Player

- (Player *)initWithName:(NSString *)name andGame:(NSString *)game andRating:(int)rating {
  Player *player = [[Player alloc] init];
  player.name = name;
  player.game = game;
  player.rating = rating;
  return player;
}

@end
