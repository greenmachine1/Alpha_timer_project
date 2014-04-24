//
//  Settings_layer.m
//  Alpha_timer_project
//
//  Created by Cory Green on 4/23/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "Settings_layer.h"


// **** creation of a singleton Data Layer **** //
@implementation Settings_layer

    static Settings_layer *sharedInstance = nil;


// **** creation of a class method **** //
+ (Settings_layer *)sharedInstance{
    
    // **** if there is no instance of this singleton **** //
    // **** make one **** //
    if(sharedInstance == nil){
        
        sharedInstance = [[super allocWithZone:NULL] init];
        
    }
    
    return sharedInstance;
}

-(id)init{
    
    if(self == [super init]){
        
    }
    
    return self;
}




@end
