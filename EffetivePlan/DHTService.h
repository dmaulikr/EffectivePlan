//
//  DHTService.h
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DHTServiceProtocol <NSObject>

@property (nonatomic, readonly) BOOL isOnline;

@property (nonatomic, readonly) NSString *onlineApiBaseUrl;

@property (nonatomic, readonly) NSString *offlineApiBaseUrl;

@end

@interface DHTService : NSObject

@property (nonatomic, strong) id<DHTServiceProtocol> child;

@property (nonatomic, strong, readonly) NSString *apiBaseUrl;

@end
