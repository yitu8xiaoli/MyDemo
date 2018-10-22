//
//  UIViewController+LSExtension.m
//  Project
//
//  Created by 李帅 on 2017/3/8.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import "UIViewController+LSExtension.h"
#import "UIImage+LSExtension.h"

@implementation UIViewController (LSExtension)

- (void)ls_changeNavigationColor:(UIColor *)color
             deleteBottomLine:(BOOL)deleteLine {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage ls_imageWithColor:color]
                                                  forBarMetrics:0];
    if (deleteLine) {
        self.navigationController.navigationBar.shadowImage = [UIImage new];
    } else {
        self.navigationController.navigationBar.shadowImage = nil;
    }
}

- (void)ls_changStatusBarWithStyle:(UIStatusBarStyle)style {
    [[UIApplication sharedApplication] setStatusBarStyle:style
                                                animated:YES];
}

- (void)ls_changeNavigationBarWithMainColor {
    [self ls_changeNavigationColor:kMainbackColor deleteBottomLine:NO];
    [self ls_changStatusBarWithStyle:UIStatusBarStyleLightContent];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)ls_changeNavigationBarWithWhiteColor {
    [self ls_changeNavigationColor:[UIColor whiteColor] deleteBottomLine:NO];
    [self ls_changStatusBarWithStyle:UIStatusBarStyleDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
}

- (void)ls_changeNavigationClearColor {
    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    UIImage *image = [UIImage ls_imageWithColor:[UIColor whiteColor] alpha:0.0];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (UIBarButtonItem *)ls_changeLeftBarItemWithImage:(NSString *)image
                                            target:(id)target
                                          selector:(SEL)selector {
    return [self ls_changeLeftBarItemWithImage:image
                                        target:target
                                    titleColor:kMainbackColor
                                      selector:selector];
}

- (UIBarButtonItem *)ls_changeLeftBarItemWithImage:(NSString *)image
                                            target:(id)target
                                        titleColor:(UIColor *)titleColor
                                          selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@" " forState:UIControlStateNormal];
    //    button.backgroundColor =[UIColor redColor];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 55, 44);
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    if (image) {
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    } else {
        [button setImage:[UIImage imageNamed:@"public_back_arrow"] forState:UIControlStateNormal];
    }
    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (UIBarButtonItem *)ls_changeRightBarItemWithImage:(NSString *)image
                                             target:(id)target
                                              title:(NSString *)title
                                           selector:(SEL)selector {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] init];
    [right setTarget:target];
    [right setAction:selector];
    [right setTintColor:[UIColor whiteColor]];
    if (image) {
        [right setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    
    if (title) {
        [right setTitle:title];
    }
    return right;
}

@end
