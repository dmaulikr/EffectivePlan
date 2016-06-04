//
//  DHTAddCheckViewController.h
//  EffetivePlan
//
//  Created by happyo on 15/5/25.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTPlan.h"

@interface DHTAddCheckViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) DHTPlan *planToBeChecked;

@end
