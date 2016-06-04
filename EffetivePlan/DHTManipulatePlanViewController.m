//
//  DHTManipulatePlanViewController.m
//  EffetivePlan
//
//  Created by happyo on 16/6/4.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTManipulatePlanViewController.h"

@interface DHTManipulatePlanViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblDate;

@property (weak, nonatomic) IBOutlet UITextField *txfTitle;

@property (weak, nonatomic) IBOutlet UITextField *txfDescription;

@end

@implementation DHTManipulatePlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.lblDate.text = self.planRecord.createdDate;
    self.txfTitle.text = self.planRecord.title;
    self.txfDescription.text = self.planRecord.planDescription;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
