//
//  BreakViewController.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "BreakViewController.h"

@interface BreakViewController ()

@end


@implementation BreakViewController

// -- my code block
@synthesize returnInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        // -- setting up the default
        // -- break time
        breakTime = 15;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // -- important to set the textField delegate
    // -- to self
    [nameOfPersonOnBreak setDelegate:self];
    
    // -- this is my segmented control portion
    [timeSegment addTarget:self action:@selector(segmentOnClick:) forControlEvents:UIControlEventValueChanged];
}



-(void)segmentOnClick:(id)sender{
    
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    if([segmentControl selectedSegmentIndex] == 0){
        
        breakTime = 15;
        
    }else if([segmentControl selectedSegmentIndex] == 1){
        
        breakTime = 30;
    }
    
}




-(IBAction)onClick:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    // -- the done button
    if(button.tag == 0){
        
        NSLog(@"%@ %i", nameOfPersonOnBreak.text, breakTime);
        
        // -- calling the code block to return data
        // -- to my mainview controller
        returnInfo(nameOfPersonOnBreak.text, breakTime);
        
        // -- dismissing this view
        [self dismissViewControllerAnimated:TRUE completion:nil];
        
    }
}


// -- called when the return key is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [nameOfPersonOnBreak resignFirstResponder];
    
    return YES;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
