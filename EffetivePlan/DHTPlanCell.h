//
//  DHTPlanCell.h
//  EffetivePlan
//
//  Created by happyo on 15/5/10.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTPhoneTableViewCell.h"

@interface DHTPlanCell : DHTPhoneTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;

@end
