//
//  Player.h
//  003-Storyboards
//
//  Created by liluo on 4/2/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

- (Player *)initWithName:(NSString *)name andGame:(NSString *)game andRating:(int)rating;

@end
