//
//  DHTAPIBaseManager.m
//  EffetivePlan
//
//  Created by happyo on 16/4/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTAPIBaseManager.h"
#import "DHTApiProxy.h"

#define DHTCallApi(METHOD_NAME, REQUEST_ID)                                         \
{                                                                                   \
    REQUEST_ID = [[DHTApiProxy sharedInstance] call##METHOD_NAME##WithParams:params serviceIdentifier:self.child.serviceType methodName:self.child.methodName successCallback:^(DHTURLResponse *response) {\
        [self successedOnCallingApi:response];                                      \
    } fail:^(DHTURLResponse *response) {                                            \
        [self failedOnCallingApi:nil withErrorType:DHTManagerErrorTypeDefault];     \
    }];                                                                             \
                                                                                    \
    [self.requestIdList addObject:@(REQUEST_ID)];                                   \
}\

@interface DHTAPIBaseManager ()

@property (nonatomic, strong, readwrite) id fetchedRawData;

@property (nonatomic, assign) DHTManagerErrorType errorType;

@property (nonatomic, strong) NSMutableArray *requestIdList;

@property (nonatomic, assign, readwrite) BOOL isLoading;


@end
@implementation DHTAPIBaseManager

#pragma mark -- Init --

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _delegate = nil;
        _paramsSource = nil;
        
        if ([self conformsToProtocol:@protocol(DHTAPIManager)]) {
            self.child = (id<DHTAPIManager>)self;
        }
    }
    
    return self;
}

- (void)dealloc
{
    [self cancelAllRequests];
    self.requestIdList = nil;
}

#pragma mark -- Public Methods --
- (id)fetchDataWithReformer:(id<DHTAPIManagerCallbackDataReformer>)reformer
{
    id result = nil;
    
    if ([reformer conformsToProtocol:@protocol(DHTAPIManagerCallbackDataReformer)]) {
        result = [reformer manager:self reformData:self.fetchedRawData];
    } else {
        result = [self.fetchedRawData mutableCopy];
    }
    
    return result;
}

- (NSInteger)loadData
{
    NSDictionary *params = [self.paramsSource paramsForApi:self];
    NSInteger requestId = [self loadDataWithParams:params];
    
    return requestId;
}

- (void)cancelAllRequests
{
    [[DHTApiProxy sharedInstance] cancelRequestWithRequestIdList:self.requestIdList];
    [self.requestIdList removeAllObjects];
}

- (void)cancelRequestWithRequestId:(NSInteger)requestId
{
    [[DHTApiProxy sharedInstance] cancelRequestWithRequestId:@(requestId)];
    [self removeRequestIdWithRequestId:requestId];
}


#pragma mark -- Methods For Child --

- (void)cleanData
{
    IMP childIMP = [self.child methodForSelector:@selector(cleanData)];
    IMP selfIMP = [self methodForSelector:@selector(cleanData)];
    
    if (selfIMP == childIMP) {
        self.fetchedRawData = nil;
        self.errorType = DHTManagerErrorTypeDefault;
    } else {
        if ([self.child respondsToSelector:@selector(cleanData)]) {
            [self.child cleanData];
        }
    }
}

- (NSDictionary *)reformSource:(NSDictionary *)params
{
    IMP childIMP = [self.child methodForSelector:@selector(reformParams:)];
    IMP selfIMP = [self methodForSelector:@selector(reformParams:)];
    
    if (childIMP == selfIMP) {
        return params;
    } else {
        // 如果子类重载了该方法，就不会跑这里，直接跑子类的IMP
        // 如果子类是别的对象就会进这里
        NSDictionary *result = nil;
        result = [self.child reformParams:params];
        
        if (result) {
            return result;
        } else {
            return params;
        }
    }
}

#pragma mark -- Private Methods --


- (NSInteger)loadDataWithParams:(NSDictionary *)params
{
    NSInteger requestId = 0;
    
    switch (self.child.requestType) {
        case DHTRequestTypeGET:
            DHTCallApi(GET, requestId);
            break;
            
        case DHTRequestTypePOST:
            DHTCallApi(POST, requestId);
        default:
            break;
    }
    
    return requestId;
}


- (void)removeRequestIdWithRequestId:(NSInteger)requestId
{
    NSNumber *requestIdToRemove = nil;
    
    for (NSNumber *storedRequestId in self.requestIdList) {
        if (storedRequestId.integerValue == requestId) {
            requestIdToRemove = storedRequestId;
        }
    }
    
    [self.requestIdList removeObject:requestIdToRemove];
}


#pragma mark -- Call Back Api --

- (void)successedOnCallingApi:(DHTURLResponse *)response
{
    if (response.content) {
        self.fetchedRawData = [response.content copy];
    } else {
        self.fetchedRawData = [response.responseData copy];
    }
    
    [self removeRequestIdWithRequestId:response.requestId];
    [self.delegate managerCallAPIDidSuccess:self];
}

- (void)failedOnCallingApi:(DHTURLResponse *)response withErrorType:(DHTManagerErrorType)errorType
{
    self.errorType = errorType;
    
    [self removeRequestIdWithRequestId:response.requestId];
    [self.delegate managerCallAPIDidFailed:self];
}

#pragma mark -- Getters && Setters --

- (NSMutableArray *)requestIdList
{
    if (!_requestIdList) {
        _requestIdList = [NSMutableArray array];
    }
    
    return _requestIdList;
}

- (BOOL)isLoading
{
    return self.requestIdList.count > 0;
}

@end
