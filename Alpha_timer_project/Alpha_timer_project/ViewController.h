//
//  ViewController.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/1/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
{
    IBOutlet UICollectionView *mainCollectionView;
}


-(IBAction)onClick:(id)sender;


@end
