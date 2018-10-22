//
//  ChangeMoneyPWViewController.m
//  ProjectFramework
//
//  Created by apple on 2018/9/29.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ChangeMoneyPWViewController.h"
#import "UIViewController+LSExtension.h"
#import "ForgetViewController.h"
#import "NewPwViewController.h"
@interface ChangeMoneyPWViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPwText;
@property (weak, nonatomic) IBOutlet UITextField *nowPwText;
@property (weak, nonatomic) IBOutlet UITextField *nowAgainPwText;
@end

@implementation ChangeMoneyPWViewController

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
    self.title = @"修改法币密码";

    self.view.backgroundColor = [UIColor whiteColor];
    [self.oldPwText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.nowPwText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.nowAgainPwText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    
    self.navigationItem.rightBarButtonItem = [self ls_changeRightBarItemWithImage:nil target:self title:@"忘记密码" selector:@selector(rightBarction)];

}
-(void)rightBarction
{
    ForgetViewController *forgetVC = [[ForgetViewController alloc]init];
    [self.navigationController pushViewController:forgetVC animated:YES];
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
