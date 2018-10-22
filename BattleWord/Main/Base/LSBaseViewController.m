//
//  LSBaseViewController.m
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSBaseViewController.h"

@interface LSBaseViewController ()

@end

@implementation LSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //设置背景图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    imageView.image=[UIImage imageNamed:@"backImage"];
    [self.view insertSubview:imageView atIndex:0];

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
