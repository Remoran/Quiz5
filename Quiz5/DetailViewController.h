//
//  DetailViewController.h
//  Quiz5
//
//  Created by Ryan on 3/17/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;
@interface DetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *urgencyLabel;
@property (weak, nonatomic) IBOutlet UISlider *urgencySlider;

@property (strong, nonatomic) void (^dismissBlock)(void);
@property (weak, nonatomic) Task *task;

- (IBAction)saveClick:(id)sender;
- (IBAction)urgencyChanged:(id)sender;

@end