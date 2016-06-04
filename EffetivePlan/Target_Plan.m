//
//  Target_Plan.m
//  EffetivePlan
//
//  Created by happyo on 16/5/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "Target_Plan.h"
#import "RDVTabBarController.h"
#import "DHTManipulatePlanViewController.h"

@implementation Target_Plan

- (id)Action_showManipulatePlanWithRecord:(NSDictionary *)planRecord
{
    DHTPlanRecord *record = [[DHTPlanRecord alloc] init];
    record.title = planRecord[@"title"];
    record.planDescription = planRecord[@"description"];
    record.createdDate = planRecord[@"createdDate"];
    
    DHTManipulatePlanViewController *manipulatePlanViewController = [[DHTManipulatePlanViewController alloc] init];
    manipulatePlanViewController.planRecord = record;
    manipulatePlanViewController.hidesBottomBarWhenPushed = YES;
    [CURRENT_NAVIGATION_CONTROLLER pushViewController:manipulatePlanViewController animated:YES];
    
    return nil;
}

@end
