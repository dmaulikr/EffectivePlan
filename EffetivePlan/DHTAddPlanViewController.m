//
//  DHTAddPlanViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/11.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTAddPlanViewController.h"
#import "DHTAddPlanView.h"

@interface DHTAddPlanViewController ()

@end

@implementation DHTAddPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
//    CGRect viewRect = self.view.bounds;
//    CGSize viewSize = viewRect.size;
//    CGRect navBarRect = self.navigationController.navigationBar.frame;
//    viewSize.height -= navBarRect.origin.y + navBarRect.size.height;
//    viewRect.size = viewSize;
//    self.view.bounds = viewRect;
    
//    DHTAddPlanView *addPlanView = [[DHTAddPlanView alloc] initWithFrame:self.view.bounds];
    DHTAddPlanView *addPlanView = [[DHTAddPlanView alloc] initWithFrame:self.view.frame];
    self.tabBarController.tabBar.hidden = YES;
    [self.view addSubview:addPlanView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
