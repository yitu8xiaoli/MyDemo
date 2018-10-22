//
//  MineViewController.m
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/27
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "MineViewController.h"
#import "MyWebViewController.h"
#import "MineTableViewCell.h"
#import "IdentityAuthenticationViewController.h"//身份认证
#import "SafeCenterViewController.h"//安全中心

#import "PaymentStyleViewController.h"//收款方式
#import "NodeArchitectureViewController.h"//节点架构
#import "AboutMineViewController.h"//关于我们
#import "UserFeedbackViewController.h"//用户反馈
#import "SystemSetViewController.h"//系统设置
#import "PersonCenterViewController.h"//个人信息
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *headView;  /*头部背景*/
@property (nonatomic,strong)UILabel *nameLab;  /*用户名*/
@property (nonatomic,strong)UIImageView *headImage;  /*头部头像*/
@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/

@end

@implementation MineViewController
-(void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
   self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHeadUI];
    [self.view addSubview:self.baseTbleView];
    self.baseTbleView.tableHeaderView = self.headView;
    self.view.backgroundColor = kMainbackColor;
   

    
}
#pragma mark 头部UI
-(void)setHeadUI
{
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 75)];
    self.headView.backgroundColor = kMainbackColor;
    [self.view addSubview:self.headView];
    
    self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, kScreenW/2, 75)];
    self.nameLab.font = [UIFont systemFontOfSize:25];
    self.nameLab.textColor = RGB(4, 197, 252, 1);
    self.nameLab.adjustsFontSizeToFitWidth = YES;
    self.nameLab.minimumScaleFactor = 0.5;
    self.nameLab.text = @"Hi,灭霸";
    [self.headView addSubview:self.nameLab];
    
    self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW- 65, 13, 50, 50)];
    self.headImage.image = [UIImage imageNamed:@"tabbar_recommand"];
    [self.headView addSubview:self.headImage];
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.headView addGestureRecognizer:tapGesturRecognizer];
    
   
    
}
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"finCell"];
        //self.baseTbleView.separatorStyle = NO;
        self.baseTbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return  _baseTbleView;
}
#pragma mark - Table view data source
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//组中行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 9;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[MineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.arrowImage.image = [UIImage imageNamed:@"next"];

    if (indexPath.row == 0) {
        cell.titleLab.text = @"身份认证";
        cell.headImage.image = [UIImage imageNamed:@"身份认证icon"];
    }
    else if (indexPath.row == 1)
    {
        cell.titleLab.text = @"我的订单";
        cell.headImage.image = [UIImage imageNamed:@"我的订单icon"];

    }
    else if (indexPath.row == 2)
    {
        cell.titleLab.text = @"安全中心";
        cell.headImage.image = [UIImage imageNamed:@"安全中心icon"];

    }
    else if (indexPath.row == 3)
    {
        cell.titleLab.text = @"收款方式";
        cell.headImage.image = [UIImage imageNamed:@"收款方式icon"];
    }
    else if (indexPath.row == 4)
    {
        cell.titleLab.text = @"邀请返佣";
        cell.headImage.image = [UIImage imageNamed:@"邀请好友icon"];
    }
    else if (indexPath.row == 5)
    {
        cell.titleLab.text = @"节点架构";
        cell.headImage.image = [UIImage imageNamed:@"节点架构icon"];
    }
    else if (indexPath.row == 6)
    {
        cell.titleLab.text = @"关于我们";
        cell.headImage.image = [UIImage imageNamed:@"关于我们icon"];
    }
    else if (indexPath.row == 7)
    {
        cell.titleLab.text = @"用户反馈";
        cell.headImage.image = [UIImage imageNamed:@"用户反馈icon"];
    }
    else
    {
        cell.titleLab.text = @"系统设置";
        cell.headImage.image = [UIImage imageNamed:@"系统设置icon"];
    }
 
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        IdentityAuthenticationViewController *idVC = [[IdentityAuthenticationViewController alloc]init];
        [self.navigationController pushViewController:idVC animated:YES];
    }
    else if (indexPath.row == 1)
    {
       
    }
    else if (indexPath.row == 2)
    {
        SafeCenterViewController *safeVC = [[SafeCenterViewController alloc]init];
        [self.navigationController pushViewController:safeVC animated:YES];
    }
    else if (indexPath.row == 3)
    {
        PaymentStyleViewController *payVC = [[PaymentStyleViewController alloc]init];
        [self.navigationController pushViewController:payVC animated:YES];
    }
    else if (indexPath.row == 4)
    {

    }
    else if (indexPath.row == 5)
    {
        NodeArchitectureViewController *nodeVC = [[NodeArchitectureViewController alloc]init];
        [self.navigationController pushViewController:nodeVC animated:YES];
    }
    else if (indexPath.row == 6)
    {
        AboutMineViewController *aboutVC = [[AboutMineViewController alloc]init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
    else if (indexPath.row == 7)
    {
        UserFeedbackViewController *userVC = [[UserFeedbackViewController alloc]init];
        [self.navigationController pushViewController:userVC animated:YES];
    }
    else
    {
        SystemSetViewController *sysVC = [[SystemSetViewController alloc]init];
        [self.navigationController pushViewController:sysVC animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}
#pragma mark 个人信息点击事件
-(void)tapAction
{
    PersonCenterViewController *personVC = [[PersonCenterViewController alloc]init];
    [self.navigationController pushViewController:personVC animated:YES];
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
