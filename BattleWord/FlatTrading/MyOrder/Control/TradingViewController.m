//
//  TradingViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/17.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "TradingViewController.h"
#import "TradingTableViewCell.h"
#import "IntervalTableViewCell.h"
@interface TradingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/
@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong)UIButton *buyBtn;
@property (nonatomic,strong)UIButton *sellBtn;
@property (nonatomic,strong)UILabel *markLab;
@property (nonatomic,strong)NSArray *arrayBtn;

@property (nonatomic,strong)UIView *footView;
@property (nonatomic,strong)UIButton *nextBtn;
@property (nonatomic,strong)UILabel *marginLab;//保证金
@property (nonatomic,strong)UILabel *serviceLab;//平台服务费

@end

@implementation TradingViewController


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
    [self.view addSubview:self.headView];
    [self.headView addSubview:self.buyBtn];
    [self.headView addSubview:self.sellBtn];
    [self.headView addSubview:self.markLab];
    [self.view addSubview:self.baseTbleView];
    [self.view addSubview:self.footView];
    [self.footView addSubview:self.nextBtn];
    [self.footView addSubview:self.marginLab];
    [self.footView addSubview:self.serviceLab];
    self.baseTbleView.tableFooterView = self.footView;

    self.view.backgroundColor = [UIColor whiteColor];
    self.arrayBtn = [NSArray arrayWithObjects:self.buyBtn,self.sellBtn, nil];

    self.title = @"发布交易";
    
    
}
#pragma mark 头部UI

