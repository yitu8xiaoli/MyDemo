//
//  VersionInstructionsViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/8.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "VersionInstructionsViewController.h"
#import "VersionInstructionsTableViewCell.h"
@interface VersionInstructionsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/

@end

@implementation VersionInstructionsViewController


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
    self.title = @"版本说明";
}
#pragma mark 头部UI

-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[VersionInstructionsTableViewCell class] forCellReuseIdentifier:@"finCell"];
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
    VersionInstructionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[VersionInstructionsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.arrowImage.image = [UIImage imageNamed:@"next"];

    if (indexPath.row == 0) {
        cell.titleLab.text = @"V1.2.1主要更新";
        cell.titleShowLab.text = @"2018.08.31";
    }
    else if (indexPath.row == 1)
    {
        cell.titleLab.text = @"V1.2.2主要更新";
        cell.titleShowLab.text = @"2018.09.31";
    }
    else
    {
        cell.titleLab.text = @"V1.2.3主要更新";
        cell.titleShowLab.text = @"2018.10.31";
        cell.lineView.hidden = YES;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        
    }
    else if (indexPath.row == 1)
    {
        
    }
    else if (indexPath.row == 2)
    {
        
    }
    else if (indexPath.row == 3)
    {
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
