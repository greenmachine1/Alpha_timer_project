//
//  ViewController.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIAlertViewDelegate>
{
    
    IBOutlet UICollectionView *mainCollectionView;
    
    NSMutableDictionary *capOrBreakDictionary;
    
    NSMutableArray *namesOfKeysArray;
    
    int selectedIndex;
}
@end
