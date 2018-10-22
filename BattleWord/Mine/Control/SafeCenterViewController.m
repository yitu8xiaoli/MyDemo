//
//  SafeCenterViewController.m
//  ProjectFramework
//
//  Created by apple on 2018/9/28.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "SafeCenterViewController.h"
#import "IdentityTableViewCell.h"
#import "BindingViewController.h"
#import "BinddingEmallViewController.h"
#import "ChangePWViewController.h"
#import "ChangeMoneyPWViewController.h"
@interface SafeCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/

@end

@implementation SafeCenterViewController

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
    
    self.title = @"安全中心";
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
    return 3;
}
//组中行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 1;
    }
    else
    {
        return 2;
    }
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
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"绑定手机";
        }
        else
        {
            cell.titleLab.text = @"绑定邮箱";
            cell.lineView.hidden = YES;
        }
        
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"修改登录密码";
        }
        else
        {
            cell.titleLab.text = @"手势密码";
            cell.lineView.hidden = YES;
        }
    }
    else
    {
       cell.titleLab.text = @"法币资金密码";
        cell.lineView.hidden = YES;
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            BindingViewController *bindVC = [[BindingViewController alloc]init];
            [self.navigationController pushViewController:bindVC animated:YES];

        }
        else if (indexPath.row == 1)
        {
            BinddingEmallViewController *bindVC = [[BinddingEmallViewController alloc]init];
            [self.navigationController pushViewController:bindVC animated:YES];
            
        }
    }
    else  if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            ChangePWViewController *bindVC = [[ChangePWViewController alloc]init];
            [self.navigationController pushViewController:bindVC animated:YES];
            
        }
        else if (indexPath.row == 1)
        {
            BinddingEmallViewController *bindVC = [[BinddingEmallViewController alloc]init];
            [self.navigationController pushViewController:bindVC animated:YES];
            
        }
    }
    else
    {
        ChangeMoneyPWViewController *bindVC = [[ChangeMoneyPWViewController alloc]init];
        [self.navigationController pushViewController:bindVC animated:YES];
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



@end
