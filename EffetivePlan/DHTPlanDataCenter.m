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
#import "DHTPersistanceTable+Update.h"

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

- (BOOL)insertPlan:(DHTPlanRecord *)planRecord
{
    NSError *error = nil;
    NSString *whereCondition = [NSString stringWithFormat:@"id = '%@'", planRecord.primaryKey];
    if ([self.planTable findAllWithWhereCondition:whereCondition isDistinct:NO error:&error].count != 0) {
        return NO;
    }
    
    return [self.planTable insertRecord:planRecord error:&error];
}

- (NSArray *)findAllPlans
{
    NSError *error = nil;
    return [self.planTable findAllWithWhereCondition:nil isDistinct:NO error:&error];
}

- (DHTPlanRecord *)findPlanWithPrimaryKey:(NSString *)primaryKey
{
    NSError *error = nil;
    
    return (DHTPlanRecord *)[self.planTable findWithPrimaryKey:primaryKey error:&error];
}

- (BOOL)updatePlan:(DHTPlanRecord *)planRecord
{
    NSError *error = nil;
    return [self.planTable updateRecord:planRecord error:&error];
}

@end
