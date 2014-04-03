//
//  GamePickerViewController.m
//  003-Storyboards
//
//  Created by liluo on 4/3/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//

#import "GamePickerViewController.h"

@interface GamePickerViewController ()

@end

@implementation GamePickerViewController

{
  NSArray *games;
  NSUInteger selectIndex;
}


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
    
  games = @[@"Angry Birds",
            @"Russian Roulette",
            @"Spin the Bottle",
            @"Texas Hold'em Poker",
            @"Tic-Tac-Toe"];
  selectIndex = [games indexOfObject:self.game];
}


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return games.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"
                                                          forIndexPath:indexPath];
  cell.textLabel.text = games[indexPath.row];
  
  if (indexPath.row == selectIndex) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  } else {
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  if (selectIndex != NSNotFound) {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0]];
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  
  selectIndex = indexPath.row;
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = UITableViewCellAccessoryCheckmark;
  NSString *game = games[indexPath.row];
  [self.delegate gamePickerViewController:self didSelectGame:game];
}


@end
