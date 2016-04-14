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

@interface DHTPlanViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DHTPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchData];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"DHTPlanCell" bundle:nil];
    [self.tableView registerNib:nib  forCellReuseIdentifier:[DHTPlanCell cellReuseIdentifier]];
    
    DHTPlan *plan = [[DHTPlanStore sharedStore] getNewPlan];
    plan.title = @"hello";
    plan.instruction = @"world";
    DHTDo *doplan = [[DHTPlanStore sharedStore] getNewDo];
    doplan.doId = [NSNumber numberWithDouble:1.0];
    doplan.content = @"oc";
    [plan addPlanToDoObject:doplan];
    
    [[DHTPlanStore sharedStore] insertPlan:plan];
    
    
    DHTPlan *plan1 = [[DHTPlanStore sharedStore] getNewPlan];
    plan1.title = @"hello1";
    plan1.instruction = @"world1";
    DHTDo *doplan1 = [[DHTPlanStore sharedStore] getNewDo];
    doplan1.doId = [NSNumber numberWithDouble:1.0];
    doplan1.content = @"oc1";
    [plan1 addPlanToDoObject:doplan1];
    
    [[DHTPlanStore sharedStore] insertPlan:plan1];
    
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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

//#pragma mark - NavBarButtonDelegate -

//- (void)rightButtonIsTouched
//{
//    [self addNewPlan];
//}

//- (void)rightBarButtonClicked
//{
//    [self addPlan];
//}

#pragma mark -- Private Methods --

- (void)fetchData
{
    [[DHTNetworkingClient sharedClient] fetchData];
}

#pragma mark - my method -
- (void)addNewPlan
{
    DHTAddPlanViewController *apVC = [[DHTAddPlanViewController alloc] init];
    
    [self.navigationController pushViewController:apVC animated:YES];
}


#pragma mark - UITableView Delegate/DataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[DHTPlanStore sharedStore] allPlans].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DHTPlanCell" forIndexPath:indexPath];
    
    DHTPlan *plan = [[DHTPlanStore sharedStore] planAtIndex:indexPath.row];
    
    cell.titleLabel.text = plan.title;
    cell.instructionLabel.text = plan.instruction;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTAddPlanViewController *apVC = [[DHTAddPlanViewController alloc] init];
    
    DHTPlan *plan = [[DHTPlanStore sharedStore] planAtIndex:indexPath.row];
    
    apVC.plan = plan;
    
    [self.navigationController pushViewController:apVC animated:YES];
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
