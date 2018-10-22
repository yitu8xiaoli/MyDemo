//
//  MyAddressViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "MyAddressViewController.h"
#import "AddAddressViewController.h"
#import "AddDetailTableViewCell.h"
@interface MyAddressViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/
@property (nonatomic,strong)UIImageView *headImage;


@end

@implementation MyAddressViewController

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
    
    
    self.title = @"我的地址";
    [self.view addSubview:self.headImage];
    //根据返回有地址,占位图隐藏
    [self.headImage removeFromSuperview];
    
    
    [self.view addSubview:self.baseTbleView];

    self.navigationItem.rightBarButtonItem = [self ls_changeRightBarItemWithImage:nil target:self title:@"添加" selector:@selector(rightAction)];
}
#pragma mark 右侧点击事件
-(void)rightAction
{
    AddAddressViewController *addVC = [[AddAddressViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];

}
#pragma mark 懒加载tab
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[AddDetailTableViewCell class] forCellReuseIdentifier:@"finCell"];
        //self.baseTbleView.separatorStyle = NO;
        self.baseTbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return  _baseTbleView;
}
#pragma mark - Table view data source
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
    AddDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[AddDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    if (indexPath.section == 0) {
       
        cell.titleLab.text = @"刘星";
        cell.titleDetailLab.text = @"浙江省滨江区西兴街道江陵路366号新都汇";
    }
    else if (indexPath.section == 1)
    {
        cell.titleLab.text = @"刘星";
        cell.titleDetailLab.text = @"浙江省滨江区西兴街道江陵路366号新都汇";
    }
    else if (indexPath.section == 2)
    {
        cell.titleLab.text = @"刘星";
        cell.titleDetailLab.text = @"浙江省滨江区西兴街道江陵路366号新都汇";
    }
    else
    {
        cell.titleLab.text = @"刘星";
        cell.titleDetailLab.text = @"浙江省滨江区西兴街道江陵路366号新都汇";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        
    }
    else if (indexPath.row == 1)
    {
        
    }
    else if (indexPath.row == 2)
    {
        
    }
}
#pragma mark 代理
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark 右滑展示多个按钮的代理
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *action0 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        tableView.editing = NO;
        NSLog(@"点击了删除");
        
    }];
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了编辑");
        // 收回左滑出现的按钮(退出编辑模式)
        tableView.editing = NO;
        
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"设为默认" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了默认");
        tableView.editing = NO;
        
    }];
    action2.backgroundColor = RGB(179, 186, 201, 1);
    action1.backgroundColor = RGB(4, 197, 252, 1);
    action0.backgroundColor = RGB(255, 39, 152, 1);
    return @[action0, action1, action2];
    
}
    
    

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
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
#pragma mark 初始化背景展位图
-(UIImageView *)headImage
{
    if (_headImage == nil) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, kScreenW, kScreenW)];//尺寸还需要修改
        self.headImage.backgroundColor = [UIColor redColor];
    }
    return _headImage;
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
