//
//  DHTNetworkingClient.m
//  EffetivePlan
//
//  Created by happyo on 15/5/28.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTNetworkingClient.h"
#import "AFNetworking.h"

static NSString * const DHTNetworkingBaseURL = @"http://localhost:8080/hello";

@interface DHTNetworkingClient ()

@property (nonatomic, strong) AFURLSessionManager *manager;

@end
@implementation DHTNetworkingClient

+ (instancetype)sharedClient
{
    static DHTNetworkingClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedClient) {
            sharedClient = [[DHTNetworkingClient alloc] initWithBaseURL:[NSURL URLWithString:DHTNetworkingBaseURL]];
        }
    });
    return sharedClient;
}


- (void)fetchData
{
    NSString *baseUrl = DHTNetworkingBaseURL;
    NSDictionary *params = @{@"" : @"", @"" : @""};
    
    NSURL *url = [NSURL URLWithString:baseUrl];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error : %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    
    [dataTask resume];
}

@end
