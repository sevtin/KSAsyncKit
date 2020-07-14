//
//  UIViewController+Category.m
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

/**
 控制器跳转
 
 @param ctrl 目标控制器
 */
-(void)pushViewController:(UIViewController *)ctrl {
    KSWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.navigationController pushViewController:ctrl animated:YES];
    });
}

/**
 返回上一个界面
 */
-(void)back {
    KSWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    });
}

/**
 返回根控制器
 */
-(void)popToRoot {
    KSWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.navigationController popToRootViewControllerAnimated: YES];
    });
}

/**
 模态跳转
 
 @param ctrl 目标控制器
 */
-(void)presentViewController:(UIViewController *)ctrl {
    KSWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf presentViewController:ctrl animated:YES completion:nil];
    });
}

/**
 关闭模态窗口
 */
-(void)dismiss {
    KSWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    });
}

-(void)dismissRoot {
    [[self topController] dismiss];
}

- (UIViewController *)topController {
    UIViewController *resultVC;
    resultVC = [self toRootCtrlForCurrentCtrl:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self toRootCtrlForCurrentCtrl:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)toRootCtrlForCurrentCtrl:(UIViewController *)currentCtrl {
    if ([currentCtrl isKindOfClass:[UINavigationController class]]) {
        return [self toRootCtrlForCurrentCtrl:[(UINavigationController *)currentCtrl topViewController]];
    } else if ([currentCtrl isKindOfClass:[UITabBarController class]]) {
        return [self toRootCtrlForCurrentCtrl:[(UITabBarController *)currentCtrl selectedViewController]];
    } else {
        return currentCtrl;
    }
    return nil;
}

@end
