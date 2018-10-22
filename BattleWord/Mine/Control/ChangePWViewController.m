//
//  ChangePWViewController.m
//  ProjectFramework
//
//  Created by apple on 2018/9/29.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ChangePWViewController.h"

@interface ChangePWViewController ()

@property (weak, nonatomic) IBOutlet UITextField *oldText;
@property (weak, nonatomic) IBOutlet UITextField *nowText;
@property (weak, nonatomic) IBOutlet UITextField *nowAgainText;

@end
@implementation ChangePWViewController

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
    self.title = @"修改登录密码";

    self.view.backgroundColor = [UIColor whiteColor];
    [self.oldText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.nowText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.nowAgainText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];

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
