//
//  LSTabBarController.m
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSTabBarController.h"
#import "HomePageViewController.h"
#import "ExchangeViewController.h"
#import "ActivityViewController.h"
#import "MineViewController.h"
#import "LSNavigationController.h"
#import "GameViewController.h"
@interface LSTabBarController ()<UITabBarControllerDelegate>
@property (strong, nonatomic) NSMutableArray<__kindof UIViewController *> *childControllers;

@end

@implementation LSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //设置tabbar背景颜色
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 49)];
    backView.backgroundColor = RGB(6, 19, 51, 1);
    [self.tabBar insertSubview:backView atIndex:0]; self.tabBar.opaque = YES;

    _childControllers = [NSMutableArray array];
    [self configTabBar];

}
- (void)configTabBar {
//    [self setup];
    // 1
    HomePageViewController *homeVc = [[HomePageViewController alloc] init];
    [self configBarItemWithIndex:0 image:@"tabbar_recommand" title:@"社区" controller:homeVc];

    // 2
    ExchangeViewController *otherVc = [[ExchangeViewController alloc] init];
    [self configBarItemWithIndex:1 image:@"tabbar_chat" title:@"交易所" controller:otherVc];
    // 3
    GameViewController *ganeVC = [[GameViewController alloc] init];
    [self configBarItemWithIndex:2 image:@"tabbar_destination" title:@"游戏" controller:ganeVC];
    // 4
    ActivityViewController *actVc = [[ActivityViewController alloc] init];

    [self configBarItemWithIndex:3 image:@"tabbar_profile" title:@"钱包" controller:actVc];
    self.viewControllers = _childControllers;

    MineViewController *mineVc = [[MineViewController alloc] init];
    [self configBarItemWithIndex:4 image:@"tabbar_profile" title:@"我的" controller:mineVc];
    self.viewControllers = _childControllers;
}

/**
 配置每一个item
 
 @param index index
 @param image image
 @param title title
 @param vc    viewcontroller
 */
- (UITabBarItem *)configBarItemWithIndex:(NSInteger)index
                                   image:(NSString *)image
                                   title:(NSString *)title
                              controller:(UIViewController *)vc {
    // item setttings
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title
                                                       image:[UIImage imageNamed:image]
                                               selectedImage:[UIImage imageNamed:image]];
    LSNavigationController *navi = [[LSNavigationController alloc] initWithRootViewController:vc];
    navi.tabBarItem = item;
    [_childControllers addObject:navi];
    
    return item;
}

#pragma mark- setup
-(void)setup
{
    //  添加突出按钮
    [self addCenterButtonWithImage:[UIImage imageNamed:@"tabbar_destination"] selectedImage:[UIImage imageNamed:@"tabbar_destination"]];
    //  UITabBarControllerDelegate 指定为自己
    self.delegate=self;
    //  指定当前页——中间页
    self.selectedIndex=2;
    //  设点button状态
    _button.selected=YES;
    //  设定其他item点击选中颜色
    //myTabBar.tintColor= [UIColor colorWithRed:222/255.0 green:78/255.0 blue:22/255.0 alpha:1];
}


#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    _button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //  设定button大小为适应图片
    _button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [_button setImage:buttonImage forState:UIControlStateNormal];
    [_button setImage:selectedImage forState:UIControlStateSelected];
    
    //  这个比较恶心  去掉选中button时候的阴影
    _button.adjustsImageWhenHighlighted=NO;
    
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        _button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        _button.center = center;
    }
    
    [self.view addSubview:_button];
}

-(void)pressChange:(id)sender
{
    self.selectedIndex=2;
    _button.selected=YES;
}







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
