//
//  LanguageViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LanguageViewController.h"
#import "LanguageTableViewCell.h"
@interface LanguageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/
@property (nonatomic, strong) NSIndexPath *selectPath; //存放被点击的哪一行的标志
@property (nonatomic,strong)NSString   *langStr;//计价字符

@end

@implementation LanguageViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
    self.langBlock(self.langStr);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.baseTbleView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"系统设置";
    
    
}
#pragma mark 懒加载tab
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[LanguageTableViewCell class] forCellReuseIdentifier:@"finCell"];
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
    LanguageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[LanguageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        cell.titleLab.text = @"简体中文";
    }
    else if (indexPath.row == 1)
    {
        cell.titleLab.text = @"繁体中文";
    }
    else
    {
        cell.titleLab.text = @"English";
        cell.lineView.hidden = YES;
    }
    //设置标记
    if ([self.langTag isEqualToString:cell.titleLab.text]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectPath = indexPath;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LanguageTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.langStr = cell.titleLab.text;
    //当前选择的打勾
    //当前cell row
    NSInteger newRow = [indexPath row];
    //记录上一次cell row
    NSInteger oldRow = (self.selectPath != nil) ? [self.selectPath row] : -1;
    if (newRow != oldRow)
    {
        
        //选中cell
        LanguageTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //取消上一次选中cell
        LanguageTableViewCell *oldCell = [tableView cellForRowAtIndexPath:self.selectPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;

    }
    self.selectPath = indexPath;

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
#pragma mark block 代理
-(void)returnLang:(langusgeBlock)langBlock
{
    self.langBlock = langBlock;
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
