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
    
    NSLog(@"Went to background");
    
    dateStopped = [[NSDate alloc] init];
    
    NSLog(@"time when stopped %@", dateStopped);
    
    
}





// **** meant to grab the time when the app has **** //
// **** gone to the foreground **** //
-(void)didResume:(NSNotificationCenter *)notify{
    
    NSLog(@"Came Back");
    
    dateBack = [[NSDate alloc] init];
    
    NSLog(@"time when stopped %@", dateBack);
    
    
}


// ************* called when the object is deleted ********** //
- (void)dealloc{
    
    // ********** removes object from being notified when deleted ********** //
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}




@end
