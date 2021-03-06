//
//  DHTCheckViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTCheckViewController.h"
#import "DHTPlan.h"
#import "DHTPlanStore.h"
#import "DHTAddCheckViewController.h"

@interface DHTCheckViewController ()

@property (nonatomic, strong) UITableView *tableView;

/**
 *  处于check泳道的plan列表
 */
@property (nonatomic, strong) NSMutableArray *planList;

@end

@implementation DHTCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100.f)];
    
    [refreshControl addTarget:self action:@selector(planRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[UITableViewCell cellReuseIdentifier]];
    [self.view addSubview:self.tableView];
}

- (void)planRefresh:(id)sender
{
    NSLog(@"plan refresh");
    [sender endRefreshing];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.planList = [NSMutableArray arrayWithArray:[[DHTPlanStore sharedStore] allPlans]];
    [self.tableView reloadData];
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
        // 设定check页面的标签名和图片
    }
    
    return self;
}

#pragma mark - UITableViewDelegate/DataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.planList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell cellReuseIdentifier]];
    
    DHTPlan *plan = self.planList[indexPath.row];
    cell.textLabel.text = plan.title;
//    cell.detailTextLabel.text = @"check";
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTPlan *selectedPlan = self.planList[indexPath.row];
    DHTAddCheckViewController *acVC = [[DHTAddCheckViewController alloc] init];
    acVC.planToBeChecked = selectedPlan;
    
    [self.navigationController pushViewController:acVC animated:YES];
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
