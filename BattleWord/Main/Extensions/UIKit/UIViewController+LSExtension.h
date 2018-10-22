//
//  UIViewController+LSExtension.h
//  Project
//
//  Created by 李帅 on 2017/3/8.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LSExtension)

/**
 修改导航栏的颜色

 @param color color
 @param deleteLine 是否要删除👇那条线
 */
- (void)ls_changeNavigationColor:(UIColor *_Nullable)color deleteBottomLine:(BOOL)deleteLine;

/**
 修改状态颜色

 @param style style
 */
- (void)ls_changStatusBarWithStyle:(UIStatusBarStyle)style;

/**
 改变导航栏颜色为主色调
 */
- (void)ls_changeNavigationBarWithMainColor;

/**
 改变导航栏颜色为白色
 */
- (void)ls_changeNavigationBarWithWhiteColor;

/**
 改变导航栏位透明色
 */
- (void)ls_changeNavigationClearColor;

/**
 自定义左侧返回按钮

 @param image 图片，默认是那个蓝色的
 @param selector 响应方法
 */
- (UIBarButtonItem * _Nullable)ls_changeLeftBarItemWithImage:(nullable NSString *)image
                                                      target:(nullable id)target
                                                    selector:(nullable SEL)selector;

- (UIBarButtonItem * _Nullable)ls_changeLeftBarItemWithImage:(nullable NSString *)image
                                                      target:(nullable id)target
                                                  titleColor:(nullable UIColor *)titleColor
                                                    selector:(nullable SEL)selector;

- (UIBarButtonItem * _Nullable)ls_changeRightBarItemWithImage:(nullable NSString *)image
                                                       target:(nullable id)target
                                                        title:(nullable NSString *)title
                                                     selector:(nullable SEL)selector;

@end
