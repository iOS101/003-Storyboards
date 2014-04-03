//
//  GamePickerViewController.h
//  003-Storyboards
//
//  Created by liluo on 4/3/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GamePickerViewController;

@protocol GamePickerViewControllerDelegate <NSObject>
- (void)gamePickerViewController:(GamePickerViewController *)controller
                   didSelectGame:(NSString *)game;
@end


@interface GamePickerViewController : UITableViewController

@property (nonatomic, weak) id <GamePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *game;

@end
