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
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPause:) name:@"NotifyOnPause" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didResume:) name:@"NotifyOnResume" object:nil];
        
    }
    return self;
}



-(void)didPause:(NSNotificationCenter *)notify{
    
    NSLog(@"Went to background");
    
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"NotifyOnPause" object:nil];
    
}


-(void)didResume:(NSNotificationCenter *)notify{
    
    NSLog(@"Came Back");
    
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"NotifyOnResume" object:nil];
    
}



@end
