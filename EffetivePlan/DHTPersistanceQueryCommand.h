//
//  DHTPersistanceQueryCommand.h
//  EffetivePlan
//
//  Created by happyo on 16/5/31.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHTPersistanceQueryCommand : NSObject

- (BOOL)excuteWithError:(NSError **)error;

- (NSArray *)fetchWithError:(NSError **)error;

@end
