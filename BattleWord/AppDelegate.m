//
//  AppDelegate.m
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AppDelegate.h"
#import "LSTabBarController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "MineViewController.h"
#import "LSNavigationController.h"

#define APP_ID @"lSKy6cV4UGpBNoSAeoVJmwGF-gzGzoHsz"
#define APP_KEY @"hYVKTmQ7XheQdwUIawAHb1Ux"
@interface AppDelegate ()

@end
//测试git------------------
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
//    image.image = [UIImage imageNamed:@"backImage"];
//    [self.window addSubview:image];
    //window 初始化
    [self windowInitWithRoot:application];

    //incloud 调试
    //初始化 SDK
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY];
    //开启调试日志
    [AVOSCloud setAllLogsEnabled:YES];
    
    
    
    
    return YES;
}


// window初始化
- (void)windowInitWithRoot:(UIApplication *)application {

   

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;//修改顶部状态栏颜色
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

    LSTabBarController *tabBar = [[LSTabBarController alloc] init];
    self.window.rootViewController = tabBar;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
