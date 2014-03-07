//
//  CapViewController.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnCapInfo)(NSString *, NSString *, NSString *);
@interface CapViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *nameOfCap;
    IBOutlet UITextField *bankOfCap;
    IBOutlet UITextField *machineOfCap;
    
    ReturnCapInfo returnCapInfo;
}

@property (nonatomic, strong)ReturnCapInfo returnCapInfo;

@end
