//
//  AppDelegate.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSDate *dateUponExiting;
    NSDate *dateUponReentry;
}

@property (strong, nonatomic) UIWindow *window;

@end
