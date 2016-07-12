//
//  DHTPlanCell.m
//  EffetivePlan
//
//  Created by happyo on 15/5/10.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPlanCell.h"
#import "DHTPlanListReformerKeys.h"

@interface DHTPlanCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property (weak, nonatomic) IBOutlet UILabel *lblDate;

@end
@implementation DHTPlanCell

- (void)configureCellWithData:(NSDictionary *)dict
{
    self.lblTitle.text = [dict objectForKey:kPlanListDataKeyTitle];
    self.lblDescription.text = [dict objectForKey:kPlanListDataKeyDescription];
    self.lblDate.text = [dict objectForKey:kPlanListDataKeyCreatedDate];
}

@end
