//
//  FiatTradingViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/11.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "FiatTradingViewController.h"
#import "YUHoriView.h"
#import "FiatTradingTableViewCell.h"
#import "screeningView.h"//右侧弹框
#import "BuyView.h"//购买弹框
#import "orderViewController.h"
#import "MyOrderListViewController.h"
#import "TradingViewController.h"
#import "SellOrderWaitPaymentViewController.h"
@interface FiatTradingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/
@property (nonatomic,strong)screeningView *sView;//筛选
@property (nonatomic,strong)BuyView *buyView;//购买

@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *buyBtn;
@property (nonatomic,strong)UIButton *saleBtn;
@property (nonatomic,strong)UIButton *tradingBtn;
@property (nonatomic,strong)UIView *lineOneView;
@property (nonatomic,strong)UIView *lineTwoView;

@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong)YUHoriView *btnsView;

@property (nonatomic,strong)UILabel *coinSpeciesLab;
@property (nonatomic,strong)UILabel *coinMoneyLab;
@property (nonatomic,strong)UILabel *coinShowLab;

@property (nonatomic,strong)UIView *maskView;

@property (nonatomic,strong)UIButton *addTradBtn;

@property (nonatomic,assign)NSInteger tabTag;//购买出售切换识别
@property (nonatomic,assign)NSString *coinStr;//币种切换识别



@end

@implementation FiatTradingViewController
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

    
    [self setUI];
    [self.view addSubview:self.baseTbleView];
