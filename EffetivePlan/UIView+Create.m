//
//  UIView+Create.m
//  EffetivePlan
//
//  Created by happyo on 15/5/16.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "UIView+Create.h"

@implementation UIView (create)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)autolayoutView
{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
//    view.translatesAutoresizingMaskIntoConstraints = NO;
//    view.backgroundColor = [UIColor clearColor];
    
    id a = [[[self class] alloc] initWithFrame:CGRectZero];
    [(UIView *)a setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return a;
}

@end
