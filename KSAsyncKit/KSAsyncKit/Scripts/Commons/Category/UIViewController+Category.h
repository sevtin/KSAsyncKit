//
//  UIViewController+Category.h
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

/**
 控制器跳转
 
 @param ctrl 目标控制器
 */
-(void)pushViewController:(UIViewController *)ctrl;
/**
 返回上一个界面
 */
-(void)back;
/**
 返回根控制器
 */
-(void)popToRoot;

/**
 模态跳转
 
 @param ctrl 目标控制器
 */
-(void)presentViewController:(UIViewController *)ctrl;
/**
 关闭模态窗口
 */
-(void)dismiss;

-(void)dismissRoot;

@end
