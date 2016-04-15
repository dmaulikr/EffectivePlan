//
//  DHTURLResponse.m
//  EffetivePlan
//
//  Created by happyo on 16/4/14.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTURLResponse.h"

@interface DHTURLResponse ()

@property (nonatomic, assign, readwrite) DHTResponseStatus status;

@property (nonatomic, copy, readwrite) NSString *contentString;

@property (nonatomic, copy, readwrite) id content;

@property (nonatomic, copy, readwrite) NSURLRequest *request;

@property (nonatomic, assign, readwrite) NSInteger requestId;

@property (nonatomic, copy, readwrite) NSData *responseData;

@property (nonatomic, assign, readwrite) BOOL isCache;

@end
@implementation DHTURLResponse

- (instancetype)initWithResponseString:(NSString *)responseString requestId:(NSNumber *)requestId request:(NSURLRequest *)request responseData:(NSData *)responseData status:(DHTResponseStatus)status
{
    self = [super init];
    
    if (self) {
        //
        self.contentString = responseString;
        self.requestId = [requestId integerValue];
        self.request = request;
        self.responseData = responseData;
        self.status = status;
        self.isCache = NO;
    }
    
    return self;
}

@end
