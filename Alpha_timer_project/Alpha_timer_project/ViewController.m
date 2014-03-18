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
    
    colorDictionary = [[NSMutableDictionary alloc] init];
    
    namesOfKeysArray = [[NSMutableArray alloc] init];
    
    timeDictionary = [[NSMutableDictionary alloc] init];
    
    pauseOrResumeDictionary = [[NSMutableDictionary alloc] init];
    
    colorOfObject = [[NSString alloc] init];
    
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
            
            // **** setting the toggle to true **** //
            [pauseOrResumeDictionary setObject:@"True" forKey:name];
            
            
            
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
            
            // **** setting the toggle to true **** //
            [pauseOrResumeDictionary setObject:@"True" forKey:capName];
            
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
        
        // **** getting the type back **** //
        NSString *typeObject = [[NSString alloc] init];
        typeObject = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnType];
        
        
        // **** getting the bank back **** //
        NSString *bankObject = [[NSString alloc] init];
        bankObject = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnBank];
        
        
        // **** getting the machine number back **** //
        NSString *machineObject = [[NSString alloc] init];
        machineObject = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnMachine];
        
        // **** setting the color for the object **** //
        colorOfObject = [colorDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]];
        
        
        // **** getting the time **** //
        timeReturned = [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]]returnTime];
        
        
        timeString = [timeDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]];
        
        // **** putting the bank and machine into readable format **** //
        NSString *bankPlusMachine;
        if([typeObject  isEqual: @"cap"]){
            bankPlusMachine = [[NSString alloc] initWithFormat:@"Bank %@-%@", bankObject, machineObject];
        }else{
            bankPlusMachine = @"";
        }
        
        // **** deciding which color to show **** //
        if(colorOfObject == NULL){
            cell.backgroundColor = [UIColor greenColor];
            cell.nameLabel.textColor = [UIColor blackColor];
            cell.typeLabel.textColor = [UIColor blackColor];
            cell.timeLabel.textColor = [UIColor blackColor];
            cell.machineNumberLabel.textColor = [UIColor blackColor];
        }else if([colorOfObject  isEqual: @"Green"]){
            cell.backgroundColor = [UIColor greenColor];
            cell.nameLabel.textColor = [UIColor blackColor];
            cell.typeLabel.textColor = [UIColor blackColor];
            cell.timeLabel.textColor = [UIColor blackColor];
            cell.machineNumberLabel.textColor = [UIColor blackColor];
        }else if([colorOfObject isEqual:@"Yellow"]){
            cell.backgroundColor = [UIColor yellowColor];
            cell.nameLabel.textColor = [UIColor blackColor];
            cell.typeLabel.textColor = [UIColor blackColor];
            cell.timeLabel.textColor = [UIColor blackColor];
            cell.machineNumberLabel.textColor = [UIColor blackColor];
        }else if([colorOfObject isEqual:@"Red"]){
            cell.backgroundColor = [UIColor redColor];
            cell.nameLabel.textColor = [UIColor whiteColor];
            cell.typeLabel.textColor = [UIColor whiteColor];
            cell.timeLabel.textColor = [UIColor whiteColor];
            cell.machineNumberLabel.textColor = [UIColor whiteColor];
        }
        cell.nameLabel.text = nameObject;
        cell.typeLabel.text = typeObject;
        cell.timeLabel.text = timeString;
        cell.machineNumberLabel.text = bankPlusMachine;
        
    }
    
    // **** returning it all **** //
    return  cell;
}






// ********** user selects and item then decides what to do ********** //
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // **** changing the wording of my alert view box **** //
    if([[pauseOrResumeDictionary objectForKey:[namesOfKeysArray objectAtIndex:indexPath.row]] isEqualToString:@"True"]){
        
        pauseOrResumeLogo = @"Pause Timer";
        
    }else{
        
        pauseOrResumeLogo = @"Resume Timer";
        
    }
    
    NSString *nameString = [[NSString alloc] initWithFormat:@"Event for %@", [namesOfKeysArray objectAtIndex:indexPath.row]];
    
    
    // **** showing an alert view giving the user the option to delete or pause/resume timer **** //
    UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:nameString message:@"What would you like to do?" delegate:self cancelButtonTitle:@"Delete" otherButtonTitles:@"Cancel",pauseOrResumeLogo, nil];
    
    [newAlert show];
    
    // *********** marking the index that the user seleced ********** //
    selectedIndex = indexPath.row;
}








// *********** alert that pops up upon selecting an item ********** //
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 0){
        
        // **** stopping the timer **** //
        [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]] stopTimer];
        
        // **** removing the timer **** //
        [capOrBreakDictionary removeObjectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]];
        
        // **** removing the timer dictionary **** //
        [timeDictionary removeObjectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]];
        
        // **** removing the color dictionary **** //
        [colorDictionary removeObjectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]];
        
        // **** removing the names array **** //
        [namesOfKeysArray removeObjectAtIndex:selectedIndex];
        
        // **** adjusting the mainCollectionView **** //
        [mainCollectionView reloadData];
        
    }
    
    // **** ok so I need to create an NSDictionary that will hold true or false values for
    // **** each object
    else if(buttonIndex == 2){
        
        // **** Toggles back and forth from pause to resume **** //
    
        // **** pause ****
        if([[pauseOrResumeDictionary objectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]] isEqualToString:@"True"]){
            
            // **** toggling it back and forth **** //
            [pauseOrResumeDictionary setObject:@"False" forKey:[namesOfKeysArray objectAtIndex:selectedIndex]];
            
            
            // **** stopping of the timer **** //
            [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]] stopTimer];
            
        // **** resume timer **** //
        }else{
            
            // **** toggling it back and forth **** //
            [pauseOrResumeDictionary setObject:@"True" forKey:[namesOfKeysArray objectAtIndex:selectedIndex]];
            
            
            // **** resuming of the timer **** //
            [[capOrBreakDictionary objectForKey:[namesOfKeysArray objectAtIndex:selectedIndex]] resumeTimer];

        }
        
    }
}




// ******** From the main delegate ********** //
-(void)updateTime:(NSString *)time name:(NSString *)nameOfObject color:(NSString *)color{
    
    [colorDictionary setObject:color forKey:nameOfObject];
    
    // ** setting up an NSDictionary to hold the time passed in
    [timeDictionary setObject:time forKey:nameOfObject];
    
    
    [mainCollectionView reloadData];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
