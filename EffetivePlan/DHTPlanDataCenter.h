//
//  DHTPlanDataCenter.h
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DHTPlanRecord;

@interface DHTPlanDataCenter : NSObject

- (BOOL)insertPlan:(DHTPlanRecord *)planRecord;

- (NSArray *)findAllPlans;

- (DHTPlanRecord *)findPlanWithPrimaryKey:(NSString *)primaryKey;

- (BOOL)updatePlan:(DHTPlanRecord *)planRecord;

@end
