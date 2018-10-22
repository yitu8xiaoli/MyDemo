//
//  NameAuthenticationViewController.m
//  ProjectFramework
//
//  Created by apple on 2018/9/28.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "NameAuthenticationViewController.h"
#import "NameAuthenticationView.h"
@interface NameAuthenticationViewController ()
@property (nonatomic,strong)NameAuthenticationView *nameVC;



@end

@implementation NameAuthenticationViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    //设置背景图片
   
    
    self.title = @"实名认证";
    self.view.backgroundColor = [UIColor whiteColor];
    self.nameVC = [[NameAuthenticationView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.nameVC;
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"backImage"];
    [self.view insertSubview:imageView atIndex:0];
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
