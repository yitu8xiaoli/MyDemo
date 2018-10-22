//
//  LSNavigationController.m
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSNavigationController.h"
#import "UIViewController+LSExtension.h"

@interface LSNavigationController ()

@end

@implementation LSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    //重写navbar下部黑线
    //    //    UIImageView *navBarHairlineImageView;
    //    //    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //
    //
    ////    UIImage *colorImage = [self imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 0.1)];
    ////    [self.navigationController.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
    ////    [self.navigationController.navigationBar setShadowImage:[self imageWithColor:[UIColor blackColor] size:CGSizeMake(self.view.frame.size.width, 0.1)]];
    //
    //
    //    //self.navigationBar.barTintColor =  kMainbackColor;
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    ////    [self.navigationBar setBackgroundImage:[[UIImage imageNamed:@"ArtboardNav"] stretchableImageWithLeftCapWidth:1 topCapHeight:1 ] forBarMetrics:UIBarMetricsDefault];
    ////    [self.navigationBar setShadowImage:[UIImage new]];//设置黑线
    ////
    //    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    [self configNaivgationBar];
    self.navigationBar.barTintColor =  RGB(10, 31, 55, 1);
    
    
}
//通过一个方法来找到这个黑线(findHairlineImageViewUnder):
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
        
    }
    for (UIView *subview in view.subviews)
    {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView)
        {
            return imageView;
            
        }
        
    }
    return nil;
    
} //再定义一个imageview来等同于这个黑线

//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (viewController == navigationController.viewControllers[0])
//    {
//        navigationController.interactivePopGestureRecognizer.enabled = NO;
//
//    }else
//    {
//        navigationController.interactivePopGestureRecognizer.enabled = YES;
//
//    }
//}
- (void)configNaivgationBar {
    self.navigationBar.translucent = NO;
    //    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:22]}];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0){
        viewController.navigationItem.leftBarButtonItem = [self ls_changeLeftBarItemWithImage:@"back" target:self selector:@selector(backAction)];
        
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backAction {
    [self popViewControllerAnimated:true];
}

-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    if (!color || size.width <=0 || size.height <=0) return nil;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//
//    [self configNaivgationBar];
//}
//- (void)configNaivgationBar {
//    self.navigationBar.translucent = NO;
//    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
//
//
//}
//
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (self.viewControllers.count > 0)
//    {
//        viewController.navigationItem.leftBarButtonItem = [self ls_changeLeftBarItemWithImage:@"Backarrow" selector:@selector(backAction)];
//    }
//    [super pushViewController:viewController animated:animated];
//}
//
//- (void)backAction {
//    [self popViewControllerAnimated:true];
//}
//+ (void)initialize {
//    //appearance方法返回一个导航栏的外观对象
//    //修改了这个外观对象，相当于修改了整个项目中的外观
//    UINavigationBar *navigationBar = [UINavigationBar appearance];
//    //设置导航栏背景颜色
//    [navigationBar setBarTintColor:RGB(241, 76, 79, 1)];
//    //设置NavigationBarItem文字的颜色
//    [navigationBar setTintColor:[UIColor whiteColor]];
//    //设置标题栏颜色
//    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:18]};
//
//
//
//
//    /*
//     //设置导航栏文字的主题
//     NSShadow *shadow = [[NSShadow alloc]init];
//     [shadow setShadowOffset:CGSizeZero];
//     [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSShadowAttributeName : shadow}];
//     [navigationBar setBackgroundImage:[UIImage imageNamed:@"ic_cell_bg_selected"] forBarMetrics:UIBarMetricsDefault];
//     //修改所有UIBarButtonItem的外观
//     UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
//
//     // 修改item的背景图片
//     //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//     //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//     //修改item上面的文字样式
//     NSDictionary *dict =@{NSForegroundColorAttributeName : [UIColor whiteColor],NSShadowAttributeName : shadow};
//     [barButtonItem setTitleTextAttributes:dict forState:UIControlStateNormal];
//     [barButtonItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
//     //修改返回按钮样式
//     [barButtonItem setBackButtonBackgroundImage:[UIImage imageNamed:NAVIGATION_BAR_BACK_ICON_NAME] forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];
//     //设置状态栏样式
//     [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
//     */
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
