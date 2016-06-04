//
//  UIViewController+Base.h
//  EffetivePlan
//
//  Created by happyo on 16/6/4.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NavBarButtonAdd, // add
    NavBarButtonDone // done
} NavBarButtonType;

@protocol DHTNavBarButtonDelegate <NSObject>

@optional
- (void)rightButtonIsTouched;

@end

@interface UIViewController (Base)

@property (nonatomic, weak) id <DHTNavBarButtonDelegate> navDelegate;

@end
