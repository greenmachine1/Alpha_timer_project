//
//  timerObject.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/10/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "timerObject.h"

@implementation timerObject
- (id)initWithTime:(int)time andName:(NSString *)name
{
    self = [super init];
    if (self) {
    
        timePassedIn = time;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPause:) name:@"NotifyOnPause" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didResume:) name:@"NotifyOnResume" object:nil];
        
    }
    return self;
}





// **** meant to grab the time when the app has **** //
// **** gone to the background **** //
-(void)didPause:(NSNotificationCenter *)notify{
    
    
    
    
    // **** getting the time of the stop **** //
    dateStopped = [[NSDate alloc] init];
    
    // **** converting it to an int **** //
    dateStopInInt = [dateStopped timeIntervalSince1970];
    
    NSLog(@"time when stopped %@", dateStopped);
    
    
}





// **** meant to grab the time when the app has **** //
// **** gone to the foreground **** //
-(void)didResume:(NSNotificationCenter *)notify{
    
    
    
    // **** getting the date on resume **** //
    dateBack = [[NSDate alloc] init];
    
    dateResmeInInt = [dateBack timeIntervalSince1970];
    
    
    // **** the difference between the stop time and the **** //
    // **** resume time **** //
    totalDifferenceInTime = dateResmeInInt - dateStopInInt;
    
    NSLog(@"time when resumed %@", dateBack);
    
    NSLog(@"time difference %i", totalDifferenceInTime);
    
    
}


// ************* called when the object is deleted ********** //
- (void)dealloc{
    
    // ********** removes object from being notified when deleted ********** //
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}




@end
