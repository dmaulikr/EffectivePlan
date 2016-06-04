//
//  DHTNavigationControllerDelegate.m
//  EffetivePlan
//
//  Created by happyo on 16/6/4.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTNavigationControllerDelegate.h"
#import "RDVTabBarController.h"

@implementation DHTNavigationControllerDelegate

#pragma mark -- UINavigationControllerDelegate --

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController.hidesBottomBarWhenPushed) {
        [ROOT_TABBAR_CONTROLLER setTabBarHidden:YES animated:YES];
    } else {
        [ROOT_TABBAR_CONTROLLER setTabBarHidden:NO animated:YES];
    }
}

@end
