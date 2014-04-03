//
//  PlayersViewController.h
//  003-Storyboards
//
//  Created by liluo on 4/2/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end
