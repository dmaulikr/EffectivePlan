//
//  DHTServiceFactory.h
//  EffetivePlan
//
//  Created by happyo on 16/4/15.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTService.h"

@interface DHTServiceFactory : NSObject

+ (instancetype)sharedInstance;

- (DHTService<DHTServiceProtocol> *)serviceWithIdentifier:(NSString *)serviceIdentifier;

@end
