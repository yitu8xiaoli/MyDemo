//
//  ExchangeViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/11.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ExchangeViewController.h"
#import "FiatTradingViewController.h"
@interface ExchangeViewController ()

@end

@implementation ExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeCustom];
    bu.frame = CGRectMake(100, 100, 80, 30);
    [bu setTitle:@"法币交易" forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(BuAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bu];
}
-(void)BuAction
{
    FiatTradingViewController *fiaVC = [[FiatTradingViewController alloc]init];
    [self.navigationController pushViewController:fiaVC animated:YES];
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
