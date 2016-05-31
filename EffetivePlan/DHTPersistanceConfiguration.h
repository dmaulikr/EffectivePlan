//
//  DHTPersistanceConfiguration.h
//  EffetivePlan
//
//  Created by happyo on 16/5/30.
//  Copyright © 2016年 happyo. All rights reserved.
//

#ifndef DHTPersistanceConfiguration_h
#define DHTPersistanceConfiguration_h

#import <Foundation/Foundation.h>

static NSString * const kDHTPersistanceErrorDomain = @"kDHTPersistanceErrorDomain";


typedef NS_ENUM (NSInteger, DHTPersistanceErrorCode) {
    DHTPersistanceErrorCodeOpenError,
    DHTPersistanceErrorCodeCreateError,
    DHTPersistanceErrorCodeQueryStringError
};

#endif /* DHTPersistanceConfiguration_h */
