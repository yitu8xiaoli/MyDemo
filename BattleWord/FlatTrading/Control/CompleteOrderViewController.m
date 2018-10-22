//
//  CompleteOrderViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/18.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "CompleteOrderViewController.h"
#import "CompleteOrderView.h"
@interface CompleteOrderViewController ()
@property (nonatomic,strong)CompleteOrderView *compView;


@end

@implementation CompleteOrderViewController


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
    self.title = @"订单详情";
    self.compView = [[CompleteOrderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    self.view = self.compView;
    
    
    //    //设置背景图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"backImage"];
    imageView.userInteractionEnabled = YES;
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
