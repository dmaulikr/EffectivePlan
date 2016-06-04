//
//  DHTMediaor+DHTMediatorPlanActions.m
//  EffetivePlan
//
//  Created by happyo on 16/5/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTMediator+DHTMediatorPlanActions.h"

NSString * const kDHTMediatorTargetPlan = @"Plan";

NSString * const kDHTMediatorActionShowAddPlan = @"showManipulatePlanWithRecord:";

@implementation DHTMediator (DHTMediatorPlanActions)

- (void)DHTMediator_showManipulatePlanViewController:(NSDictionary *)params
{
    [self performTarget:kDHTMediatorTargetPlan action:kDHTMediatorActionShowAddPlan params:params];
}

@end
