//
//  DHTAPIBaseManager.m
//  EffetivePlan
//
//  Created by happyo on 16/4/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTAPIBaseManager.h"
#import "DHTApiProxy.h"

@interface DHTAPIBaseManager ()

@property (nonatomic, strong, readwrite) id fetchedRawData;


@end
@implementation DHTAPIBaseManager

#pragma mark -- Init --

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _delegate = nil;
        _paramsSource = nil;
    }
    
    return self;
}

- (void)dealloc
{
    
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


#pragma mark -- Methods For Child --

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
    
    requestId = [[DHTApiProxy sharedInstance] callGETWithParams:params serviceIdentifier:self.child.serviceType methodName:self.child.methodName successCallback:^(DHTURLResponse *response) {
        //
        [self successedOnCallingApi:response];
    } fail:^(DHTURLResponse *response) {
        //
    }];
    
    
    return requestId;
}


#pragma mark -- Call Back Api --

- (void)successedOnCallingApi:(DHTURLResponse *)response
{
    if (response.content) {
        self.fetchedRawData = [response.content copy];
    } else {
        self.fetchedRawData = [response.responseData copy];
    }
    
    [self.delegate managerCallAPIDidSuccess:self];
}

@end
