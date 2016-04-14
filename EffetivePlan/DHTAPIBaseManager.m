//
//  DHTAPIBaseManager.m
//  EffetivePlan
//
//  Created by happyo on 16/4/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTAPIBaseManager.h"

@interface DHTAPIBaseManager ()



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
    
    
    
    return requestId;
}

@end
