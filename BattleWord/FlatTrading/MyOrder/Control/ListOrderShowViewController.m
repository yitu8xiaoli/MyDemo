//
//  ListOrderShowViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ListOrderShowViewController.h"
#import "OrderListTableViewCell.h"
#import "OtherOrderTableViewCell.h"
#import "SellOrderWaitReleaseViewController.h"
#import "SellOrderCompleteViewController.h"
#import "AppealDetailViewController.h"
@interface ListOrderShowViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _currentPage;//记录当前页
}

@property (nonatomic,strong)UITableView *baseXYTableView;
@property (nonatomic,strong)NSMutableArray *tradArr;
@property (nonatomic,strong)NSMutableArray *keyArr;

@property (nonatomic,strong)MJRefreshBackGifFooter    * footer;
@property (nonatomic,strong)UILabel *backLab;

@end

@implementation ListOrderShowViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    self.tradArr = [NSMutableArray array];
    self.keyArr = [NSMutableArray array];
    
    [super viewDidLoad];
    self.title = @"交易流水";
    if (self.RecordTag== nil || [self.RecordTag isEqualToString:@""]) {
        self.RecordTag  = @"0";
    }
    [self.view addSubview:self.baseXYTableView];
//    [self getData:self.RecordTag];
//    [self createMJ:self.RecordTag];
}
-(UITableView *)baseXYTableView
{
    if (_baseXYTableView== nil) {
        
        self.baseXYTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH -64-45) style:UITableViewStyleGrouped];
        self.baseXYTableView.dataSource = self;
        self.baseXYTableView.delegate = self;
        self.baseXYTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.baseXYTableView.backgroundColor = RGB(6, 19, 51,0.24);
        [self.baseXYTableView registerClass:[OrderListTableViewCell class] forCellReuseIdentifier:@"finCell"];
        [self.baseXYTableView registerClass:[OtherOrderTableViewCell class] forCellReuseIdentifier:@"listCell"];

    }
    return  _baseXYTableView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
#pragma mark 设置尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
//    view.backgroundColor = RGB(247, 247, 247);
//    UILabel  *label = [[UILabel alloc]initWithFrame:CGRectMake(14, 0, kScreenW-28, 50)];
//    label.textColor = RGB(51, 51, 51);
//    label.font = [UIFont systemFontOfSize:14];
////    label.text =  self.keyArr[section];
////    [view addSubview:label];
//    return view;
    return [[UIView alloc]init];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc]init];
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
    //    MyCompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCompanyCell" forIndexPath:indexPath];
    
    if (indexPath.section == 2 ||indexPath.section == 3) {
        NSString * str = [NSString stringWithFormat:@"%ld%ldcell", indexPath.row,indexPath.section];
        OtherOrderTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:str];\
        if (cell == nil) {
            cell = [[OtherOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

         return cell;
    }
    else
    {
        NSString * str = [NSString stringWithFormat:@"%ld%ldcell", indexPath.row,indexPath.section];
        OrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[OrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

         return cell;
    }
  
  
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
    
        SellOrderWaitReleaseViewController *sellVC = [[SellOrderWaitReleaseViewController alloc]init];
        [self.navigationController pushViewController:sellVC animated:YES];
    }
    else if (indexPath.section==1)
    {
        SellOrderCompleteViewController *sellVC = [[SellOrderCompleteViewController alloc]init];
        [self.navigationController pushViewController:sellVC animated:YES];
    }
    else
    {
        AppealDetailViewController *appDetailVC = [[AppealDetailViewController alloc]init];
        [self.navigationController pushViewController:appDetailVC animated:YES];
    }
        
 
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 ||indexPath.section == 3) {
        return 85;

    }
    else
    {
        return 135;
    }
}
//#pragma mark - MJ
//- (void)createMJ:(NSString *)mode
//{
//
//    weakSelf(XYTradingRecordViewController)
//    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [blockSelf reloadMyData:mode];
//    }];
//    header.lastUpdatedTimeLabel.hidden = YES;
//    self.baseXYTableView.mj_header = header;
//    [self.baseXYTableView.mj_header beginRefreshing];
//
//    MJRefreshBackGifFooter * footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
//        [blockSelf loadMore:mode];
//    }];
//    self.footer = footer;
//    self.baseXYTableView.mj_footer = footer;
//    //  self.automaticallyAdjustsScrollViewInsets = NO;
//}
//-(void)reloadMyData:(NSString *)mode
//{
//    NSLog(@"重新加载数据，子类需要重写");
//    _currentPage = 1;
//    [self getData:mode];
//}
//-(void)loadMore:(NSString *)mode
//{
//    NSLog(@"加载更多，子类需要重写");
//    _currentPage++;
//    [self getData:mode];
//}
//-(void)getData:(NSString *)mode
//{
//    if (_currentPage == 1) {
//        [self.tradArr removeAllObjects];
//        [self.keyArr removeAllObjects];
//
//    }
//    NSDictionary *dic = @{
//                          @"mode":mode,
//                          @"pageIndex":[NSString stringWithFormat:@"%ld",(long)_currentPage],
//                          @"pageItemCount":@"20"
//                          };
//    weakSelf(XYTradingRecordViewController)
//    //    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [[BJNetManager shareNetManager]POST:dic withUrl:@"user/getUserFinanceList2" success:^(id response) {
//        NSLog(@"%@",response);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        if ([[NSString stringWithFormat:@"%@",[response objectForKey:@"code"]] isEqualToString:@"1"])
//        {
//            NSDictionary *dic = [response objectForKey:@"content"];
//            NSDictionary *findic =  [dic objectForKey:@"financeList"];
//            if (findic.count == 0) {
//
//            }
//            else
//            {
//                self.keyArr = [[findic allKeys] mutableCopy];
//                for (int i = 0; i < self.keyArr.count; i++) {
//                    NSMutableArray *myArr = [NSMutableArray array];
//                    for (NSDictionary *dic in [findic objectForKey:self.keyArr[i]])
//                    {
//                        XYTradingModel *model = [XYTradingModel yy_modelWithDictionary:dic];
//                        [myArr addObject:model];
//                    }
//                    [self.tradArr addObject:myArr];
//                }
//            }
//
//            [self.baseXYTableView reloadData];
//
//            if (self.tradArr.count == 0) {
//
//                [self.view addSubview:self.backLab];
//            }
//            else
//            {
//                [self.backLab removeFromSuperview];
//            }
//        }
//        else
//        {
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[response objectForKey:@"msg"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            [alert show];
//        }
//        [blockSelf.baseXYTableView.mj_header endRefreshing];
//        [blockSelf.baseXYTableView.mj_footer endRefreshing];
//    } failure:^(id response) {
//        //        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        [blockSelf.baseXYTableView.mj_header endRefreshing];
//        [blockSelf.baseXYTableView.mj_footer endRefreshing];
//
//        NSLog(@"%@",response);
//    }];
//}
-(UILabel *)backLab
{
    if (_backLab == nil)
    {
        self.backLab = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenH/2 - 25, kScreenW, 50)];
        self.backLab.text = @"暂无数据";
        self.backLab.textAlignment = NSTextAlignmentCenter;
    }
    return _backLab;
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
