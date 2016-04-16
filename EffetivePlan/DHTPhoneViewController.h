//
//  DHTPhoneViewController.h
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPMacro.h"

typedef enum {
    NavBarButtonAdd, // add
    NavBarButtonDone // done
} NavBarButtonType;

@protocol NavBarButtonDelegate <NSObject>

@optional
- (void)rightButtonIsTouched;

@end

@interface DHTPhoneViewController : UIViewController

//@property (nonatomic, assign) id<NavBarButtonDelegate> navDelegate;
/**
 *  设置navigationBar的右边按钮样式
 *
 *  @param buttonType 按钮样式NavBarButtonType
 */
- (void)setRightNavBarButtonWithType:(NavBarButtonType)buttonType;

/**
 *  右边button被点击
 *
 *  @param sender 触发的对象
 */
- (void)rightBarButtonClicked:(id)sender;

@end
