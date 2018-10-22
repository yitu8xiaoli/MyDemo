//
//  AddBankCardViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AddBankCardViewController.h"

@interface AddBankCardViewController ()
@property (weak, nonatomic) IBOutlet UIView *backVIew;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *cardText;
@property (weak, nonatomic) IBOutlet UITextField *bankcardText;
@property (weak, nonatomic) IBOutlet UITextField *bankZhiCardText;

@end

@implementation AddBankCardViewController
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

    self.backVIew.backgroundColor = kCellbackColor;
    [self.nameText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.cardText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.bankcardText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.bankZhiCardText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];

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
