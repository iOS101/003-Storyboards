//
//  RatingPickerViewController.h
//  003-Storyboards
//
//  Created by liluo on 4/3/14.
//  Copyright (c) 2014 liluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RatingPickerViewController;

@protocol RatingPickerViewControllerDelegate <NSObject>
- (void)ratingPickerViewController:(RatingPickerViewController *)controller didSelectRating:(NSString *)rating;
@end

@interface RatingPickerViewController : UITableViewController

@property (nonatomic, weak) id <RatingPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *rating;

@end
