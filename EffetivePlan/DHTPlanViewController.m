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

@interface DHTPlanViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DHTPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"DHTPlanCell" bundle:nil];
    [self.tableView registerNib:nib  forCellReuseIdentifier:@"DHTPlanCell"];
    
//    [[DHTPlanStore sharedStore] insertPlan:nil];
    self.view = self.tableView;
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
        self.navDelegate = self;
    }
    
    return self;
}

#pragma mark - NavBarButtonDelegate -

- (void)rightButtonIsTouched
{
    [self addPlan];
}

//- (void)rightBarButtonClicked
//{
//    [self addPlan];
//}

#pragma mark - my method -
- (void)addPlan
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
