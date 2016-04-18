//
//  DHTUpdatePlan.m
//  EffetivePlan
//
//  Created by happyo on 16/4/18.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTUpdatePlan.h"

@implementation DHTUpdatePlan

- (NSString *)methodName
{
    return @"updatePlan";
}

- (NSString *)serviceType
{
    return kDHTServicePlan;
}

- (DHTRequestType)requestType
{
    return DHTRequestTypeGET;
}


@end
