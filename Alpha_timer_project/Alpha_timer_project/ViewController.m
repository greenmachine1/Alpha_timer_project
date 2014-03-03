//
//  ViewController.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "ViewController.h"

#import "customBreakOrCapCell.h"

#import "CapViewController.h"

#import "BreakViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


// -- selecting either a break or cap
-(IBAction)onClick:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    // -- taps the break button
    if(button.tag == 0){
        
        BreakViewController *breakViewController = [[BreakViewController alloc] initWithNibName:@"BreakViewController" bundle:nil];
        
        [self presentViewController:breakViewController animated:TRUE completion:nil];
        
        
    // -- taps the cap button
    }else if(button.tag == 1){
        
        CapViewController *capViewController = [[CapViewController alloc] initWithNibName:@"CapViewController" bundle:nil];
        
        [self presentViewController:capViewController animated:TRUE completion:nil];
        
        
    }
}




// -- how many cells
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 30;
}



// -- the context of each cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    customBreakOrCapCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath ];
    
    cell.backgroundColor = [UIColor yellowColor];
    cell.nameLabel.text = @"Grant";
    cell.typeLabel.text = @"Break";
    cell.timeLabel.text = @"15:12";
    
    return  cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
