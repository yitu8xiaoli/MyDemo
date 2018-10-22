//
//  SystemSetViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "SystemSetViewController.h"
#import "SystemSetTableViewCell.h"
#import "LanguageViewController.h"
#import "DenominatedViewController.h"
#import "ZZCircleProgress.h"
#import <SDImageCache.h>
@interface SystemSetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *baseTbleView;   /*列表tab*/
@property (nonatomic,strong)ZZCircleProgress *circle;//圆形
@property (nonatomic,strong)NSString *moneyStr;//
@property (nonatomic,strong)NSString *stylrStr;//
@property (nonatomic,strong)NSString *langStr;//

@end

@implementation SystemSetViewController

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
    self.title = @"系统设置";
    //设置初始值
    self.moneyStr = @"人民币(CNY)";
    self.stylrStr = @"始终普通行情";
    self.stylrStr = @"简体中文";
}
#pragma mark 头部UI

-(UITableView *)baseTbleView
{
    if (_baseTbleView== nil) {
        self.baseTbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH) style:UITableViewStylePlain];
        self.baseTbleView.backgroundColor = RGB(6, 19, 51,0.24);
        self.baseTbleView.dataSource = self;
        self.baseTbleView.delegate = self;
        [self.baseTbleView registerClass:[SystemSetTableViewCell class] forCellReuseIdentifier:@"finCell"];
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
    return 4;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ldcell", (long)indexPath.row,(long)indexPath.section];
    SystemSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[SystemSetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.arrowImage.image = [UIImage imageNamed:@"next"];
    
    if (indexPath.row == 0) {
        cell.titleLab.text = @"语言选择";
        cell.titleShowLab.text = self.langStr;

    }
    else if (indexPath.row == 1)
    {
        cell.titleLab.text = @"行情刷新频率";
        cell.titleShowLab.text = self.stylrStr;
        
    }
    else if (indexPath.row == 2)
    {
        cell.titleLab.text = @"计价方式";
        cell.titleShowLab.text = self.moneyStr;
    }
    else
    {
        float tmpSize = [[SDImageCache sharedImageCache] getSize];
        NSString *clearCacheName =  [NSString stringWithFormat:@"%.1fM",tmpSize/1024/1024];
        cell.titleLab.text = @"清除缓存";
        cell.titleShowLab.text = clearCacheName;
        cell.lineView.hidden = YES;
        cell.arrowImage.hidden = YES;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        LanguageViewController *langVC = [[LanguageViewController alloc]init];
        [langVC returnLang:^(NSString *str) {
            self.langStr = str;
            [self.baseTbleView reloadData];
        }];
        langVC.langTag = self.langStr;
        [self.navigationController pushViewController:langVC animated:YES];
    }
    else if (indexPath.row == 1)
    {
        [self creatActionSheet];
    }
    else if (indexPath.row == 2)
    {
        DenominatedViewController *denoVC = [[DenominatedViewController alloc]init];
        [denoVC returnMoney:^(NSString *str) {
            self.moneyStr = str;
            [self.baseTbleView reloadData];

        }];
        denoVC.moneyTag = self.moneyStr;
        [self.navigationController pushViewController:denoVC animated:YES];
    }
    else if (indexPath.row == 3)
    {
        [self.view addSubview:self.circle];
        
        float tmpSize = [[SDImageCache sharedImageCache] getSize];
        NSString *clearCacheName =  [NSString stringWithFormat:@"%.1fM",tmpSize/1024/1024];
        self.circle.tagLab.text =[NSString stringWithFormat:@"%@/%@",@"0.0M",clearCacheName];
        [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
            NSLog(@"清除成功");
//            [self.circle removeFromSuperview];
        }];
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
#pragma mark 初始化
-(ZZCircleProgress *)circle
{
    if (_circle == nil) {
        self.circle = [[ZZCircleProgress alloc]initWithFrame:CGRectMake(kScreenW/2 -102.5, kScreenH/2 -102.5, 205, 205) pathBackColor:nil pathFillColor:RGB(4, 197, 252,1) startAngle:0.25 strokeWidth:2];
        self.circle.startAngle = 90; //
        self.circle.reduceAngle = 0;
        self.circle.showPoint = YES;
        self.circle.showProgressText = YES;
        self.circle.pointImage = [UIImage imageNamed:@"my_icon_circle"];
        //self.circle.duration = 3;
        self.circle.animationModel = CircleIncreaseSameTime;
        //        self.circle.backgroundColor = [UIColor redColor];
        self.circle.progress = 0.5;
        self.circle.pathBackColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.1];
    }
    return _circle;
}
-(void)creatActionSheet {
    /*
     先创建UIAlertController，preferredStyle：选择UIAlertControllerStyleActionSheet，这个就是相当于创建8.0版本之前的UIActionSheet；
     
     typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
     UIAlertControllerStyleActionSheet = 0,
     UIAlertControllerStyleAlert
     } NS_ENUM_AVAILABLE_IOS(8_0);
     */
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    /*
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,         取消按钮
     UIAlertActionStyleDestructive     破坏性按钮，比如：“删除”，字体颜色是红色的
     } NS_ENUM_AVAILABLE_IOS(8_0);
     
     */
    // 创建action，这里action1只是方便编写，以后再编程的过程中还是以命名规范为主
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"始终普通行情" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       ///
        self.stylrStr = @"始终普通行情";
         [self.baseTbleView reloadData];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"始终实时行情" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.stylrStr = @"始终实时行情";
         [self.baseTbleView reloadData];
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"选择了B类" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alertView show];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"仅在WiFi下实时行情" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.stylrStr = @"仅在WiFi下实时行情";
        [self.baseTbleView reloadData];
    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [action1 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action2 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action3 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action4 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    //把action添加到actionSheet里
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    [actionSheet addAction:action4];

   
    //相当于之前的[actionSheet show];
    [self presentViewController:actionSheet animated:YES completion:nil];
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
