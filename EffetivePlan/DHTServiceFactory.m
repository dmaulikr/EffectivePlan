//
//  DHTServiceFactory.m
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTServiceFactory.h"
#import "DHTNetworkingConfiguration.h"

#import "DHTServicePlan.h"


NSString * const kDHTServicePlan = @"kDHTServicePlan";


@interface DHTServiceFactory ()

@property (nonatomic, strong) NSCache *serviceStorager;

@end
@implementation DHTServiceFactory

+ (instancetype)sharedInstance
{
    static DHTServiceFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[DHTServiceFactory alloc] init];
        }
    });
    return sharedInstance;
}

- (DHTService<DHTServiceProtocol> *)serviceWithIdentifier:(NSString *)serviceIdentifier
{
    if ([self.serviceStorager objectForKey:serviceIdentifier] == nil) {
        [self.serviceStorager setObject:[self newServiceWithIdentifier:serviceIdentifier]
                                        forKey:serviceIdentifier];
    }
    
    return [self.serviceStorager objectForKey:serviceIdentifier];
}


- (DHTService<DHTServiceProtocol> *)newServiceWithIdentifier:(NSString *)serviceIdentifier
{
    if ([serviceIdentifier isEqualToString:kDHTServicePlan]) {
        return [[DHTServicePlan alloc] init];
    }
    
    return nil;
}


#pragma mark -- Getter && Setter --

- (NSCache *)serviceStorager
{
    if (!_serviceStorager) {
        _serviceStorager = [[NSCache alloc] init];
        _serviceStorager.countLimit = kDHTServiceCacheCountLimit;
    }
    
    return _serviceStorager;
}

@end
