//
//  DHTMediator.h
//  EffetivePlan
//
//  Created by happyo on 16/5/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHTMediator : NSObject

+ (instancetype)sharedInstance;

- (id)performActionWithUrl:(NSURL *)url completeBlock:(void (^)(NSDictionary *))complete;

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

@end
