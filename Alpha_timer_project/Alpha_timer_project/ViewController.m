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

#import "CapOrBreakObject.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    capOrBreakDictionary = [[NSMutableDictionary alloc] init];
    
    namesOfKeysArray = [[NSMutableArray alloc] init];
    
    timeDictionary = [[NSMutableDictionary alloc] init];

}





// *********** selecting either a break or cap ***************** //
-(IBAction)onClick:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    // ********** taps the break button ********** //
    if(button.tag == 0){
        
        
        
        BreakViewController *breakViewController = [[BreakViewController alloc] initWithNibName:@"BreakViewController" bundle:nil];
        
        // ********** my code block from breakViewController ********** //
        breakViewController.returnInfo = ^(NSString *name, int breakTime){
          
            // ********** getting the break object and passing in info ********** //
            CapOrBreakObject *newCapOrBreakObject = [[CapOrBreakObject alloc] initWithName:name timerType:@"break" bankLocation:@"none" machineLocation:@"none" timeToSet:breakTime];
            
            newCapOrBreakObject.delegate = self;
            
            
            [capOrBreakDictionary setObject:newCapOrBreakObject forKey:name];
            
            // ********* making an array of just names for later usage ********** //
            [namesOfKeysArray addObject:name];
            
            [mainCollectionView reloadData];
            
            NSLog(@"%@", [capOrBreakDictionary allKeys]);
            
            
            
        };
        [self presentViewController:breakViewController animated:TRUE completion:nil];
        
        
    // ********** taps the cap button ********** //
    }else if(button.tag == 1){
        
        
        
        CapViewController *capViewController = [[CapViewController alloc] initWithNibName:@"CapViewController" bundle:nil];
        
        // ********** my code block from capViewController ********** //
        capViewController.returnCapInfo = ^(NSString *capName, NSString *machineNumber, NSString *bankNumber){
            
        
            // ********** the time for this will always be 2 hours, so this is ok to hardcode in ********** //
            CapOrBreakObject *newCapObject = [[CapOrBreakObject alloc] initWithName:capName timerType:@"cap" bankLocation:bankNumber machineLocation:machineNumber timeToSet:120];
            
            newCapObject.delegate = self;
            
            
            
            [capOrBreakDictionary setObject:newCapObject forKey:capName];
            
            // ********* making an array of just names for later usage ********** //
            [namesOfKeysArray addObject:capName];
            
            [mainCollectionView reloadData];
            
            NSLog(@"%@", [capOrBreakDictionary allKeys]);
            
        };
        [self presentViewController:capViewController animated:TRUE completion:nil];
        
        
    }
}




// ********** how many cells ********** //
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return namesOfKeysArray.count;
    
}






// ********** the context of each cell ********** //
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    customBreakOrCapCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath ];

    
    
    if(namesOfKeysArray != nil){
        
        // *********** getting the different portions of the object back ********** //
        NSString *nameObject = [[NSString alloc] init];
        nameObject = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnNameString];
        
        NSString *typeObject = [[NSString alloc] init];
        typeObject = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnType];
        
        NSString *bankObject = [[NSString alloc] init];
        bankObject = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnBank];
        
        NSString *machineObject = [[NSString alloc] init];
        machineObject = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnMachine];
        
        
        // *** this is going to be dynamic data *** //
        timeReturned = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnTime];
        
        
        //timeString = [[NSString alloc] initWithFormat:@"%i", timeReturned];
        
        timeString = [timeDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]];
        
        NSString *bankPlusMachine;
        if([typeObject  isEqual: @"cap"]){
            bankPlusMachine = [[NSString alloc] initWithFormat:@"Bank %@-%@", bankObject, machineObject];
        }else{
            bankPlusMachine = @"";
        }
        
        cell.backgroundColor = [UIColor greenColor];
        cell.nameLabel.text = nameObject;
        cell.typeLabel.text = typeObject;
        cell.timeLabel.text = timeString;
        cell.machineNumberLabel.text = bankPlusMachine;
        
    }
    
    
    return  cell;
}






// ********** user selects and item then decides what to do ********** //
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *nameString = [[NSString alloc] initWithFormat:@"Event for %@", [namesOfKeysArray objectAtIndex:indexPath.row]];
    
    
    UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:nameString message:@"What would you like to do?" delegate:self cancelButtonTitle:@"Delete" otherButtonTitles:@"Pause Timer", nil];
    
    [newAlert show];
    
    // *********** marking the index that the user seleced ********** //
    selectedIndex = indexPath.row;
}








// *********** alert that pops up upon selecting an item ********** //
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 0){
        
        [capOrBreakDictionary removeObjectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]];
        
        [timeDictionary removeObjectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]];
        
        [namesOfKeysArray removeObjectAtIndex:selectedIndex];
        
        [mainCollectionView reloadData];
        
    }
    else if(buttonIndex == 1){
        
        // ************ do something else here for pause timer *********** //
        
    }
}




// ******** From the main delegate ********** //
-(void)updateTime:(int)time name:(NSString *)nameOfObject{
    
    NSString *tempTimeString = [[NSString alloc] initWithFormat:@"%i", time];
    
    
    // ** setting up an NSDictionary to hold the time passed in
    [timeDictionary setObject:tempTimeString forKey:nameOfObject];
    
    
    [mainCollectionView reloadData];
    
    NSLog(@"%i", time);
    NSLog(@"%@", nameOfObject);
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
