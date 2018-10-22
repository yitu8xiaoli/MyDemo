//
//  MyOrderListViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "MyOrderListViewController.h"
#import "ZJSegmentStyle.h"
#import "ZJScrollPageView.h"
#import "ListOrderShowViewController.h"
@interface MyOrderListViewController ()<ZJScrollPageViewDelegate>

@property(strong, nonatomic)NSArray<NSString *> *titles;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;


@end

@implementation MyOrderListViewController
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
    [super viewDidLoad];
    self.title = @"我的订单";
    [self setUI];
}

-(void)setUI
{
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    //显示滚动条
    style.showLine = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    style.scrollLineColor = RGB(4, 197, 252, 1);
    style.normalTitleColor = kWordLightColor;
    style.selectedTitleColor = RGB(4, 197, 252, 1);
    style.coverBackgroundColor = RGB(10, 31, 55, 1);
    self.titles = @[@"全部",
                    @"未付款",
                    @"已付款",
                    @"申诉中",
                    @"已取消",
                    @"已完成",
                    ];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    scrollPageView.segmentView.backgroundColor = RGB(10, 31, 55, 1);
    [self.view addSubview:scrollPageView];
    
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}


- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
        if (index==0) {
            ListOrderShowViewController *xyVC = [[ListOrderShowViewController alloc]init];
            xyVC.RecordTag = @"0";
            childVc = xyVC;
            
        }
        else if (index==1) {
            ListOrderShowViewController *xyVC = [[ListOrderShowViewController alloc]init];
            xyVC.RecordTag = @"3";
            childVc = xyVC;
            
        }
        else if (index==2) {
            ListOrderShowViewController *xyVC = [[ListOrderShowViewController alloc]init];
            xyVC.RecordTag = @"4";
            childVc = xyVC;
            
        }
        else if (index==3) {
            ListOrderShowViewController *xyVC = [[ListOrderShowViewController alloc]init];
            xyVC.RecordTag = @"1";
            childVc = xyVC;
            
        }
        else if (index==4) {
            ListOrderShowViewController *xyVC = [[ListOrderShowViewController alloc]init];
            xyVC.RecordTag = @"2";
            childVc = xyVC;
            
        }
        else
        {
            ListOrderShowViewController *xyVC = [[ListOrderShowViewController alloc]init];
            xyVC.RecordTag = @"5";
            childVc = xyVC;
        }
        
    }
    
    
    if (index%2==0) {
        childVc.view.backgroundColor = [UIColor blueColor];
    } else {
        childVc.view.backgroundColor = [UIColor greenColor];
        
    }
    
    NSLog(@"%ld-----%@",(long)index, childVc);
    
    return childVc;
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
