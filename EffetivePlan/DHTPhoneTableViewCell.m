//
//  DHTPhoneTableViewCell.m
//  EffetivePlan
//
//  Created by happyo on 15/5/16.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPhoneTableViewCell.h"

@implementation DHTPhoneTableViewCell

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        //
    }
    
    return self;
}

+ (NSString *)cellReuseIdentifier
{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}

@end
