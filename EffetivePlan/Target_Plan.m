//
//  Target_Plan.m
//  EffetivePlan
//
//  Created by happyo on 16/5/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "Target_Plan.h"
#import "DHTAddPlanViewController.h"
#import "RDVTabBarController.h"

@implementation Target_Plan

- (id)Action_showAddPlan
{
    DHTAddPlanViewController *addPlanViewController = [[DHTAddPlanViewController alloc] init];
    addPlanViewController.hidesBottomBarWhenPushed = YES;
    [CURRENT_NAVIGATION_CONTROLLER pushViewController:addPlanViewController animated:YES];
    
    return nil;
}

@end
