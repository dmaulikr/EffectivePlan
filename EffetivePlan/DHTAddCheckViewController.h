//
//  DHTAddCheckViewController.h
//  EffetivePlan
//
//  Created by happyo on 15/5/25.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPhoneViewController.h"
#import "DHTPlan.h"

@interface DHTAddCheckViewController : DHTPhoneViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) DHTPlan *planToBeChecked;

@end
