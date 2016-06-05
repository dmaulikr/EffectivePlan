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
#import "DHTPlanDataCenter.h"

@implementation Target_Plan

- (id)Action_showManipulatePlanWithRecordPrimaryKey:(NSDictionary *)params
{
    NSString *primaryKey = params[@"primaryKey"];
    
    DHTPlanDataCenter *dataCenter = [[DHTPlanDataCenter alloc] init];
    DHTPlanRecord *record = [dataCenter findPlanWithPrimaryKey:primaryKey];

    DHTManipulatePlanViewController *manipulatePlanViewController = [[DHTManipulatePlanViewController alloc] init];
    manipulatePlanViewController.planRecord = record;
    manipulatePlanViewController.hidesBottomBarWhenPushed = YES;
    [CURRENT_NAVIGATION_CONTROLLER pushViewController:manipulatePlanViewController animated:YES];
    
    return nil;
}

@end
