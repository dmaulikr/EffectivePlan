//
//  DHTPlanDataCenter.m
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPlanDataCenter.h"
#import "DHTPlanTable.h"
#import "DHTPlanRecord.h"

@implementation DHTPlanDataCenter

- (NSArray *)getAllPlans
{
    return nil;
}

- (BOOL)insertTest
{
    DHTPlanTable *testTable = [[DHTPlanTable alloc] init];
    
    NSError *error = nil;
    return [testTable insertRecord:[[DHTPlanRecord alloc] init] error:&error];
}

@end
