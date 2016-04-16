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

@end
@implementation DHTPlanCell

//- (void)awakeFromNib {
//    // Initialization code
//}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
- (void)configureCellWithData:(NSDictionary *)dict
{
    // TODO
    NSString *title = [dict objectForKey:@"title"];
    NSString *description = [dict objectForKey:@"description"];
    
    self.lblTitle.text = title;
    self.lblDescription.text = description;
    
}

@end
