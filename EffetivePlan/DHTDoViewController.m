//
//  DHTDoViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTDoViewController.h"
#import "DHTPlan.h"
#import "DHTPlanStore.h"
#import "DHTDoCell.h"
#import "DHTDo.h"

@interface DHTDoViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *planInDoList;

@end

@implementation DHTDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[DHTDoCell class] forCellReuseIdentifier:@"DHTDoCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.planInDoList = [NSMutableArray arrayWithArray:[[DHTPlanStore sharedStore] allPlans]];
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
        // 设定do页面的标签名和图片
        self.tabBarItem.title = @"D";
        UIImage *image = [UIImage imageNamed:@"Time1.png"];
        self.tabBarItem.image = image;
        self.title = @"do";
    }
    
    return self;
}

#pragma mark - UITableViewDataSource/Delegate -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.planInDoList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DHTPlan *plan = [self.planInDoList objectAtIndex:section];
    NSInteger doNum = plan.planToDo.count;
    return doNum;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DHTDoCell" forIndexPath:indexPath];
    
    DHTPlan *plan = [self.planInDoList objectAtIndex:indexPath.section];
    NSSet *doSet = plan.planToDo;
    NSArray *doList = doSet.allObjects;
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"doId" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:&sort count:1];
    doList = [doList sortedArrayUsingDescriptors:sortArray];
    DHTDo *doplan = doList[indexPath.row];
    cell.doNumberLabel.text = [NSString stringWithFormat:@"%li", (long)indexPath.row];
    cell.doContentLabel.text = doplan.content;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DHTPlan *plan = [self.planInDoList objectAtIndex:section];
    return plan.title;
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
