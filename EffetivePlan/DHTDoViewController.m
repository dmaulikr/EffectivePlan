//
//  DHTDoViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTDoViewController.h"
#import "DHTAddDoViewController.h"
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
    
//    [self.tableView registerClass:[DHTDoCell class] forCellReuseIdentifier:@"DHTDoCell"];
    [self.tableView registerClass:[DHTDoCell class] forCellReuseIdentifier:[DHTDoCell cellReuseIdentifier]];
//    NSLog(@"%@", [DHTDoCell cellReuseIdentifier]);
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
//        self.tabBarItem.title = @"D";
//        UIImage *image = [UIImage imageNamed:@"Time1.png"];
//        self.tabBarItem.image = image;
//        self.title = @"do";
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
    NSInteger rowNum = plan.planToDo.count;
    return rowNum;
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:view.frame];
    [btn addTarget:self action:@selector(addNewDo:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = section;
    btn.backgroundColor = [UIColor clearColor];
    
    [view addSubview:btn];
    
    return view;
}

/**
 *  指定section footer的高度
 *  只有这个方法被实现后，titleForHeaderInSection才会被调用
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTPlan *plan = [self.planInDoList objectAtIndex:indexPath.section];
    NSSet *doSet = plan.planToDo;
    NSArray *doList = doSet.allObjects;
    DHTDo *selectedDo = doList[indexPath.row];
    
    DHTAddDoViewController *adVC = [[DHTAddDoViewController alloc] init];
    adVC.doplan = selectedDo;
    [self presentViewController:adVC animated:YES completion:nil];
}

#pragma mark - private method -

- (void)addNewDo:(UIButton *)sender
{
    DHTAddDoViewController *adVC = [[DHTAddDoViewController alloc] init];
    
    adVC.doplan = [[DHTPlanStore sharedStore] getNewDo];
    DHTPlan *plan = [self.planInDoList objectAtIndex:sender.tag];
    [plan addPlanToDoObject:adVC.doplan];

    [self presentViewController:adVC animated:YES completion:nil];
    
    NSLog(@"%li", sender.tag);
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