//    self.baseTbleView.tableHeaderView = self.headView;
    
    [self.view addSubview:self.addTradBtn];
    //初始化筛选页面
    //遮罩
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.maskView];
    self.maskView.hidden = YES;
    self.sView = [[screeningView alloc]initWithFrame:CGRectMake(kScreenW, 0, kScreenW/5*4, kScreenH)];
    self.sView.backgroundColor = RGB(6, 19, 51, 1);
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.sView];
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.sView addGestureRecognizer:tapGesturRecognizer];
    
    //初始化购买页面
    self.buyView = [[BuyView alloc]initWithFrame:CGRectMake(0, kScreenH, kScreenW, 398)];
    self.buyView.backgroundColor = RGB(12, 34, 57, 1);
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.buyView];
    UITapGestureRecognizer *tapGesturR=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buyAction)];
    [self.buyView addGestureRecognizer:tapGesturR];
    [self.buyView.buyBtn addTarget:self action:@selector(buyBtnOrderAction) forControlEvents:UIControlEventTouchUpInside];

    //表示初始化设置
    self.tabTag = 1;
    self.coinStr = @"USDT";

}
-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 80,kScreenW,kScreenH-80-64) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[FiatTradingTableViewCell class] forCellReuseIdentifier:@"finCell"];
        //self.baseTbleView.separatorStyle = NO;
        self.baseTbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return  _baseTbleView;
}
#pragma mark - Table view data source
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
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
    FiatTradingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[FiatTradingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tabTag == 1) {
        //添加背景遮罩
        self.maskView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.buyView.frame = CGRectMake(0, kScreenH - 398, kScreenW, 398);
            self.buyView.buyNameLab.text = [NSString stringWithFormat:@"%@%@",@"购买",self.coinStr];
            [self.buyView.buyBtn setTitle:@"购买" forState:UIControlStateNormal];

        }];
    }
    else if (self.tabTag == 2)
    {
        self.maskView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.buyView.frame = CGRectMake(0, kScreenH - 398, kScreenW, 398);
            self.buyView.buyNameLab.text = [NSString stringWithFormat:@"%@%@",@"出售",self.coinStr];
            [self.buyView.buyBtn setTitle:@"出售" forState:UIControlStateNormal];
        }];
    }
    else
    {
        
    }
  
}
#pragma mark cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
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
#pragma mark 购买页面view点击事件
-(void)buyAction
{
    self.maskView.hidden = YES;//隐藏遮罩
    [UIView animateWithDuration:0.5 animations:^{
        self.buyView.frame = CGRectMake(0, kScreenH, kScreenW, 398);
    }];
}
#pragma mark view点击事件
-(void)tapAction
{
    self.maskView.hidden = YES;//隐藏遮罩
    [UIView animateWithDuration:0.5 animations:^{
        self.sView.frame = CGRectMake(kScreenW, 0, kScreenW/5*4, kScreenH);
    }];
   
}
#pragma mark 购买或者出售按钮点击事件
-(void)buyBtnOrderAction
{
    if (self.tabTag == 1) {
        self.maskView.hidden = YES;//隐藏遮罩
        [UIView animateWithDuration:0 animations:^{
            self.buyView.frame = CGRectMake(0, kScreenH, kScreenW, 398);
        }];
        orderViewController *orderVC = [[orderViewController alloc]init];
        [self.navigationController pushViewController:orderVC animated:YES];
    }
    else
    {
        self.maskView.hidden = YES;//隐藏遮罩
        [UIView animateWithDuration:0 animations:^{
            self.buyView.frame = CGRectMake(0, kScreenH, kScreenW, 398);
        }];
        SellOrderWaitPaymentViewController *orderVC = [[SellOrderWaitPaymentViewController alloc]init];
        [self.navigationController pushViewController:orderVC animated:YES];
    }
    
}
#pragma mark 筛选
-(void)listBtnAction
{
    //添加背景遮罩
    self.maskView.hidden = NO;
    NSLog(@"筛选");
    [UIView animateWithDuration:0.5 animations:^{
        self.sView.frame = CGRectMake(kScreenW/5, 0, kScreenW/5*4, kScreenH);
    }];
}
#pragma mark 列表
-(void)screeningBtnAction
{
    NSLog(@"列表");
    MyOrderListViewController *myorderVC = [[MyOrderListViewController alloc]init];
    [self.navigationController pushViewController:myorderVC animated:YES];
}
#pragma mark  添加交易
-(void)tradBtnAction
{
    TradingViewController *tradVC = [[TradingViewController alloc]init];
    [self.navigationController pushViewController:tradVC animated:YES];
}
#pragma mark 上部按钮重写
-(void)setUI
{
    //重写右侧 rightBarButtonItem
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 52, 44)];
//    view.backgroundColor = [UIColor redColor];
    UIBarButtonItem*btn=[[UIBarButtonItem  alloc]initWithCustomView:view];
    btn.width = 10;
    self.navigationItem.rightBarButtonItem = btn;
    
    UIButton *screeningBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    screeningBtn.frame = CGRectMake(0, 11, 20, 22);
    [screeningBtn setImage:[UIImage imageNamed:@"我的订单icon"] forState:UIControlStateNormal];
    [screeningBtn addTarget:self action:@selector(screeningBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:screeningBtn];
    
    UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(maxX(screeningBtn)+13, 11, 20, 22);
    [listBtn setImage:[UIImage imageNamed:@"我的订单icon"] forState:UIControlStateNormal];
    [listBtn addTarget:self action:@selector(listBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:listBtn];

    self.navView = [[UIView alloc]initWithFrame:CGRectMake(kScreenW/2-104, 0, 208, 44)];
//    self.navView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = self.navView;
    
    self.buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buyBtn.frame = CGRectMake(0, 0, 46, 44);
    [self.buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    self.buyBtn.tag = 1001;
    self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:22];
    [self.buyBtn addTarget:self action:@selector(buyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.buyBtn];
    
    self.lineOneView = [[UIView alloc]initWithFrame:CGRectMake(maxX(self.buyBtn)+6, 17, 1, 12)];
    self.lineOneView.backgroundColor = RGB(255, 255,255, 0.56);
    [self.navView addSubview:self.lineOneView];
    
    self.saleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saleBtn.frame = CGRectMake(maxX(self.lineOneView)+14, 0, 46, 44);
    [self.saleBtn setTitle:@"出售" forState:UIControlStateNormal];
    self.saleBtn.tag = 1002;
    self.saleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.saleBtn addTarget:self action:@selector(buyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.saleBtn];
    
    self.lineTwoView = [[UIView alloc]initWithFrame:CGRectMake(maxX(self.saleBtn)+14, 17, 1, 12)];
    self.lineTwoView.backgroundColor = RGB(255, 255,255, 0.56);
    [self.navView addSubview:self.lineTwoView];
    
    self.tradingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tradingBtn.frame = CGRectMake(maxX(self.lineTwoView)+14, 0, 68, 44);
    [self.tradingBtn setTitle:@"交易单" forState:UIControlStateNormal];
    self.tradingBtn.tag = 1003;
    self.tradingBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.tradingBtn addTarget:self action:@selector(buyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.tradingBtn];
    
    //初始颜色
    [self.buyBtn setTitleColor:RGB(255, 255,255, 1) forState:UIControlStateNormal];
    [self.saleBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];
    [self.tradingBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];
    
    //上部切换view
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 80)];
    self.headView.backgroundColor = RGB(6, 19,51, 0.48);
    [self.view addSubview:self.headView];
    
    CGRect r0 = CGRectMake(0, 0, kScreenW, 45);
    self.btnsView =[[YUHoriView alloc]initWithFrame:r0];
//    self.btnsView.backgroundColor = [UIColor redColor];
    self.btnsView.titles =  @[@"USDT",@"BGC",@"BTC",@"ETH",@"USDT",@"BGC",@"BTC",@"ETH"];
    __weak typeof(self) weakSelf = self;
    self.btnsView.onPosChange = ^(YUHoriElementButton *sender, int pos, NSString *title) {
        NSLog(@"pos: %d ,title :%@",pos,title);
        weakSelf.coinStr = title;
    };
    self.btnsView.xSpan = (kScreenW-162/kScreenW*kScreenW)/3;
    [self.btnsView refresh];
    [self.headView addSubview:self.btnsView];
    
    //
    self.coinSpeciesLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(_btnsView), (kScreenW -30)/3, 35)];
    self.coinSpeciesLab.textAlignment = NSTextAlignmentLeft;
    self.coinSpeciesLab.textColor = [UIColor whiteColor];
    self.coinSpeciesLab.font = [UIFont systemFontOfSize:16];
    [self.headView addSubview:self.coinSpeciesLab];
    self.coinMoneyLab = [[UILabel alloc]initWithFrame:CGRectMake(maxX(self.coinSpeciesLab), maxY(_btnsView), (kScreenW -30)/3, 35)];
    self.coinMoneyLab.textColor = RGB(255, 39, 152, 1);
    self.coinMoneyLab.textAlignment = NSTextAlignmentCenter;
    self.coinMoneyLab.font = [UIFont systemFontOfSize:16];
    [self.headView addSubview:self.coinMoneyLab];
    self.coinShowLab = [[UILabel alloc]initWithFrame:CGRectMake(maxX(self.coinMoneyLab), maxY(_btnsView), (kScreenW -30)/3, 35)];
    self.coinShowLab.textAlignment = NSTextAlignmentRight;
    self.coinShowLab.textColor = RGB(255, 39, 152, 1);
    self.coinShowLab.font = [UIFont systemFontOfSize:16];
    [self.headView addSubview:self.coinShowLab];

    //赋值
    self.coinSpeciesLab.text =@"BTC";
    self.coinMoneyLab.text =@"$47613.28";
    self.coinShowLab.text =@"-2.29%";
}

