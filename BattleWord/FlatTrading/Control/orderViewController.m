//
//  orderViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/15.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "orderViewController.h"
#import "orderView.h"
#import "BatterAlertView.h"
#import "CanaelOrderViewController.h"
#import "ConfirmOrderView.h"
#import "StayReleaseViewController.h"
#import "CompleteOrderViewController.h"
@interface orderViewController ()
@property (nonatomic,strong)orderView *oView;//view
@property (nonatomic, strong)BatterAlertView *myAlertView;
@property (nonatomic, strong)ConfirmOrderView *confirmView;


@end

@implementation orderViewController
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
    self.oView = [[orderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    self.view = self.oView;
    
//    //设置背景图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"backImage"];
    imageView.userInteractionEnabled = YES;
    [self.view insertSubview:imageView atIndex:0];
    
    
    //切换按钮点击事件
    self.oView.orderBackImage.userInteractionEnabled = YES;

    [self.oView.switchBtn addTarget:self action:@selector(switchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.oView.cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.oView.determineBtn addTarget:self action:@selector(determineBtnAction) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark 切换支付方式点击事件
-(void)switchBtnAction
{
    [self creatActionSheet];
}
#pragma mark 取消交易点击事件
-(void)cancelBtnAction
{
    NSLog(@"取消交易");
    self.myAlertView = [[BatterAlertView alloc]initWithFrame:CGRectMake(0, 0, kScreenW , kScreenH)];
    [self.myAlertView.detertionBtn addTarget:self action:@selector(detertionBtnAction) forControlEvents:UIControlEventTouchUpInside];
     [self.myAlertView.cancelBtn addTarget:self action:@selector(cacAction) forControlEvents:UIControlEventTouchUpInside];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.myAlertView];
    
}
#pragma mark 我已付款点击事件
-(void)determineBtnAction
{
    NSLog(@"我已付款");
    self.confirmView = [[ConfirmOrderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW , kScreenH)];
    [self.confirmView.detertionBtn addTarget:self action:@selector(confirmDetertionBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.confirmView.cancelBtn addTarget:self action:@selector(confirmCacAction) forControlEvents:UIControlEventTouchUpInside];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.confirmView];
}
#pragma mark 确定取消交易
-(void)detertionBtnAction
{
    NSLog(@"确定");
    [self.myAlertView removeFromSuperview];
    CanaelOrderViewController *canVC = [[CanaelOrderViewController alloc]init];
    [self.navigationController pushViewController:canVC animated:YES];
    
}
#pragma mark 取消取消交易
-(void)cacAction
{
    NSLog(@"我再看看");
    [self.myAlertView removeFromSuperview];

}
#pragma mark 确认付款确定
-(void)confirmDetertionBtnAction
{
    [self.confirmView removeFromSuperview];
    
    StayReleaseViewController *canVC = [[StayReleaseViewController alloc]init];
    [self.navigationController pushViewController:canVC animated:YES];
    
}
#pragma mark 确认付款取消
-(void)confirmCacAction
{
    [self.confirmView removeFromSuperview];
    CompleteOrderViewController *canVC = [[CompleteOrderViewController alloc]init];
    [self.navigationController pushViewController:canVC animated:YES];
}

#pragma 支付方式展示
-(void)creatActionSheet {
    /*
     先创建UIAlertController，preferredStyle：选择UIAlertControllerStyleActionSheet，这个就是相当于创建8.0版本之前的UIActionSheet；
     
     typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
     UIAlertControllerStyleActionSheet = 0,
     UIAlertControllerStyleAlert
     } NS_ENUM_AVAILABLE_IOS(8_0);
     */
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    /*
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,         取消按钮
     UIAlertActionStyleDestructive     破坏性按钮，比如：“删除”，字体颜色是红色的
     } NS_ENUM_AVAILABLE_IOS(8_0);
     
     */
    // 创建action，这里action1只是方便编写，以后再编程的过程中还是以命名规范为主
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"民生银行" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ///
        self.oView.cardNameLab.text = @"民生银行";
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"支付宝" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
        self.oView.cardNameLab.text = @"支付宝";
        //        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"选择了B类" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        //        [alertView show];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      
        self.oView.cardNameLab.text = @"微信";
    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [action1 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action2 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action3 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action4 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    //把action添加到actionSheet里
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    [actionSheet addAction:action4];
    
    
    //相当于之前的[actionSheet show];
    [self presentViewController:actionSheet animated:YES completion:nil];
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
