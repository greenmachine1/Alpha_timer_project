//
//  ViewController.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/2/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UICollectionViewController<UICollectionViewDelegate, UICollectionViewDataSource>
{
    IBOutlet UICollectionView *mainCollectionView;
}
@end
