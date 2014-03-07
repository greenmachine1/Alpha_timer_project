//
//  customBreakOrCapCell.h
//  Alpha_timer_project
//
//  Created by Cory Green on 3/3/14.
//  Copyright (c) 2014 Cory Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customBreakOrCapCell : UICollectionViewCell
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *typeLabel;
    IBOutlet UILabel *machineNumberLabel;
}


@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UILabel *machineNumberLabel;
@end
