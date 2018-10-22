//
//  BinddingEmallViewController.m
//  ProjectFramework
//
//  Created by apple on 2018/9/29.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "BinddingEmallViewController.h"

@interface BinddingEmallViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *emailCardText;
@property (weak, nonatomic) IBOutlet UITextField *phoneCardText;
@property (weak, nonatomic) IBOutlet UIView *headbackview;

@end

@implementation BinddingEmallViewController
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
    self.title = @"绑定邮箱";

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.headbackview.backgroundColor = RGB(6, 19, 51, 0.48);
    [self.emailText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.emailCardText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.phoneCardText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];

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