#pragma mark 购买,出售,交易单切换按钮
-(void)buyBtnAction:(UIButton *)sender
{
    if (sender.tag == 1001)//购买
    {
        self.tabTag = 1;
        self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        self.saleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.tradingBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.buyBtn setTitleColor:RGB(255, 255,255, 1) forState:UIControlStateNormal];
        [self.saleBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];
        [self.tradingBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];

    }
    else if (sender.tag == 1002)//出售
    {
        self.tabTag = 2;
        self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.saleBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        self.tradingBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.buyBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];
        [self.saleBtn setTitleColor:RGB(255, 255,255, 1) forState:UIControlStateNormal];
        [self.tradingBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];
    }
    else
    {//交易单
        self.tabTag = 3;
        self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.saleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.tradingBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        [self.buyBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];
        [self.saleBtn setTitleColor:RGB(255, 255,255, 0.56) forState:UIControlStateNormal];
        [self.tradingBtn setTitleColor:RGB(255, 255,255, 1) forState:UIControlStateNormal];
    }
    NSLog(@"购买出售交易单");
}
#pragma mark 支付成功遮罩
-(UIView *)maskView
{
    if (_maskView == nil) {
        self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        self.maskView.backgroundColor = [UIColor blackColor];
        self.maskView.alpha = 0.5;
    }
    return _maskView;
}
#pragma mark 发布交易
-(UIButton *)addTradBtn
{
    if (_addTradBtn == nil) {
        self.addTradBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.addTradBtn.frame = CGRectMake(kScreenW -60, kScreenH-95-64, 45, 45);
        [self.addTradBtn setImage:[UIImage imageNamed:@"添加照片"] forState:UIControlStateNormal];
        [self.addTradBtn addTarget:self action:@selector(tradBtnAction) forControlEvents:UIControlEventTouchUpInside];
        self.addTradBtn.layer.cornerRadius = 22.5;
        self.addTradBtn.backgroundColor = RGB(237, 235, 242, 1);
    }
    return _addTradBtn;
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
