//
//  DHTAPIBaseManager.h
//  EffetivePlan
//
//  Created by happyo on 16/4/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DHTAPIBaseManager;



/*************************************************************************************************/
/*                               DHTAPIManagerApiCallBackManager                                 */
/*************************************************************************************************/

//api回调
@protocol DHTAPIManagerApiCallBackDelegate <NSObject>

@required
- (void)managerCallAPIDidSuccess:(DHTAPIBaseManager *)manager;
- (void)managerCallAPIDidFailed:(DHTAPIBaseManager *)manager;

@end






/*************************************************************************************************/
/*                               DHTAPIBaseManager                                               */
/*************************************************************************************************/
@protocol DHTAPIManagerParamsSourceDelegate <NSObject>

@required
- (NSDictionary *)paramsForApi:(DHTAPIBaseManager *)manager;

@end






/*************************************************************************************************/
/*                               DHTAPIBaseManager                                               */
/*************************************************************************************************/
@protocol DHTAPIManager <NSObject>

@required

@optional
- (NSDictionary *)reformParams:(NSDictionary *)params;

@end






/*************************************************************************************************/
/*                               DHTAPIManagerInterceptor                                        */
/*************************************************************************************************/
@protocol DHTAPIManagerInterceptor <NSObject>

@optional
//- (void)manage:(DHTAPIBaseManager *)manager beforePerformSuccessWithResponse:(DHTURLResponse *)response

@end







/*************************************************************************************************/
/*                               DHTAPIBaseManager                                               */
/*************************************************************************************************/
@interface DHTAPIBaseManager : NSObject

@property (nonatomic, weak) id<DHTAPIManagerApiCallBackDelegate> delegate;

@property (nonatomic, weak) id<DHTAPIManagerParamsSourceDelegate> paramsSource;

//@property (nonatomic, weak) id<> interceptor;

@property (nonatomic, weak) NSObject<DHTAPIManager> *child; // 因为类里面用到了NSObject的方法，所以id改为NSObject



- (NSInteger)loadData;

@end


