//
//  CapOrBreakObject.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/7/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "CapOrBreakObject.h"

#import <AudioToolbox/AudioToolbox.h>


@implementation CapOrBreakObject

@synthesize delegate;


// **** init method, passing in the name, type, bank, location and time **** //
-(id)initWithName:(NSString *)name timerType:(NSString *)type bankLocation:(NSString *)bank machineLocation:(NSString *)location timeToSet:(int)time{
    
    self = [super init];
    if (self) {
        
        nameString = name;
        typeString = type;
        bankString = bank;
        machineString = location;
        
        
        // **** makes sure that the notification for when the time **** //
        // **** is done, only gets fired once **** //
        triggerAfterFirstNotification = FALSE;
        
        
        // *** getting the seconds of the time *** //
        // *** passed in *** //
        timeInt = time * 60;
        
        // **** used for testing time **** //
        //timeInt = time;
        
        
        // **** for the cap, the time starts at 0 and goes up **** //
        if([typeString isEqual:@"cap"]){
            timeInt = 0;
        }
        
        // **** default color **** //
        //colorString = @"Green";
        
        // **** default status **** //
        didStopByUser = FALSE;

        timeInitialized = [[NSDate alloc] init];
        
        dateInitializedValue = [timeInitialized timeIntervalSince1970];
        
        // **** getting my notifications ****
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPause:) name:@"NotifyOnPause" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didResume) name:@"NotifyOnResume" object:nil];
        
        
        // **** starting the timer **** //
        [self timerSection];
        
        }
    
    return self;
}




// **** calling the timer **** //
-(void)timerSection{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerMethod:) userInfo:nil repeats:TRUE];
    
    [timer fire];
    
}






// **** method that gets called every second **** //
-(void)timerMethod:(NSTimer *)time{

    // **** if this object is a break **** //
    if([typeString isEqual:@"break"]){
    

        // **** decrement the time **** //
        timeInt--;
    
        // **** setting the colors
        // **** Green **** //
        if(timeInt > 300){
            colorString = @"Green";
        }
        // **** Yellow **** //
        if((timeInt < 300) && (timeInt > 0)){
            colorString = @"Yellow";
        }
        // **** red **** //
        else if(timeInt <= 0){
            colorString = @"Red";
        }
    
    
    
        // **** this gets passed back to the main viewController **** //
        // **** to update the time and color within each cell ****
        [self.delegate updateTime:[self dateFormat:timeInt ] name:nameString color:colorString];
    
    
    
        // **** if it gets to 0, stop the timer and send an alert **** //
        if((timeInt <= 0) && (triggerAfterFirstNotification != TRUE)){
            
            [timer invalidate];
                
            UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Done" message:@"Breaks up!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        
            // **** vibrate on alert **** //
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        
            [newAlert show];
            
            triggerAfterFirstNotification = TRUE;
            
        }
        
    // **** if this object is a cap **** //
    }else{
        
        timeInt++;
        
        if((timeInt >= 7200) && (triggerAfterFirstNotification != TRUE)){
            
            colorString = @"Red";
            
            UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Done" message:@"Breaks up!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            
            // **** vibrate on alert **** //
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
            
            [newAlert show];
            
            triggerAfterFirstNotification = TRUE;
        
        }else if(timeInt < 7200){
            
            colorString = @"Green";
            
        }
        
        
        // **** this gets passed back to the main viewController **** //
        // **** to update the time and color within each cell ****
        [self.delegate updateTime:[self dateFormat:timeInt ] name:nameString color:colorString];
        
    
    }
    
}







