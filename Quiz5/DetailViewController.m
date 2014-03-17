//
//  DetailViewController.m
//  Quiz5
//
//  Created by Ryan on 3/17/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "DetailViewController.h"
#import "Task.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.nameField.text = self.task.taskName;
    self.urgencyLabel.text = [NSString stringWithFormat:@"%.2f", self.urgencySlider.value];
    self.urgencySlider.value = self.task.urgency;
    self.dueDatePicker.date = self.task.dueDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)urgencyChanged:(id)sender
{
    self.urgencyLabel.text = [NSString stringWithFormat:@"%.2f", self.urgencySlider.value];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameField resignFirstResponder];
    return YES;
}

- (IBAction)saveClick:(id)sender
{
    self.task.taskName   = self.nameField.text;
    self.task.urgency = self.urgencySlider.value;
    self.task.dueDate = self.dueDatePicker.date;
    [[self navigationController] popViewControllerAnimated:YES];
    self.dismissBlock();
}

@end
