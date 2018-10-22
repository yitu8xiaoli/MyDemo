//
//  PaymentStyleViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/9/30.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "PaymentStyleViewController.h"
#import "PaymentTableViewCell.h"
#import "ChooseStyleViewController.h"
@interface PaymentStyleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIImageView *backImage;/*背景提示图片*/
@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/


@end

@implementation PaymentStyleViewController
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
    self.title = @"收款方式";
    self.view.backgroundColor = [UIColor whiteColor];

    [self backUI];//背景图
   // [self.view addSubview:self.baseTbleView];
    //设置右侧按钮
    self.navigationItem.rightBarButtonItem = [self ls_changeRightBarItemWithImage:nil target:self title:@"添加" selector:@selector(rightBarction)];
    
}
-(void)rightBarction
{
    ChooseStyleViewController *chooseVC = [[ChooseStyleViewController alloc]init];
    [self.navigationController pushViewController:chooseVC animated:YES];
    
}
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[PaymentTableViewCell class] forCellReuseIdentifier:@"finCell"];
        //self.baseTbleView.separatorStyle = NO;
        self.baseTbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return  _baseTbleView;
}
#pragma mark - Table view data source
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//组中行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    PaymentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[PaymentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.headImage.image = [UIImage imageNamed:@"tabbar_destination"];
    cell.styleNameLab.text = @"招商银行储蓄卡";
    cell.accountLab.text = @"6212 2312 3444 6643";
    cell.nameLab.text = @"持卡人: 沈微微";
  
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
#pragma mark cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
#pragma mark cell表头之间间隔高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
#pragma mark cell尾部之间间隔高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
#pragma mark cell表头view
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc]init];
}
#pragma mark cell尾部view
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc]init];
}
#pragma mark 底部无收款方式提示图
-(void)backUI
{
    self.backImage = [[UIImageView alloc]initWithFrame:CGRectMake(65, 142, kScreenW-130, 177)];
    self.backImage.image = [UIImage imageNamed:@"pic_暂无收款方式，点击添加"];
    self.backImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.backImage];
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
