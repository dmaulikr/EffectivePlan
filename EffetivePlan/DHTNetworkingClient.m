//
//  DHTNetworkingClient.m
//  EffetivePlan
//
//  Created by happyo on 15/5/28.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTNetworkingClient.h"

static NSString * const DHTNetworkingBaseURL = @"https://api.app.net/";

@implementation DHTNetworkingClient

+ (instancetype)sharedClient
{
    static DHTNetworkingClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedClient) {
            sharedClient = [[DHTNetworkingClient alloc] initWithBaseURL:[NSURL URLWithString:DHTNetworkingBaseURL]];
        }
    });
    return sharedClient;
}

@end