// **** meant to grab the time when the app has **** //
// **** gone to the background **** //
-(void)didPause:(NSNotificationCenter *)notify{
    
    // **** getting the time of the stop **** //
    dateStopped = [[NSDate alloc] init];
    
    dateStopInInt = [dateStopped timeIntervalSince1970];
    
    
    // **** stop the timer **** //
    [timer invalidate];
    
    
    if([typeString isEqual:@"break"]){
        
        if(!(timeInt <= 0)){
        
            // **** notification for when the app is in the background **** //
            NSDate *timeStopped = [[NSDate date] dateByAddingTimeInterval:timeInt];
            application = [UIApplication sharedApplication];
    
            NSString *nameOfAlarmString = [[NSString alloc] initWithFormat:@"%@ times up!", nameString];
    
    
            notifyAlarm = [[UILocalNotification alloc] init];
        
            if(notifyAlarm){
        
                notifyAlarm.fireDate = timeStopped;
                notifyAlarm.repeatInterval = 0;
                notifyAlarm.alertBody = nameOfAlarmString;
                
        
                [application scheduleLocalNotification:notifyAlarm];
            
        
            }
        }
        
    }
    
    // **** if the type is cap **** //
    else{
        
        int timeToReach = 7200 - timeInt;
        
        if(!(timeToReach <= 0)){
        
            NSDate *timeStopped = [[NSDate date] dateByAddingTimeInterval:timeToReach];
        
            NSLog(@"time in the future%@", timeStopped);
        
            application = [UIApplication sharedApplication];
        
            NSString *nameOfAlarmString = [[NSString alloc] initWithFormat:@"%@ times up!", nameString];
        
        
            notifyAlarm = [[UILocalNotification alloc] init];
        
            if(notifyAlarm){
            
                notifyAlarm.fireDate = timeStopped;
                notifyAlarm.repeatInterval = 0;
                notifyAlarm.alertBody = nameOfAlarmString;
            
            
                [application scheduleLocalNotification:notifyAlarm];
            
            
            }
        }
        
    }
    

}







// **** formatting the date in 0:00:00 fashion **** //
-(NSString *)dateFormat:(int)time{
    
    int timeInHours = time / 60 / 60;
    int timeInMinutes = time / 60 % 60;
    int timeInSeconds = time % 60;
    
    NSString *timeInHoursTempString = [[NSString alloc] initWithFormat:@"%i", timeInHours];
    NSString *timeInMinutesTempString = [[NSString alloc] initWithFormat:@"%i", timeInMinutes];
    NSString *timeInSecondsTempString = [[NSString alloc] initWithFormat:@"%i", timeInSeconds];
    
    if(timeInHours < 10){
        
        timeInHoursTempString = [NSString stringWithFormat:@"0%i", timeInHours];
        
    }
    
    if(timeInMinutes < 10){
        
        timeInMinutesTempString = [NSString stringWithFormat:@"0%i", timeInMinutes];
    }
    
    if(timeInSeconds < 10){
        
        timeInSecondsTempString = [NSString stringWithFormat:@"0%i", timeInSeconds];
        
    }

    if(time <= 0){
        
        return @"00:00:00";
        
    }else{
        
        
        NSString *tempString = [[NSString alloc] initWithFormat:@"%@:%@:%@", timeInHoursTempString, timeInMinutesTempString, timeInSecondsTempString];
        
        return tempString;
    }
}





// **** meant to grab the time when the app has **** //
// **** gone to the foreground **** //
-(void)didResume{
    
    // **** if the user did not stop the timer manually **** //
    if(!(didStopByUser)){
        
        // **** getting the date on resume **** //
        dateBack = [[NSDate alloc] init];
    
        dateResmeInInt = [dateBack timeIntervalSince1970];
    
    
        // **** the difference between the stop time and the **** //
        // **** resume time **** //
        totalDifferenceInTime = dateResmeInInt - dateStopInInt;
    
        if([typeString isEqual:@"break"]){
            
            // **** getting the total time back and starting back up the timer **** //
            timeInt = timeInt - totalDifferenceInTime;
        }
        else{
            
            // **** getting the total time back and starting back up the timer **** //
            timeInt = timeInt + totalDifferenceInTime;
            
        }

        // **** starting the timer back up **** //
    
        [self timerSection];
    
        

        // **** cancelling the notification **** //
        [application cancelLocalNotification:notifyAlarm];
        
    }

    
    
}








// *********** return statements ********** //

-(NSString *)returnNameString{
    
    return nameString;
}

-(NSString *)returnType{
    
    return typeString;
}

-(NSString *)returnBank{
    
    return bankString;
}

-(NSString *)returnMachine{
    
    return machineString;
}

-(int)returnTime{
    
    return timeInt;
}




// **** stops the timer **** //
-(void)stopTimer{
    
    didStopByUser = TRUE;
    
    [timer invalidate];
    
}




// **** resumes the timer **** //
-(void)resumeTimer{
    
    didStopByUser = FALSE;
    
    [self timerSection];
}





// ************* called when the object is deleted ********** //
- (void)dealloc{
    
    // ********** removes object from being notified when deleted ********** //
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // **** stops the timer **** //
    [timer invalidate];
    
    // **** cancels the local notification **** //
    [application cancelLocalNotification:notifyAlarm];
    
    
}






@end
