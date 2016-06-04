//
//  DHTManipulatePlanViewController.m
//  EffetivePlan
//
//  Created by happyo on 16/6/4.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTManipulatePlanViewController.h"
#import "DHTNavigationControllerDelegate.h"
#import "DHTPlanDataCenter.h"

@interface DHTManipulatePlanViewController () <DHTNavBarButtonDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblDate;

@property (weak, nonatomic) IBOutlet UITextField *txfTitle;

@property (weak, nonatomic) IBOutlet UITextField *txfDescription;

@property (nonatomic, strong) DHTNavigationControllerDelegate *navControllerDelegate;

@property (nonatomic, strong) DHTPlanDataCenter *dataCenter;

@end

@implementation DHTManipulatePlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navControllerDelegate = [[DHTNavigationControllerDelegate alloc] init];
    self.navigationController.delegate = self.navControllerDelegate;
    
    [self setRightNavBarButtonWithType:NavBarButtonDone];
    self.navDelegate = self;
    
    self.lblDate.text = self.planRecord.createdDate;
    self.txfTitle.text = self.planRecord.title;
    self.txfDescription.text = self.planRecord.planDescription;
}

#pragma mark -- DHTNavBarButtonDelegate --

- (void)rightButtonIsTouched
{
    DHTPlanRecord *record = [[DHTPlanRecord alloc] init];
    record.title = self.txfTitle.text;
    record.planDescription = self.txfDescription.text;
    record.createdDate = self.lblDate.text;
    
    [self.dataCenter insertPlan:record];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- Getters && Setters --

- (DHTPlanDataCenter *)dataCenter
{
    if (!_dataCenter) {
        _dataCenter = [[DHTPlanDataCenter alloc] init];
    }
    
    return _dataCenter;
}

@end
