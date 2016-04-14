//
//  DHTApiProxy.m
//  EffetivePlan
//
//  Created by happyo on 16/4/14.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTApiProxy.h"

@implementation DHTApiProxy

+ (instancetype)sharedInstance
{
    static DHTApiProxy *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[DHTApiProxy alloc] init];
        }
    });
    return sharedInstance;
}

- (NSInteger)callGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)identifier methodName:(NSString *)methodName successCallback:(DHTAPCallBack)successBlock fail:(DHTAPCallBack)fail
{
    
}

@end
