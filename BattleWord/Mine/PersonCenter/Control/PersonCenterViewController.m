//
//  PersonCenterViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "PersonStyleOneTableViewCell.h"
#import "PersonStyleTwoTableViewCell.h"
#import "PersonStyleThreeTableViewCell.h"
#import "HeadImageViewController.h"//头像
#import "ModifyNameViewController.h"//昵称
#import "ModifySexViewController.h"//性别
#import "ModifySignatureViewController.h"//个性签名
#import "MyCodeViewController.h"//二维码
#import "MyAddressViewController.h"
@interface PersonCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/
@property (nonatomic,strong)NSString *nameStr;   /*回传昵称*/
@property (nonatomic,strong)NSString *sexStr;   /*回传性别*/
@property (nonatomic,strong)NSString *signStr;   /*回传个性签名*/

@end

@implementation PersonCenterViewController

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
    [self.view addSubview:self.baseTbleView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人信息";
    
    
    
    [self setUIValue];
}
#pragma mark 设置初始值,后台请求
-(void)setUIValue
{
    self.sexStr = @"男";
}
#pragma mark 懒加载tab
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[PersonStyleOneTableViewCell class] forCellReuseIdentifier:@"finCell"];
        [self.baseTbleView registerClass:[PersonStyleOneTableViewCell class] forCellReuseIdentifier:@"twofinCell"];
        [self.baseTbleView registerClass:[PersonStyleThreeTableViewCell class] forCellReuseIdentifier:@"threefinCell"];

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
    if (section == 0) {
        return 6;
    }
    else
    {
        return 1;
    }
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    PersonStyleOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[PersonStyleOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.arrowImage.image = [UIImage imageNamed:@"next"];

    if (indexPath.section == 0) {
        if (indexPath.row == 0)
        {
            PersonStyleThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threefinCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.arrowImage.image = [UIImage imageNamed:@"next"];
            cell.titleLab.text = @"头像";
            cell.headImage.backgroundColor = [UIColor redColor];
            return cell;
        }
        else if (indexPath.row == 1)
        {
            cell.titleLab.text = @"昵称";
            cell.titleShowLab.text = self.nameStr;
            return cell;
        }
        else if (indexPath.row == 2)
        {
            cell.titleLab.text = @"账号";
            cell.titleShowLab.text = @"summer1020";
            cell.arrowImage.hidden = YES;
            return cell;
        }
        else if (indexPath.row == 3)
        {
            cell.titleLab.text = @"性别";
            cell.titleShowLab.text = self.sexStr;
            return cell;
        }
        else if (indexPath.row == 4)
        {
            cell.titleLab.text = @"个性签名";
            cell.titleShowLab.text = self.signStr;
            return cell;
        }
        else
        {
            cell.titleLab.text = @"我的二维码";
            cell.lineView.hidden = YES;
            return cell;
        }
    }
    else
    {
        PersonStyleTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twofinCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.arrowImage.image = [UIImage imageNamed:@"next"];
        cell.titleLab.text = @"我的地址";
        cell.lineView.hidden = YES;
        
        return cell;
    }

    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0)
        {
            HeadImageViewController*headVC = [[HeadImageViewController alloc]init];
            [self.navigationController pushViewController:headVC animated:YES];
        }
        else if (indexPath.row == 1)
        {
            ModifyNameViewController*modVC = [[ModifyNameViewController alloc]init];
            [modVC returnText:^(NSString *str) {
                self.nameStr = str;
                [self.baseTbleView reloadData];
        
            }];
            [self.navigationController pushViewController:modVC animated:YES];
        }
        else if (indexPath.row == 3)
        {
            ModifySexViewController *modVC = [[ModifySexViewController alloc]init];
            [modVC returnSex:^(NSString * str) {
                if ([str isEqualToString:@"1"]) {
                    self.sexStr = @"男";
                }
                else
                {
                    self.sexStr = @"女";
                }
                [self.baseTbleView reloadData];
                
            }];
            modVC.sexTag = self.sexStr;
            [self.navigationController pushViewController:modVC animated:YES];
        }
        else if (indexPath.row == 4)
        {
            ModifySignatureViewController *modVC = [[ModifySignatureViewController alloc]init];
            [modVC returnSign:^(NSString *str) {
                self.signStr = str ;
            }];
            [self.baseTbleView reloadData];
            [self.navigationController pushViewController:modVC animated:YES];
        }
        else
        {
            MyCodeViewController *codeVC = [[MyCodeViewController alloc]init];
            [self.navigationController pushViewController:codeVC animated:YES];
        }
    }
    else
    {
        MyAddressViewController *codeVC = [[MyAddressViewController alloc]init];
        [self.navigationController pushViewController:codeVC animated:YES];
    }
 
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            return 75;
        }
        else
        {
            return 49;
        }
    }
    else
    {
        return 49;
    }
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
