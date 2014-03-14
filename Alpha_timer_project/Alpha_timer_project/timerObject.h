//
//  timerObject.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/10/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface timerObject : NSObject
{
    NSDate *dateStopped;
    NSDate *dateBack;
    
    int timePassedIn;
}

- (id)initWithTime:(int)time andName:(NSString *)name;

@end
