//
//  DHTAddCheckViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/25.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTAddCheckViewController.h"
#import "DHTDoCell.h"
#import "DHTDo.h"

@interface DHTAddCheckViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DHTAddCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[DHTDoCell class] forCellReuseIdentifier:[DHTDoCell cellReuseIdentifier]];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource/delegate - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.planToBeChecked.planToDo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTDoCell *cell = [tableView dequeueReusableCellWithIdentifier:[DHTDoCell cellReuseIdentifier]];
    
    DHTPlan *plan = self.planToBeChecked;
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
    return self.planToBeChecked.title;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50.0)];
    UITextField *textField = [[UITextField alloc] initWithFrame:view.bounds];
    [view addSubview:textField];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50.0;
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
