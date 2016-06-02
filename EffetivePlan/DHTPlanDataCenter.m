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
#import "DHTPersistanceTable+Insert.h"
#import "DHTPersistanceTable+Find.h"

@interface DHTPlanDataCenter ()

@property (nonatomic, strong) DHTPlanTable *planTable;

@end
@implementation DHTPlanDataCenter

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.planTable = [[DHTPlanTable alloc] init];
    }
    
    return self;
}

- (NSArray *)getAllPlans
{
    return nil;
}

- (BOOL)insertTest
{
    NSError *error = nil;
    return [self.planTable insertRecord:[[DHTPlanRecord alloc] init] error:&error];
}

- (NSArray *)findAllTest
{
    NSError *error = nil;
    return [self.planTable findAllWithWhereCondition:nil isDistinct:NO error:&error];
}

@end
