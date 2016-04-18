//
//  DHTGetPlanManager.m
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTGetPlanManager.h"
#import "DHTNetworkingConfiguration.h"

@implementation DHTGetPlanManager

- (NSString *)methodName
{
    return @"getAllPlan";
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
