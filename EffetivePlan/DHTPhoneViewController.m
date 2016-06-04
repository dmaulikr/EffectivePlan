//
//  DHTPhoneViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPhoneViewController.h"
#import "RDVTabBarController.h"

@interface DHTPhoneViewController () 

@end

@implementation DHTPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- Public Method --




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
