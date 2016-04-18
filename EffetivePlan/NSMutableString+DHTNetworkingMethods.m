//
//  NSMutableString+DHTNetworkingMethods.m
//  EffetivePlan
//
//  Created by happyo on 16/4/18.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "NSMutableString+DHTNetworkingMethods.h"
#import "NSObject+DHTNetworkingMethods.h"

@implementation NSMutableString (DHTNetworkingMethods)

- (void)appendURLRequest:(NSURLRequest *)request
{
    [self appendFormat:@"\n\nHTTP URL:\n\t%@", request.URL];
    [self appendFormat:@"\n\nHTTP Header:\n%@", request.allHTTPHeaderFields ? request.allHTTPHeaderFields : @"\t\t\t\t\tN/A"];
    [self appendFormat:@"\n\nHTTP Body:\n\t%@", [[[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding] DHT_defaultValue:@"\t\t\t\tN/A"]];
}

@end
