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
    DHTPlanRecord *record = [[DHTPlanRecord alloc] init];
    record.title = @"plan one";
    record.planDescription = @"desc one";
    record.createdDate = @"2020-10-01";
    return [self.planTable insertRecord:record error:&error];
}

- (NSArray *)findAllTest
{
    NSError *error = nil;
    return [self.planTable findAllWithWhereCondition:@"title = 'plan one'" isDistinct:NO error:&error];
}

@end
