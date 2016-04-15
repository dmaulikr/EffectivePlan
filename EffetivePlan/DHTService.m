//
//  DHTService.m
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTService.h"

@implementation DHTService

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        if ([self conformsToProtocol:@protocol(DHTServiceProtocol)]) {
            self.child = (id<DHTServiceProtocol>)self;
        }
    }
    
    return self;
}

#pragma mark -- Getters && Setters --

- (NSString *)apiBaseUrl
{
    return self.child.isOnline ? self.child.onlineApiBaseUrl : self.child.offlineApiBaseUrl;
}

@end
