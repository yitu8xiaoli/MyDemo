//
//  MyCodeViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "MyCodeViewController.h"

@interface MyCodeViewController ()
@property (nonatomic,strong)UIImageView *headImage;

@end

@implementation MyCodeViewController

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
    
    
    self.title = @"我的二维码";
    [self.view addSubview:self.headImage];
    
}
-(UIImageView *)headImage
{
    if (_headImage == nil) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, kScreenW-40,  (kScreenW-20)*1.18)];
        self.headImage.backgroundColor = [UIColor redColor];
    }
    return _headImage;
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
