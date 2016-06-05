//
//  UITableViewCell+Identifier.m
//  EffetivePlan
//
//  Created by happyo on 16/6/5.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "UITableViewCell+Identifier.h"

@implementation UITableViewCell (Identifier)

+ (NSString *)cellReuseIdentifier
{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}

@end
