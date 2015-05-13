//
//  DHTPhoneViewController.h
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NavBarButtonAdd
} NavBarButtonType;

@protocol NavBarButtonDelegate <NSObject>

@optional
- (void)rightButtonIsTouched;

@end

@interface DHTPhoneViewController : UIViewController

@property (nonatomic, assign) id<NavBarButtonDelegate> navDelegate;

- (void)setRightNavBarButtonWithType:(NavBarButtonType)buttonType;

@end
