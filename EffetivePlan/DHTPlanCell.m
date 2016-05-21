//
//  DHTPlanCell.m
//  EffetivePlan
//
//  Created by happyo on 15/5/10.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPlanCell.h"

@interface DHTPlanCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property (weak, nonatomic) IBOutlet UILabel *lblDate;


@end
@implementation DHTPlanCell

- (void)configureCellWithData:(NSDictionary *)dict
{
    // TODO
    NSString *title = [dict objectForKey:@"title"];
    NSString *description = [dict objectForKey:@"description"];
    NSString *date = [dict objectForKey:@"createdDate"];
    
    self.lblTitle.text = title;
    self.lblDescription.text = description;
    self.lblDate.text = date;
}

@end
