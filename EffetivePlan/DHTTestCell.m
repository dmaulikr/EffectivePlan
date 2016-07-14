//
//  DHTTestCell.m
//  EffetivePlan
//
//  Created by happyo on 16/7/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTTestCell.h"
#import "ReactiveCocoa.h"

@interface DHTTestCell ()

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UITextField *txfValue;

@end
@implementation DHTTestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        
    }
    
    return self;
}

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 44)];
    self.txfValue = [[UITextField alloc] initWithFrame:CGRectMake(0, 44, CGRectGetWidth(self.bounds), 44)];
    
    [self addSubview:self.lblTitle];
    [self addSubview:self.txfValue];
    self.backgroundColor = [UIColor blueColor];
}

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item
{
    return 88;
}

- (void)configCellWithItem:(DHTTableViewItem *)item
{
    DHTTestItem *testItem = (DHTTestItem *)item;
    
    self.lblTitle.text = testItem.title;
    RAC(testItem, textValue) = self.txfValue.rac_textSignal;
}

@end
