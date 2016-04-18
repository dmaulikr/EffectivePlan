//
//  DHTRequestGenerator.h
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHTRequestGenerator : NSObject

+ (instancetype)sharedInstance;

- (NSURLRequest *)generateGETWithServiceIdentifier:(NSString *)serviceIdentifier params:(NSDictionary *)requestParams methodName:(NSString *)methodName;

- (NSURLRequest *)generatePOSTWithServiceIdentifier:(NSString *)serviceIdentifier params:(NSDictionary *)requestParams methodName:(NSString *)methodName;

@end
