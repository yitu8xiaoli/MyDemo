//
//  DenominatedViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "DenominatedViewController.h"
#import "DenominatedTableViewCell.h"
#import "ZZCircleProgress.h"

@interface DenominatedViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/
@property (nonatomic, strong) NSIndexPath *selectPath; //存放被点击的哪一行的标志
@property (nonatomic,strong)NSString   *signStr;//计价字符

@end

@implementation DenominatedViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
    self.mBlock(self.signStr);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.baseTbleView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"计价方式";
    
    
}
#pragma mark 懒加载tab
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[DenominatedTableViewCell class] forCellReuseIdentifier:@"finCell"];
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
    return 7;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    DenominatedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[DenominatedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.titleLab.text = @"人民币(CNY)";
    }
    else if (indexPath.row == 1)
    {
        cell.titleLab.text = @"美元(USD)";
        
    }
    else if (indexPath.row == 2)
    {
        cell.titleLab.text = @"韩元(KRW)";
        
    }
    else if (indexPath.row == 3)
    {
        cell.titleLab.text = @"日元(JPY)";
        
    }
    else if (indexPath.row == 4)
    {
        cell.titleLab.text = @"欧元(EUR)";
        
    }
    else if (indexPath.row == 5)
    {
        cell.titleLab.text = @"卢布(RUB)";
        
    }
    else
    {
        cell.titleLab.text = @"英镑(GBP)";
        cell.lineView.hidden = YES;
    }
    
    //设置标记
    if ([self.moneyTag isEqualToString:cell.titleLab.text]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectPath = indexPath;
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DenominatedTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.signStr = cell.titleLab.text;
    
    //当前选择的打勾
    //当前cell row
    NSInteger newRow = [indexPath row];
    //记录上一次cell row
    NSInteger oldRow = (self.selectPath != nil) ? [self.selectPath row] : -1;
    if (newRow != oldRow)
    {
        
        //选中cell
        DenominatedTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //取消上一次选中cell
        DenominatedTableViewCell *oldCell = [tableView cellForRowAtIndexPath:self.selectPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    self.selectPath = indexPath;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
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
#pragma mark block
-(void)returnMoney:(moneyBlock)mBlock
{
    self.mBlock = mBlock;
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
