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
    
    NSString *dateString = nil;
    if (self.planRecord) {
        dateString = self.planRecord.createdDate;
    } else {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        
        dateString = [dateFormatter stringFromDate:date];
    }
    
    self.lblDate.text = dateString;
    self.txfTitle.text = self.planRecord.title;
    self.txfDescription.text = self.planRecord.planDescription;
}

#pragma mark -- DHTNavBarButtonDelegate --

- (void)rightButtonIsTouched
{
    if (self.planRecord) {
        self.planRecord.title = self.txfTitle.text;
        self.planRecord.planDescription = self.txfDescription.text;
        self.planRecord.createdDate = self.lblDate.text;
        
        [self.dataCenter updatePlan:self.planRecord];
    } else {
        DHTPlanRecord *record = [[DHTPlanRecord alloc] init];
        record.title = self.txfTitle.text;
        record.planDescription = self.txfDescription.text;
        record.createdDate = self.lblDate.text;
        [self.dataCenter insertPlan:record];
    }
    
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