-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 45,kScreenW,kScreenH-45) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[TradingTableViewCell class] forCellReuseIdentifier:@"finCell"];
        [self.baseTbleView registerClass:[IntervalTableViewCell class] forCellReuseIdentifier:@"interCell"];

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
    
    return 2;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    TradingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[TradingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"定价方式";
            cell.titlabShowText.placeholder = @"固定价格";
            [cell.titlabShowText setValue:RGB(255, 255, 255, 0.87) forKeyPath:@"_placeholderLabel.textColor"];
            [cell.titlabShowText setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
            cell.titlabShowText.enabled = NO;

        }
        else
        {
            cell.titleLab.text = @"交易价格";
            cell.titlabShowText.placeholder = @"请输入交易价格";
            cell.lineView.hidden = YES;
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"数量(USDT)";
            cell.titlabShowText.placeholder = @"请输入购买数量";
        }
        else
        {
            cell.titleLab.text = @"金额(CNY)";
            cell.titlabShowText.placeholder = @"最小交易额2000";
            cell.lineView.hidden = YES;
        }
    }
    else
    {
        if (indexPath.row == 0) {
            NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
            IntervalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
            if (cell == nil) {
                cell = [[IntervalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else
        {
            cell.titleLab.text = @"交易说明";
            cell.titlabShowText.placeholder = @"请输入备注说明";
            cell.lineView.hidden = YES;
        }
    }
 
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 32)];
        view.backgroundColor = RGB(6, 19, 51, 0.24);
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15,0, (kScreenW-30)/2, 32)];
        lab.textColor = kWordGrayColor;
        lab.font = [UIFont systemFontOfSize:12];
        lab.text = @"价格";
        [view addSubview:lab];
        UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2,0, (kScreenW-30)/2, 32)];
        lab2.textColor = kWordGrayColor;
        lab2.font = [UIFont systemFontOfSize:12];
        lab2.textAlignment = NSTextAlignmentRight;
        lab2.text = @"当前盘口价格$6.89";
        [view addSubview:lab2];
        return view;
    }
    else if (section == 1)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 32)];
        view.backgroundColor = RGB(6, 19, 51, 0.24);
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15,0, kScreenW-30, 32)];
        lab.textColor = kWordGrayColor;
        lab.font = [UIFont systemFontOfSize:12];
        lab.text = @"交易数额";
        [view addSubview:lab];
        return view;
    }
    else
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 32)];
        view.backgroundColor = RGB(6, 19, 51, 0.24);
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15,0, kScreenW-30, 32)];
        lab.textColor = kWordGrayColor;
        lab.font = [UIFont systemFontOfSize:12];
        lab.text = @"对手限制";
        [view addSubview:lab];
        return view;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc]init];
}
- (UILabel *)markLab
{
    if (_markLab == nil) {
        self.markLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.buyBtn.frame)-15, maxY(self.buyBtn) + 1, 30, 1)];
        self.markLab.backgroundColor = [UIColor colorWithRed:4/255.0 green:197/255.0 blue:252/255.0 alpha:1.0];
    }
    return _markLab;
}
-(void)buttonClick:(UIButton *)sender
{
//    NSInteger i = sender.tag - 1000;
    [UIView animateWithDuration:.3 animations:^{
        self.markLab.frame = CGRectMake(CGRectGetMidX(sender.frame)-15, maxY(self.buyBtn) - 1, 30, 1);
        for (UIButton * btn in self.arrayBtn) {
            if ([btn isEqual:sender])
            {
                [btn setTitleColor:[UIColor colorWithRed:4/255.0 green:197/255.0 blue:252/255.0 alpha:1.0]  forState:UIControlStateNormal];
            }
            else
            {
                [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.87] forState:UIControlStateNormal];
            }
        }
    }];
}
#pragma mark 头部view
-(UIView *)headView
{
    if (_headView == nil) {
        self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 45)];
        self.headView.backgroundColor = RGB(10, 31, 55, 1);
    }
    return _headView;
}
- (UIButton *)buyBtn
{
    if (_buyBtn == nil) {
        self.buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buyBtn.frame = CGRectMake(0, 12, kScreenW / 2, 23);
        [self.buyBtn setTitle:@"我要购买" forState:UIControlStateNormal];
        [self.buyBtn setTitleColor: [UIColor colorWithRed:4/255.0 green:197/255.0 blue:252/255.0 alpha:1.0] forState:UIControlStateNormal];
        self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        // self.hotXYBtn.titleLabel.font = kFont;
        self.buyBtn.tag = 1000;
        [self.buyBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyBtn;
}
- (UIButton *)sellBtn
{
    if (_sellBtn == nil) {
        self.sellBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sellBtn.frame = CGRectMake(maxX(self.buyBtn), minY(self.buyBtn), self.buyBtn.width, self.buyBtn.hight);
        [self.sellBtn setTitle:@"我要出售" forState:UIControlStateNormal];
        [self.sellBtn setTitleColor: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.87] forState:UIControlStateNormal];
        self.sellBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.sellBtn.tag = 1001;
        [self.sellBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sellBtn;
}
#pragma mark 尾部view
-(UIView *)footView
{
    if (_footView == nil) {
        self.footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 110)];
        self.footView.backgroundColor = RGB(10, 31, 55, 1);
    }
    return _footView;
}
- (UIButton *)nextBtn
{
    if (_nextBtn == nil) {
        self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBtn.frame = CGRectMake(15, 41, kScreenW-30,45);
        [self.nextBtn setTitle:@"发布" forState:UIControlStateNormal];
        [self.nextBtn setTitleColor: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
        self.nextBtn.backgroundColor = RGB(179, 186, 201, 1);
        self.nextBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}
-(UILabel *)marginLab
{
    if (_marginLab == nil) {
        _marginLab = [[UILabel alloc]initWithFrame:CGRectMake(15,maxY(_nextBtn)+7, (kScreenW-30)/2, 17)];
        _marginLab.textColor = kWordGrayColor;
        _marginLab.font = [UIFont systemFontOfSize:12];
        _marginLab.text = @"交易保证金:  100USDT";
    }
    return _marginLab;
}
-(UILabel *)serviceLab
{
    if (_serviceLab == nil) {
        _serviceLab = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2,maxY(_nextBtn)+7,(kScreenW-30)/2, 17)];
        _serviceLab.textColor = kWordGrayColor;
        _serviceLab.font = [UIFont systemFontOfSize:12];
        _serviceLab.textAlignment = NSTextAlignmentRight;
        _serviceLab.text = @"平台服务费:  0%";
    }
    return _serviceLab;
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
