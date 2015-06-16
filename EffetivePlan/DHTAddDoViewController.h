//
//  DHTAddDoViewController.h
//  EffetivePlan
//
//  Created by happyo on 15/5/19.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPhoneViewController.h"
#import "DHTDo.h"


@interface DHTAddDoViewController : DHTPhoneViewController

@property (nonatomic, strong) UITextField *doContent;

@property (nonatomic, strong) DHTDo *doplan;

@end
