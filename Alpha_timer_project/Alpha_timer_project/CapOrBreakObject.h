//
//  CapOrBreakObject.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/7/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol capOrBreakObjectProtocol <NSObject>

@required

// **** the required method
-(void)updateTime:(NSString *)time name:(NSString *)nameOfObject color:(NSString *)color;

@end


@interface CapOrBreakObject : NSObject
{
    NSString *nameString;
    NSString *typeString;
    NSString *bankString;
    NSString *machineString;
    
    int timeInt;
    
    NSDate *timeInitialized;
    
    NSDate *dateStopped;
    NSDate *dateBack;
    
    int dateStopInInt;
    int dateResmeInInt;
    
    int dateInitializedValue;
    
    // **** total time difference **** //
    int totalDifferenceInTime;
    
    
    // **** the timer itself **** //
    NSTimer *timer;
    
    id<capOrBreakObjectProtocol> delegate;
    
    // **** part of the UILocalNotification **** //
    UIApplication* application;
    
    // **** the local notification **** //
    UILocalNotification* notifyAlarm;
    
    
    // **** color string **** //
    NSString *colorString;
}

// -- basically passing in all the information
-(id)initWithName:(NSString *)name timerType:(NSString *)type bankLocation:(NSString *)bank machineLocation:(NSString *)location timeToSet:(int)time;

-(NSString *)returnNameString;
-(NSString *)returnType;
-(NSString *)returnBank;
-(NSString *)returnMachine;
-(int)returnTime;

-(void)stopTimer;
-(void)resumeTimer;

@property (nonatomic, strong) id delegate;


@end

