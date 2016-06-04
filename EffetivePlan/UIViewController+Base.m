//
//  UIViewController+Base.m
//  EffetivePlan
//
//  Created by happyo on 16/6/4.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "UIViewController+Base.h"
#import <objc/runtime.h>

static void *kNavBarDelegateKey;

@implementation UIViewController (Base)

- (void)setRightNavBarButtonWithType:(NavBarButtonType)buttonType
{
    UIBarButtonItem *rightItem = nil;
    
    switch (buttonType) {
        case NavBarButtonAdd:
            rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonClicked:)];
            break;
        case NavBarButtonDone:
            rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightBarButtonClicked:)];
        default:
            break;
    }
    
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)rightBarButtonClicked:(id)sender
{
    [self.navDelegate rightButtonIsTouched];
}

- (id <DHTNavBarButtonDelegate>)navDelegate
{
    return objc_getAssociatedObject(self, kNavBarDelegateKey);
}

- (void)setNavDelegate:(id<DHTNavBarButtonDelegate>)navDelegate
{
    objc_setAssociatedObject(self, kNavBarDelegateKey, navDelegate, OBJC_ASSOCIATION_ASSIGN);
}

@end
