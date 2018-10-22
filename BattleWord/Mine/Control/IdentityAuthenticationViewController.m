//
//  IdentityAuthenticationViewController.m
//  ProjectFramework
//
//  Created by apple on 2018/9/28.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "IdentityAuthenticationViewController.h"
#import "IdentityTableViewCell.h"
#import "NameAuthenticationViewController.h"
#import "NameCertificationViewController.h"
#import "NameSeniorCertificationViewController.h"
@interface IdentityAuthenticationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/

@end

@implementation IdentityAuthenticationViewController
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

    self.title = @"身份认证";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.baseTbleView];
}
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH-40) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[IdentityTableViewCell class] forCellReuseIdentifier:@"finCell"];
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
    return 3;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    IdentityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[IdentityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.arrowImage.image = [UIImage imageNamed:@"next"];
    if (indexPath.row == 0) {
        cell.titleLab.text = @"初级认证";
        cell.titleShowLab.text =@"已完成";
        cell.titleShowLab.frame = CGRectMake(kScreenW/2, 14, kScreenW/2-33, 23);
    }
    else if (indexPath.row == 1) {
        cell.titleLab.text = @"中级认证";
        cell.titleShowLab.text =@"请先完成上一级认证";
        cell.arrowImage.hidden = YES;
    }
    else
    {
        cell.titleLab.text = @"高级认证";
        cell.titleShowLab.text =@"请先完成上一级认证";
        cell.arrowImage.hidden = YES;
        cell.lineView.hidden = YES;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NameAuthenticationViewController *nameVC = [[NameAuthenticationViewController alloc]init];
        [self.navigationController pushViewController:nameVC animated:YES];
    }
    else if(indexPath.row == 1)
    {
        NameCertificationViewController *nameVC = [[NameCertificationViewController alloc]init];
        [self.navigationController pushViewController:nameVC animated:YES];
    }
    else
    {
        NameSeniorCertificationViewController *nameVC = [[NameSeniorCertificationViewController alloc]init];
        [self.navigationController pushViewController:nameVC animated:YES];
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc]init];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc]init];
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
