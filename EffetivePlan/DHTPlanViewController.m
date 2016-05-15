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
#import "DHTAddPlanViewController.h"
#import "DHTDo.h"
#import "DHTNetworkingClient.h"
#import "DHTGetPlanManager.h"
#import "DHTPlanListReformer.h"

@interface DHTPlanViewController () <DHTAPIManagerApiCallBackDelegate>

@property (nonatomic, strong) UITableView *tbvPlan;

@property (nonatomic, strong) DHTGetPlanManager *getPlanManager;

@property (nonatomic, strong) DHTPlanListReformer *planListReformer;

@end

@implementation DHTPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchData];
    
    self.tbvPlan = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
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
        // 设定plan页面的标签名和图片
        self.tabBarItem.title = @"P";
        UIImage *image = [UIImage imageNamed:@"Time1.png"];
        self.tabBarItem.image = image;
        self.navigationItem.title = @"plan";
        
//        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlan)];
//        
//        self.navigationItem.rightBarButtonItem = bbi;
        [self setRightNavBarButtonWithType:NavBarButtonAdd];
//        self.navDelegate = self;
    }
    
    return self;
}

- (void)rightBarButtonClicked:(id)sender{
    NSLog(@"clicked");
    [self addNewPlan];
}

#pragma mark -- Private Methods --

- (void)fetchData
{
//    [[DHTNetworkingClient sharedClient] fetchData];
    
    NSInteger requestId = [self.getPlanManager loadData];
    
    NSLog(@"request id : %i", (int)requestId);
}

#pragma mark - my method -
- (void)addNewPlan
{
    DHTAddPlanViewController *apVC = [[DHTAddPlanViewController alloc] init];
    
    [self.navigationController pushViewController:apVC animated:YES];
}


//#pragma mark - UITableView Delegate/DataSource -
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [[DHTPlanStore sharedStore] allPlans].count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    DHTPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DHTPlanCell" forIndexPath:indexPath];
//    
//    DHTPlan *plan = [[DHTPlanStore sharedStore] planAtIndex:indexPath.row];
//    
//    cell.titleLabel.text = plan.title;
//    cell.instructionLabel.text = plan.instruction;
//    
//    return cell;
//}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    DHTAddPlanViewController *apVC = [[DHTAddPlanViewController alloc] init];
//    
//    DHTPlan *plan = [[DHTPlanStore sharedStore] planAtIndex:indexPath.row];
//    
//    apVC.plan = plan;
//    
//    [self.navigationController pushViewController:apVC animated:YES];
//}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
