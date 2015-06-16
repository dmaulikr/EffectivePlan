//
//  DHTAddDoViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/19.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTAddDoViewController.h"
#import "DHTPlanStore.h"

@interface DHTAddDoViewController ()

@end

@implementation DHTAddDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.doContent = [[UITextField alloc] initWithFrame:CGRectMake(0, 50, 100, 30)];
    self.doContent.text = self.doplan.content;
    [self.view addSubview:self.doContent];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 30)];
    [addBtn addTarget:self action:@selector(saveDo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (DHTDo *)doplan
{
    if (!_doplan) {
        _doplan = [[DHTPlanStore sharedStore] getNewDo];
    }
    return _doplan;
}

#pragma mark - private method -
- (void)saveDo
{
    self.doplan.content = self.doContent.text;
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
