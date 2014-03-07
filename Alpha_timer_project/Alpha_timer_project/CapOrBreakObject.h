//
//  CapOrBreakObject.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/7/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CapOrBreakObject : NSObject
{
    NSString *nameString;
    NSString *typeString;
    NSString *bankString;
    NSString *machineString;
    
    int timeInt;
}

// -- basically passing in all the information
-(id)initWithName:(NSString *)name timerType:(NSString *)type bankLocation:(NSString *)bank machineLocation:(NSString *)location timeToSet:(int)time;

-(NSString *)returnNameString;
-(NSString *)returnType;
-(NSString *)returnBank;
-(NSString *)returnMachine;
-(int)returnTime;




@end

