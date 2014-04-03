//
//  PlayerDetailsViewController.m
//  003-Storyboards
//
//  Created by liluo on 4/3/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//


#import "PlayerDetailsViewController.h"
#import "Player.h"

@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController

{
  NSString *game;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
  if ((self = [super initWithCoder:aDecoder])) {
    NSLog(@"init PlayerDetailsviewController");
    game = @"Chess";
  }
  return self;
}


- (void)dealloc
{
  NSLog(@"deallo PlayerDetailsViewController");
}


- (void)viewDidLoad
{
  [super viewDidLoad];
  self.detailLabel.text = game;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section == 0) {
    [self.nameTextField becomeFirstResponder];
  }
}

- (IBAction)cancel:(id)sender
{
  [self.delegate playerDetailsViewControllerDidCancel:self];
}


- (IBAction)done:(id)sender
{
  Player *player = [[Player alloc] initWithName:self.nameTextField.text
                                        andGame:game
                                      andRating:1];
  
  [self.delegate playerDetailsViewController:self didAddPlayer:player];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"PickGame"]) {
    GamePickerViewController *gamePickerViewController = segue.destinationViewController;
    gamePickerViewController.delegate = self;
    gamePickerViewController.game = game;
  }
}


- (void)gamePickerViewController:(GamePickerViewController *)controller
                   didSelectGame:(NSString *)theGame
{
  game = theGame;
  self.detailLabel.text = game;
  [self.navigationController popViewControllerAnimated:YES];
}

@end
