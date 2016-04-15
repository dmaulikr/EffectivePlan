//
//  DHTServicePlan.m
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTServicePlan.h"

@implementation DHTServicePlan

- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://localhost:8080";
}

- (NSString *)offlineApiBaseUrl
{
    return self.onlineApiBaseUrl;
}

@end
