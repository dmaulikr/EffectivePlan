//
//  DHTNetworkingClient.h
//  EffetivePlan
//
//  Created by happyo on 15/5/28.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface DHTNetworkingClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)fetchData;

@end
