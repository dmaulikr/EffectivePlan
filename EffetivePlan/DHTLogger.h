//
//  DHTLogger.h
//  EffetivePlan
//
//  Created by happyo on 16/4/18.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTService.h"

@interface DHTLogger : NSObject

+ (void)logDebugInfoWithResponse:(NSHTTPURLResponse *)response responseString:(NSString *)responseString request:(NSURLRequest *)request error:(NSError *)error;

+ (void)logDebugInfoWithRequest:(NSURLRequest *)request apiName:(NSString *)apiName service:(DHTService *)service requestParams:(id)requestParams httpMethod:(NSString *)httpMethod;

@end
