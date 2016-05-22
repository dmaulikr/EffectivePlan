//
//  DHTApiProxy.h
//  EffetivePlan
//
//  Created by happyo on 16/4/14.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTURLResponse.h"

typedef void(^DHTAPCallBack)(DHTURLResponse *response);

@interface DHTApiProxy : NSObject

+ (instancetype)sharedInstance;

- (NSInteger)callGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier methodName:(NSString *)methodName successCallback:(DHTAPCallBack)successBlock fail:(DHTAPCallBack)fail;

- (NSInteger)callPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier methodName:(NSString *)methodName successCallback:(DHTAPCallBack)successBlock fail:(DHTAPCallBack)failBlock;

- (void)cancelRequestWithRequestId:(NSNumber *)requestId;

- (void)cancelRequestWithRequestIdList:(NSArray *)requestIdList;

@end
