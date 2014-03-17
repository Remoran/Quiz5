//
//  Quiz5ViewController.m
//  Quiz5
//
//  Created by Ryan on 3/14/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "Quiz5ViewController.h"
#import "Task.h"
#import "DetailViewController.h"

@interface Quiz5ViewController ()
@property (nonatomic, strong) NSMutableArray *taskList;

@end

@implementation Quiz5ViewController

//- (id)init
//{
//    if (self) {
//        UINavigationItem *n = [self navigationItem];
//    
//        [n setTitle:@"Quiz5"];
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.taskList = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++)
    {
        Task *newTask = [[Task alloc] init];
        NSTimeInterval days = 86400 * i;
        NSDate *now = [[NSDate alloc] init];
        
        // Urgency = i because each task is progresively more urgent
        newTask.urgency = i;
        newTask.dueDate = [now dateByAddingTimeInterval:days];
        newTask.taskName = [NSString stringWithFormat:@"Task %d", i];
        
        [self.taskList addObject:newTask];
    }
    self.title = @"My Tasks";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    Task *selectedTask = [self.taskList objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = selectedTask.taskName;
    
    // Color code the task cell's background colors
    cell.backgroundColor = [UIColor colorWithRed:(selectedTask.urgency * .10) green:((10 - selectedTask.urgency) * .10) blue:0 alpha:1];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    cell.detailTextLabel.text = [formatter stringFromDate:selectedTask.dueDate];

    
    // Displays special icon for high urgency tasks
    if (selectedTask.urgency >= 7)
    {
        [cell.imageView setImage:[UIImage imageNamed:@"urgent.jpg"]];
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    
    DetailViewController *detailView = ((DetailViewController *)[segue destinationViewController]);
    
    detailView.task = self.taskList[[path row]];
    // Compares task's names for ordering (as shown in class)
    detailView.dismissBlock = ^{
        [self.taskList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            Task *t1 = (Task *)obj1;
            Task *t2 = (Task *)obj2;
            return [t1.dueDate compare:t2.dueDate];
        }];
        [[self tableView] reloadData];
    };
    
    detailView.title = ((Task *)self.taskList[[path row]]).taskName;
}


@end
