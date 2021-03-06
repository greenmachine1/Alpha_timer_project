//
//  CapViewController.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "CapViewController.h"

@interface CapViewController ()

@end

@implementation CapViewController

@synthesize returnCapInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [nameOfCap setDelegate:self];
    [machineOfCap setDelegate:self];
    [bankOfCap setDelegate:self];
    
    
}


-(IBAction)onClick:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    // -- the done button
    if(button.tag == 0){
        
        // ********* if the text entered has nothing in it then... ********** //
        if([nameOfCap.text isEqualToString:@""]){
            
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter the person who the cap is for" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [newAlert show];
            
        }else{
            
            // -- my code block that returns to the main view
            returnCapInfo(nameOfCap.text, machineOfCap.text, bankOfCap.text);
            
            
            // -- dismissing this view
            [self dismissViewControllerAnimated:TRUE completion:nil];
        }
        
    }
    
    
    else if(button.tag == 1){
        
        // -- dismissing this view
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [nameOfCap resignFirstResponder];
    [bankOfCap resignFirstResponder];
    [machineOfCap resignFirstResponder];
    
    return true;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
