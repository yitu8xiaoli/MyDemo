//
//  NodeArchitectureViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/8.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "NodeArchitectureViewController.h"
#import "NodeTableViewCell.h"
@interface NodeArchitectureViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL status[10]; //记录每个单元格的状态   默认no闭合
}
@property (nonatomic,strong)UIView *headView;  /*头部背景*/
@property (nonatomic,strong)UIImageView *headBackLineView;  /*上部阴影*///放置图片效果更好
@property (nonatomic,strong)UILabel *attributionLab;  /*归属节点*/
@property (nonatomic,strong)UILabel *attributionShowLab;  /*归属节点展示*/
@property (nonatomic,strong)UILabel *allAttributionLab;  /*总结点数*/
@property (nonatomic,strong)UILabel *allAttributionShowLab;  /*总节点展示*/

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/

@end

@implementation NodeArchitectureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHeadUI];
    [self.view addSubview:self.baseTbleView];
    self.baseTbleView.tableHeaderView = self.headView;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"节点架构";
    
    
}
#pragma mark 头部UI
-(void)setHeadUI
{
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 104)];
    self.headView.backgroundColor = kMainbackColor;
    [self.view addSubview:self.headView];
    
    self.headBackLineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, kScreenW, 49)];
    self.headBackLineView.backgroundColor = RGB(6, 19, 51, 0.48);
    [self.headView addSubview:self.headBackLineView];
    
    self.attributionLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, kScreenW/2-15, 49)];
    self.attributionLab.font = [UIFont systemFontOfSize:16];
    self.attributionLab.textColor = [UIColor whiteColor];
    self.attributionLab.adjustsFontSizeToFitWidth = YES;
    self.attributionLab.minimumScaleFactor = 0.5;
    self.attributionLab.text = @"归属节点";
    [self.headBackLineView addSubview:self.attributionLab];
    
    self.attributionShowLab = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2, 0, kScreenW/2-15, 49)];
    self.attributionShowLab.font = [UIFont systemFontOfSize:16];
    self.attributionShowLab.textColor =  RGB(4, 197, 252, 1);
    self.attributionShowLab.adjustsFontSizeToFitWidth = YES;
    self.attributionShowLab.minimumScaleFactor = 0.5;
    self.attributionShowLab.text = @"zunp999";
    self.attributionShowLab.textAlignment = NSTextAlignmentRight;
    [self.headBackLineView addSubview:self.attributionShowLab];
    
    self.allAttributionLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.headBackLineView), 66, 45)];
    self.allAttributionLab.font = [UIFont systemFontOfSize:16];
    self.allAttributionLab.textColor = [UIColor whiteColor];
    self.allAttributionLab.adjustsFontSizeToFitWidth = YES;
    self.allAttributionLab.minimumScaleFactor = 0.5;
    self.allAttributionLab.text = @"总节点数:";
    [self.headView addSubview:self.allAttributionLab];
    
    self.allAttributionShowLab = [[UILabel alloc]initWithFrame:CGRectMake(maxX(self.allAttributionLab)+2, maxY(self.headBackLineView), kScreenW/2-15, 49)];
    self.allAttributionShowLab.font = [UIFont systemFontOfSize:16];
    self.allAttributionShowLab.textColor =  [UIColor whiteColor];
    self.allAttributionShowLab.adjustsFontSizeToFitWidth = YES;
    self.allAttributionShowLab.minimumScaleFactor = 0.5;
    self.allAttributionShowLab.text = @"   4";
    self.allAttributionShowLab.textAlignment = NSTextAlignmentLeft;
    [self.headView addSubview:self.allAttributionShowLab];
    
   
}
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[NodeTableViewCell class] forCellReuseIdentifier:@"finCell"];
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
    
    BOOL closeAge = status[section];
    //关闭显示为0行
    if (closeAge == NO) {
        return 0;
    }
    return 4;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    NodeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[NodeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLab.text = @"忧郁的蓝胖子";
    
    
    return cell;
}
//自定义section的header view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIControl *titileView = [[UIControl alloc] initWithFrame:CGRectZero];
    titileView.backgroundColor = kCellbackColor;

    titileView.tag = section;
    [titileView addTarget:self action:@selector(sectionAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置  头视图的标题什么的
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(14, 14, kScreenW/2, 49)];
    titleLable.backgroundColor = [UIColor clearColor];
    titleLable.textColor = [UIColor whiteColor];
    titleLable.font = [UIFont systemFontOfSize:16];
    titleLable.text = @"直属节点";
    [titleLable sizeToFit];
    [titileView addSubview:titleLable];
    
    UIImageView *lastImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW-30, 12, 22, 22)];
    lastImageView.backgroundColor = [UIColor clearColor];
    lastImageView.image = [UIImage imageNamed:@"my_kefu_icon_arrow_xia"];
    [titileView addSubview:lastImageView];
    return titileView;
}
//点击section的header view的方法实现，保存当前section的闭合状态
- (void)sectionAction:(UIControl *)control{
    
    NSInteger section = 0;
    
    status[0] = !status[0];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    [self.baseTbleView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade]; //刷新制定单元格
    
}
//section的header view的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 49;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
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
