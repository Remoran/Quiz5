//
//  Task.h
//  Quiz5
//
//  Created by Ryan on 3/14/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic) float urgency;
@property (nonatomic, strong) NSDate *dueDate;
@property (nonatomic, copy) NSString *taskName;

@end
