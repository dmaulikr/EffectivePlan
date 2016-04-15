//
//  DHTURLResponse.h
//  EffetivePlan
//
//  Created by happyo on 16/4/14.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTNetworkingConfiguration.h"

@interface DHTURLResponse : NSObject

@property (nonatomic, assign, readonly) DHTResponseStatus status;

@property (nonatomic, copy, readonly) NSString *contentString;

@property (nonatomic, copy, readonly) id content;

@property (nonatomic, copy, readonly) NSURLRequest *request;

@property (nonatomic, assign, readonly) NSInteger requestId;

@property (nonatomic, copy, readonly) NSData *responseData;

@property (nonatomic, copy) NSDictionary *requestParams;

@property (nonatomic, assign, readonly) BOOL isCache;


- (instancetype)initWithResponseString:(NSString *)responseString requestId:(NSNumber *)requestId request:(NSURLRequest *)request responseData:(NSData *)responseData status:(DHTResponseStatus)status;

@end
