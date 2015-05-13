//
//  DHTPhoneViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPhoneViewController.h"

@interface DHTPhoneViewController ()

@end

@implementation DHTPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - public method -

- (void)setRightNavBarButtonWithType:(NavBarButtonType)buttonType
{
    UIBarButtonItem *rightItem = nil;
    
    switch (buttonType) {
        case NavBarButtonAdd:
            rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonClicked:)];
            break;
            
        default:
            break;
    }
    
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)rightBarButtonClicked:(id)sender
{
    [self.navDelegate rightButtonIsTouched];
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
