//
//  DHTPlanListReformer.h
//  EffetivePlan
//
//  Created by happyo on 16/4/16.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DHTNetworking.h"
#import "DHTPlanListReformerKeys.h"

@interface DHTPlanListReformer : NSObject <DHTAPIManagerCallbackDataReformer, UITableViewDataSource, UITableViewDelegate>

- (void)transfromRecordsToReformer:(NSArray *)recordsList;

@end
