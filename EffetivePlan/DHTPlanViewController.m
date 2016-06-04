//
//  DHTPlanViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPlanViewController.h"
#import "DHTPlanCell.h"
#import "DHTPlanStore.h"
#import "DHTDo.h"
#import "DHTGetPlanManager.h"
#import "DHTPlanListReformer.h"
#import "DHTPlanDataCenter.h"
#import "DHTPlanRecord.h"

@interface DHTPlanViewController () <DHTAPIManagerApiCallBackDelegate>

@property (nonatomic, strong) UITableView *tbvPlan;

@property (nonatomic, strong) DHTGetPlanManager *getPlanManager;

@property (nonatomic, strong) DHTPlanListReformer *planListReformer;

@property (nonatomic, strong) NSArray *planList;

@property (nonatomic, strong) DHTNavigationControllerDelegate *navControllerDelegate;

@end

@implementation DHTPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navControllerDelegate = [[DHTNavigationControllerDelegate alloc] init];
    self.navigationController.delegate = self.navControllerDelegate;
    
//    [self fetchData];
    DHTPlanDataCenter *dataCenter = [[DHTPlanDataCenter alloc] init];
//    [dataCenter insertTest];
//    NSLog(@"%@", [dataCenter findAllTest]);
    
    [self.planListReformer transfromRecordsToReformer:[dataCenter findAllTest]];
    
    self.tbvPlan = [[UITableView alloc] initWithFrame:self.view.frame];
    
    self.tbvPlan.dataSource = self.planListReformer;
    self.tbvPlan.delegate = self.planListReformer;
    
    [self.view addSubview:self.tbvPlan];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init method -
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setRightNavBarButtonWithType:NavBarButtonAdd];
        self.navDelegate = self.planListReformer;
    }
    
    return self;
}



#pragma mark -- Private Methods --

- (void)fetchData
{
    NSInteger requestId = [self.getPlanManager loadData];
    
    NSLog(@"request id : %i", (int)requestId);
}




#pragma mark -- DHTAPIManagerApiCallBackDelegate --

- (void)managerCallAPIDidSuccess:(DHTAPIBaseManager *)manager
{
    [manager fetchDataWithReformer:self.planListReformer];
    [self.tbvPlan performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

- (void)managerCallAPIDidFailed:(DHTAPIBaseManager *)manager
{
    
}

#pragma mark -- DHTAPIManagerParamsSourceDelegate --

//- (NSDictionary *)paramsForApi:(DHTAPIBaseManager *)manager
//{
//    return @{@"title" : @"happyo"};
//}

#pragma mark -- Getters && Setters --

- (DHTGetPlanManager *)getPlanManager
{
    if (!_getPlanManager) {
        _getPlanManager = [[DHTGetPlanManager alloc] init];
        _getPlanManager.delegate = self;
//        _getPlanManager.paramsSource = self;
    }
    
    return _getPlanManager;
}

- (DHTPlanListReformer *)planListReformer
{
    if (!_planListReformer) {
        _planListReformer = [[DHTPlanListReformer alloc] init];
    }
    
    return _planListReformer;
}


@end
