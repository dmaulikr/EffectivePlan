//
//  DHTAddPlan.m
//  EffetivePlan
//
//  Created by happyo on 15/5/11.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTAddPlanView.h"

@interface DHTAddPlanView ()

@property (nonatomic, strong) UITextField *titleField;

@property (nonatomic, strong) UITextField *instructionField;

@end
@implementation DHTAddPlanView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    
    return self;
}

#pragma mark - my method - 

- (void)initUI
{
    self.titleField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.titleField.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleField.placeholder = @"标题";
    [self addSubview:self.titleField];
    
    self.instructionField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.instructionField.translatesAutoresizingMaskIntoConstraints = NO;
    self.instructionField.placeholder = @"描述";
    [self addSubview:self.instructionField];
    
    NSMutableArray *tempConstraints = [NSMutableArray array];
    NSDictionary *nameMap = @{@"titleField" : self.titleField, @"instructionField" : self.instructionField};
    
    [tempConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[titleField(==20)]-10-[instructionField]" options:0 metrics:nil views:nameMap]];
    
    [tempConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[titleField]-10-|" options:0 metrics:nil views:nameMap]];
    
    [tempConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[instructionField]-10-|" options:0 metrics:nil views:nameMap]];
    
    [self addConstraints:tempConstraints];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
