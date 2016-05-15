//
//  DHTMediator.m
//  EffetivePlan
//
//  Created by happyo on 16/5/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTMediator.h"

@implementation DHTMediator

+ (instancetype)sharedInstance
{
    static DHTMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[DHTMediator alloc] init];
    });
    
    return mediator;
}

- (id)performActionWithUrl:(NSURL *)url completeBlock:(void (^)(NSDictionary *))complete
{
    if (![url.scheme isEqualToString:@"happyo"]) {
        return @(NO);
    }
    
    // 解析params
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *paramStr = [url query];
    
    for (NSString *param in [paramStr componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if (elts.count < 2) continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    if ([actionName hasPrefix:@"native"]) {
        return @(NO);
    }
    
    id result = [self performTarget:url.host action:actionName params:params];
    
    if (complete) {
        if (result) {
            complete(result);
        } else {
            complete(nil);
        }
    }
    
    return result;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params
{
    NSString *targetClassStr = [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionStr = [NSString stringWithFormat:@"Action_%@", actionName];
    
    Class targetClass = NSClassFromString(targetClassStr);
    id target = [[targetClass alloc] init];
    SEL action = NSSelectorFromString(actionStr);
    
    if (!targetClass) {
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop

    } else {
        SEL notFound = NSSelectorFromString(@"notFound:");
        
        if ([target respondsToSelector:notFound]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:notFound withObject:params];
#pragma clang diagnostic pop

        } else {
            return nil;
        }
    }
    
    
}


@end
