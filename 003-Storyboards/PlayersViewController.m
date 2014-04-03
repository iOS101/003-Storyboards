//
//  PlayersViewController.m
//  003-Storyboards
//
//  Created by liluo on 4/2/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//

#import "Player.h"
#import "PlayerCell.h"
#import "PlayersViewController.h"

@interface PlayersViewController ()

@end

@implementation PlayersViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.players.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
  
  PlayerCell *cell = (PlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
  Player *player = self.players[indexPath.row];
  
  cell.nameLabel.text = player.name;
  cell.gameLabel.text = player.game;
  cell.ratingImageView.image = [self imageForRating:player.rating];

  return cell;
}


- (UIImage *)imageForRating:(int)rating
{
  NSString *imageName;
  if (rating > 1) {
    imageName = [NSString stringWithFormat:@"%dStarsSmall", rating];
  } else {
    imageName = [NSString stringWithFormat:@"%dStarSmall", rating];
  }
  return [UIImage imageNamed:imageName];
}



- (void)playerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(Player *)player
{
  
  [self.players addObject:player];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] - 1) inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  [self dismissViewControllerAnimated:YES completion:nil];
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      [self.players removeObjectAtIndex:indexPath.row];
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];

    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


#pragma mark - PlayerDetailsViewControllerDelegate

- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
  [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller
{
  [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"AddPlayer"]) {
    UINavigationController *navigationController = segue.destinationViewController;
    PlayerDetailsViewController *playerDetailsViewController = [navigationController viewControllers][0];
    playerDetailsViewController.delegate = self;
  }
}


@end
