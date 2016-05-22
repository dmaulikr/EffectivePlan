//
//  DHTApiProxy.m
//  EffetivePlan
//
//  Created by happyo on 16/4/14.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTApiProxy.h"
#import "DHTRequestGenerator.h"
#import "AFNetworking.h"
#import "DHTURLResponse.h"
#import "DHTLogger.h"


@interface DHTApiProxy ()

@property (nonatomic, assign) NSNumber *recordedRequestId;

@property (nonatomic, strong) NSMutableDictionary *dispatchTable;


@property (nonatomic, strong) AFURLSessionManager *manager;

@end
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

- (NSInteger)callGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier methodName:(NSString *)methodName successCallback:(DHTAPCallBack)successBlock fail:(DHTAPCallBack)failBlock
{
    NSURLRequest *request = [[DHTRequestGenerator sharedInstance] generateGETWithServiceIdentifier:serviceIdentifier params:params methodName:methodName];
    
    NSNumber *requestId = [self callApiWithRequest:request success:successBlock fail:failBlock];
    
    return [requestId integerValue];
}

- (NSInteger)callPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier methodName:(NSString *)methodName successCallback:(DHTAPCallBack)successBlock fail:(DHTAPCallBack)failBlock
{
    NSURLRequest *request = [[DHTRequestGenerator sharedInstance] generatePOSTWithServiceIdentifier:serviceIdentifier params:params methodName:methodName];
    
    NSNumber *requestId = [self callApiWithRequest:request success:successBlock fail:failBlock];
    
    return [requestId integerValue];
}

- (void)cancelRequestWithRequestId:(NSNumber *)requestId
{
    NSURLSessionTask *requestSessionTask = self.dispatchTable[requestId];
    [requestSessionTask cancel];
    [self.dispatchTable removeObjectForKey:requestId];
}

- (void)cancelRequestWithRequestIdList:(NSArray *)requestIdList
{
    for (NSNumber *requestId in requestIdList) {
        [self cancelRequestWithRequestId:requestId];
    }
}


#pragma mark -- Private Methods --

- (NSNumber *)callApiWithRequest:(NSURLRequest *)request success:(DHTAPCallBack)success fail:(DHTAPCallBack)fail
{
    // 之所以不用getter，是因为如果放到getter里面的话，每次调用self.recordedRequestId的时候值就都变了，违背了getter的初衷
    NSNumber *requestId = [self generateRequestId];
    
    // 执行网络请求，替换网络框架也只需要改这一个类
    NSURLSessionDataTask *task = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        NSURLSessionDataTask *storedTask = self.dispatchTable[requestId];
        if (storedTask == nil) {
            // 如果这个operation是被cancel的，那就不用处理回调了。
            return;
        } else {
            [self.dispatchTable removeObjectForKey:requestId];
        }
        
        if (error) {
            DHTURLResponse *myResponse = [[DHTURLResponse alloc] initWithResponseString:response.description
                                                                              requestId:requestId
                                                                                request:request
                                                                           responseData:responseObject
                                                                                 status:DHTResponseStatusErrorNoNetwork];
            
            [DHTLogger logDebugInfoWithResponse:(NSHTTPURLResponse *)response
                                 responseString:responseObject
                                        request:request
                                          error:error];
            
            fail ? fail (myResponse) : nil;
        } else {
            DHTURLResponse *myResponse = [[DHTURLResponse alloc] initWithResponseString:response.description
                                                                              requestId:requestId
                                                                                request:request
                                                                           responseData:responseObject
                                                                                 status:DHTResponseStatusSuccess];
            
            [DHTLogger logDebugInfoWithResponse:(NSHTTPURLResponse *)response
                                 responseString:responseObject
                                        request:request
                                          error:nil];
            
            success ? success (myResponse) : nil;
        }
    }];
    
    [task resume];
    
    self.dispatchTable[requestId] = task;
    
    return requestId;
}

- (NSNumber *)generateRequestId
{
    if (_recordedRequestId == nil) {
        _recordedRequestId = @(1);
    } else if ([_recordedRequestId integerValue] == NSIntegerMax) {
        _recordedRequestId = @(1);
    } else {
        _recordedRequestId = @([_recordedRequestId integerValue] + 1);
    }
    
    return _recordedRequestId;
}

#pragma mark -- Getters && Setters --

- (NSMutableDictionary *)dispatchTable
{
    if (!_dispatchTable) {
        _dispatchTable = [NSMutableDictionary dictionary];
    }
    
    return _dispatchTable;
}

- (AFURLSessionManager *)manager
{
    if (!_manager) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    
    return _manager;
}

@end
