//
//  BreakViewController.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^returnBreakInfo)(NSString *, int);
@interface BreakViewController : UIViewController<UITextFieldDelegate>
{
    int breakTime;
    
    IBOutlet UITextField *nameOfPersonOnBreak;
    
    IBOutlet UISegmentedControl *timeSegment;
    
    
    returnBreakInfo returnInfo;
}

@property (nonatomic, strong)returnBreakInfo returnInfo;
@end
