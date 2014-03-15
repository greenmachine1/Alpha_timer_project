//
//  CapOrBreakObject.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/7/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "CapOrBreakObject.h"


@implementation CapOrBreakObject

@synthesize delegate;


// -- init method, passing in the name, type, bank, location and time
-(id)initWithName:(NSString *)name timerType:(NSString *)type bankLocation:(NSString *)bank machineLocation:(NSString *)location timeToSet:(int)time{
    
    self = [super init];
    if (self) {
        
        nameString = name;
        typeString = type;
        bankString = bank;
        machineString = location;
        
        // *** getting the seconds of the time *** //
        // *** passed in *** //
        timeInt = time * 60;
        
        
        // **** getting my notifications ****
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPause:) name:@"NotifyOnPause" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didResume:) name:@"NotifyOnResume" object:nil];
        
        
        // **** starting the timer **** //
        [self timerSectionSubtract];
        
    }
    return self;
}




// **** calling the timer **** //
-(void)timerSectionSubtract{
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerMethod:) userInfo:nil repeats:TRUE];
    
    [timer fire];
    
    
}






// **** method that gets called every second **** //
-(void)timerMethod:(NSTimer *)time{
    
    NSLog(@"%i", timeInt);
    
    
    // **** decrement the time **** //
    timeInt--;
    
    // **** this gets passed back to the main viewController **** //
    // **** to update the time within each cell ****
    [self.delegate updateTime:timeInt name:nameString];
    
    
    // **** if it gets to 0, stop the timer **** //
    if(timeInt == 0){
        
        [timer invalidate];
    }
    
}







// **** meant to grab the time when the app has **** //
// **** gone to the background **** //
-(void)didPause:(NSNotificationCenter *)notify{
    
    // **** getting the time of the stop **** //
    dateStopped = [[NSDate alloc] init];
    
    
    // **** stop the timer **** //
    [timer invalidate];
    
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
    
    
    
    
    // **** getting the total time back and starting back up the timer **** //
    timeInt = timeInt - totalDifferenceInTime;
    
    
    
    
    
    // **** starting the timer back up **** //
    [self timerSectionSubtract];
    
    
    
    
    NSLog(@"time when resumed %@", dateBack);
    
    NSLog(@"time difference %i", totalDifferenceInTime);
    
    
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






// ************* called when the object is deleted ********** //
- (void)dealloc{
    
    // ********** removes object from being notified when deleted ********** //
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}






@end
