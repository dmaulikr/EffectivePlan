//
//  DHTRequestGenerator.m
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTRequestGenerator.h"
#import "AFNetworking.h"
#import "DHTNetworkingConfiguration.h"
#import "DHTServiceFactory.h"

@interface DHTRequestGenerator ()

@property (nonatomic, strong) AFHTTPRequestSerializer *httpRequestSerializer;

@end
@implementation DHTRequestGenerator

+ (instancetype)sharedInstance
{
    static DHTRequestGenerator *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[DHTRequestGenerator alloc] init];
        }
    });
    return sharedInstance;
}

- (NSURLRequest *)generateGETWithServiceIdentifier:(NSString *)serviceIdentifier params:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    DHTService *service = [[DHTServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", service.apiBaseUrl, methodName];
    
    NSURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"GET" URLString:urlString parameters:requestParams error:nil];
    
    return request;
}


#pragma mark -- Getters && Setters --
- (AFHTTPRequestSerializer *)httpRequestSerializer
{
    if (_httpRequestSerializer == nil) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        _httpRequestSerializer.timeoutInterval = kDHTNetworkingTimeoutSeconds;
        _httpRequestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    }
    return _httpRequestSerializer;
}

@end
