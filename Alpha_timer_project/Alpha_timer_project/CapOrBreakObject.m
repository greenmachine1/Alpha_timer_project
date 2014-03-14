//
//  CapOrBreakObject.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/7/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "CapOrBreakObject.h"

#import "timerObject.h"

@implementation CapOrBreakObject


// -- init method, passing in the name, type, bank, location and time
-(id)initWithName:(NSString *)name timerType:(NSString *)type bankLocation:(NSString *)bank machineLocation:(NSString *)location timeToSet:(int)time{
    
    self = [super init];
    if (self) {
        
        nameString = name;
        typeString = type;
        bankString = bank;
        machineString = location;
        timeInt = time;
        
        
        // ********** calling on the timer object here with the time ********** //
        newTimerObject = [[timerObject alloc] initWithTime:timeInt andName:nameString];
        
    }
    return self;
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






@end
