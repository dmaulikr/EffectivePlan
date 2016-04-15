//
//  DHTNetworkingConfiguration.h
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#ifndef DHTNetworkingConfiguration_h
#define DHTNetworkingConfiguration_h


typedef NS_ENUM(NSInteger, DHTResponseStatus) {
    DHTResponseStatusSuccess,
    DHTResponseStatusErrorTimeout,
    DHTResponseStatusErrorNoNetwork
};

static NSTimeInterval kDHTNetworkingTimeoutSeconds = 20.0f;
static NSUInteger kDHTServiceCacheCountLimit = 5;

extern NSString * const kDHTServicePlan;


#endif /* DHTNetworkingConfiguration_h */
