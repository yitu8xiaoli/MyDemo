//
//  StayReleaseViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/18.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "StayReleaseViewController.h"
#import "StayReleaseView.h"
#import "ComplaintView.h"
#import "AppealViewController.h"
@interface StayReleaseViewController ()
@property (nonatomic,strong)StayReleaseView *stayView;
@property (nonatomic,strong)ComplaintView *complaView;

@end

@implementation StayReleaseViewController
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
    self.stayView = [[StayReleaseView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    self.view = self.stayView;
    
    //    //设置背景图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"backImage"];
    imageView.userInteractionEnabled = YES;
    [self.view insertSubview:imageView atIndex:0];
    
    self.stayView.orderBackImage.userInteractionEnabled = YES;
    [self.stayView.complaintBtn addTarget:self action:@selector(complaintBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark  申诉
-(void)complaintBtnAction
{
    self.complaView = [[ComplaintView alloc]initWithFrame:CGRectMake(0, 0, kScreenW , kScreenH)];
    [self.complaView.detertionBtn addTarget:self action:@selector(conmplanDetertionBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.complaView.cancelBtn addTarget:self action:@selector(conmplanCacAction) forControlEvents:UIControlEventTouchUpInside];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.complaView];
}
#pragma mark  确认申诉
-(void)conmplanDetertionBtnAction
{
    [self.complaView removeFromSuperview];
    AppealViewController *appVC = [[AppealViewController alloc]init];
    [self.navigationController pushViewController:appVC animated:YES];

}
#pragma mark  取消申诉
-(void)conmplanCacAction
{
    [self.complaView removeFromSuperview];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
   
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
