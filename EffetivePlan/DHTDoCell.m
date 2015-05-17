//
//  DHTDoCell.m
//  EffetivePlan
//
//  Created by happyo on 15/5/16.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTDoCell.h"

@implementation DHTDoCell

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
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.doNumberLabel = [UILabel autolayoutView];
        [self.contentView addSubview:self.doNumberLabel];
        
        self.doContentLabel = [UILabel autolayoutView];
        [self.contentView addSubview:self.doContentLabel];
        
        NSMutableArray *tempConstraints = [[NSMutableArray alloc] init];
        NSDictionary *dict = @{@"doNumberLabel" : self.doNumberLabel, @"doContentLabel" : self.doContentLabel};
        
        [tempConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[doNumberLabel]" options:0 metrics:nil views:dict]];
        
        [tempConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[doContentLabel]" options:0 metrics:nil views:dict]];
        
        [tempConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[doNumberLabel]-10-[doContentLabel]" options:0 metrics:nil views:dict]];
        
        [self.contentView addConstraints:tempConstraints];
    }
    
    return self;
}

@end
