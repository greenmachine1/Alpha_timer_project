//
//  ViewController.m
//  Alpha_timer_project
//
//  Created by Cory Green on 3/1/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}



// -- main screen button clicks
-(IBAction)onClick:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    // -- adding a new break
    if(button.tag == 0){
        
        NSLog(@"Add a new break");
    
    // -- adding a new cap
    }else if(button.tag == 1){
        
        NSLog(@"Add a new cap");
        
    }
    
    
}


// -- how many cells
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
}


// -- the contents of each cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *kCollectionViewCellIdentifier = @"Cells";
    
    
    
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];

    
    
    
    cell.backgroundColor = [UIColor blueColor];
    
    return cell;
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
