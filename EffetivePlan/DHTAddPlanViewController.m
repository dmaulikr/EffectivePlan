//
//  DHTAddPlanViewController.m
//  EffetivePlan
//
//  Created by happyo on 15/5/11.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTAddPlanViewController.h"
#import "DHTPlanStore.h"

@interface DHTAddPlanViewController ()

@property (nonatomic, strong) DHTAddPlanView *addPlanView;

@end

@implementation DHTAddPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    CGRect viewRect = self.view.bounds;
//    CGSize viewSize = viewRect.size;
//    CGRect navBarRect = self.navigationController.navigationBar.frame;
//    viewSize.height -= navBarRect.origin.y + navBarRect.size.height;
//    viewRect.size = viewSize;
//    self.view.bounds = viewRect;
    
//    DHTAddPlanView *addPlanView = [[DHTAddPlanView alloc] initWithFrame:self.view.bounds];
    
    
    [self setRightNavBarButtonWithType:NavBarButtonDone];
//    self.navDelegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.addPlanView.titleField.text = self.plan.title;
    self.addPlanView.instructionField.text = self.plan.instruction;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        self.addPlanView = [[DHTAddPlanView alloc] initWithFrame:self.view.frame];
        self.tabBarController.tabBar.hidden = YES;
        [self.view addSubview:self.addPlanView];
    }
    return self;
}

//#pragma mark - NavBarButtonDelegate -
- (void)rightBarButtonClicked:(id)sender
{
    if (self.plan) {
        [self modifyOldPlan:self.plan];
    } else {
        [self addPlan];
    }
}

#pragma mark - my method -
- (void)addPlan
{
    DHTPlan *plan = [[DHTPlanStore sharedStore] getNewPlan];
    plan.title = self.addPlanView.titleField.text;
    plan.instruction = self.addPlanView.instructionField.text;
    [[DHTPlanStore sharedStore] insertPlan:plan];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"add successed");
}

- (void)modifyOldPlan:(DHTPlan *)plan
{
    self.plan.title = self.addPlanView.titleField.text;
    self.plan.instruction = self.addPlanView.instructionField.text;
    
    [[DHTPlanStore sharedStore] modifyPlan:self.plan];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"modify successed");
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
