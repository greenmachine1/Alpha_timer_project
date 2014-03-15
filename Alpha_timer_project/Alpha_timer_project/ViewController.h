//
//  ViewController.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CapOrBreakObject.h"

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIAlertViewDelegate,capOrBreakObjectProtocol>
{
    
    IBOutlet UICollectionView *mainCollectionView;
    
    NSMutableDictionary *capOrBreakDictionary;
    
    NSMutableDictionary *timeDictionary;
    
    NSMutableArray *namesOfKeysArray;
    
    int selectedIndex;
    
    NSString *timeString;
    
    int timeReturned;
}
@end
