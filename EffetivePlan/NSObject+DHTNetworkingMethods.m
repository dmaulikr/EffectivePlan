//
//  NSObject+DHTNetworkingMethods.m
//  EffetivePlan
//
//  Created by happyo on 16/4/18.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "NSObject+DHTNetworkingMethods.h"

@implementation NSObject (DHTNetworkingMethods)

- (id)DHT_defaultValue:(id)defaultData
{
    if (![defaultData isKindOfClass:[self class]]) {
        return defaultData;
    }
    
    if ([self DHT_isEmptyObject]) {
        return defaultData;
    }
    
    return self;
}

- (BOOL)DHT_isEmptyObject
{
    if ([self isEqual:[NSNull null]]) {
        return YES;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self length] == 0) {
            return YES;
        }
    }
    
    if ([self isKindOfClass:[NSArray class]]) {
        if ([(NSArray *)self count] == 0) {
            return YES;
        }
    }
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        if ([(NSDictionary *)self count] == 0) {
            return YES;
        }
    }
    
    return NO;
}

@end
