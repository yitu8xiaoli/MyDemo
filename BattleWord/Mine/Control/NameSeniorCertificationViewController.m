//
//  NameSeniorCertificationViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/11.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "NameSeniorCertificationViewController.h"

@interface NameSeniorCertificationViewController ()

@end

@implementation NameSeniorCertificationViewController
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


    self.title = @"高级认证";
    [self setUI];
}
#pragma mark 创建view
-(void)setUI
{
    [self.view addSubview:self.backScrollview];
    [self.backScrollview addSubview:self.headImage];
    [self.backScrollview addSubview:self.titleImage];
    [self.backScrollview addSubview:self.beginBtn];
    [self.backScrollview addSubview:self.exitBtn];

}
#pragma mark 初始化
-(UIScrollView *)backScrollview
{
    if (_backScrollview == nil)
    {
        self.backScrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.backScrollview.backgroundColor = kMainbackColor;
        [self.backScrollview  setContentSize:CGSizeMake(kScreenW, kScreenH+20+50)];
    }
    return _backScrollview;
}
-(UIImageView *)headImage
{
    if (_headImage == nil) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 18, kScreenW, 320)];
        self.headImage.image = [UIImage imageNamed:@"pic_正确示范"];
    }
    return _headImage;
}
-(UIImageView *)titleImage
{
    if (_titleImage == nil) {
        self.titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_headImage)+22, kScreenW-30, 80)];
        self.titleImage.image = [UIImage imageNamed:@"titImage"];
    }
    return _titleImage;
}

-(UIButton *)beginBtn
{
    if (_beginBtn == nil) {
        _beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _beginBtn.frame = CGRectMake(15, maxY(self.titleImage)+50, kScreenW-30, 49);
        [_beginBtn setTitle:@"开始验证" forState:UIControlStateNormal];
        _beginBtn.backgroundColor = RGB(4, 197, 252, 1);
        
    }
    return _beginBtn;
}
-(UIButton *)exitBtn
{
    if (_exitBtn == nil) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _exitBtn.frame = CGRectMake(15, maxY(self.beginBtn)+15, kScreenW-30, 49);
        [_exitBtn setTitle:@"退出验证" forState:UIControlStateNormal];
        _exitBtn.backgroundColor = RGB(197, 186, 201, 1);
        
    }
    return _exitBtn;
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
