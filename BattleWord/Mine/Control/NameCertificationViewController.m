//
//  NameCertificationViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/11.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "NameCertificationViewController.h"

@interface NameCertificationViewController ()

@end

@implementation NameCertificationViewController
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

    self.title = @"中级认证";
    self.navigationItem.rightBarButtonItem = [self ls_changeRightBarItemWithImage:nil target:self title:@"完成" selector:@selector(rightAction)];

    [self setUI];
}
#pragma mark 完成事件
-(void)rightAction
{
    
}
#pragma mark 初始化UI
-(void)setUI
{
    [self.view addSubview:self.positiveImage];
    [self.view addSubview:self.idPromptLab];
    [self.view addSubview:self.idPrompt2Lab];
    [self.view addSubview:self.reverseImage];
    [self.view addSubview:self.idReversePromptLab];
    [self.view addSubview:self.idReversePrompt2Lab];


}


#pragma Mark 控件初始化
- (UIImageView *)positiveImage
{
    if (_positiveImage ==nil) {
        self.positiveImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, kScreenW -30, 220)];
        self.positiveImage.contentMode = UIViewContentModeScaleAspectFit;
//        self.positiveImage.backgroundColor = [UIColor redColor];
        self.positiveImage.image = [UIImage imageNamed:@"pic_拍摄身份证正面"];
        self.positiveImage.clipsToBounds = YES;
    }
    return _positiveImage;
}
- (UILabel *)idPromptLab
{
    if (!_idPromptLab) {
        self.idPromptLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.positiveImage)+8, kScreenW - 30, 16)];
        self.idPromptLab.font = [UIFont systemFontOfSize:12];
        self.idPromptLab.textAlignment = NSTextAlignmentCenter;
        self.idPromptLab.text = @"请上传身份证正面照片";
        self.idPromptLab.textColor = RGB(255, 255, 255,0.87);
    }
    return _idPromptLab;
}
- (UILabel *)idPrompt2Lab
{
    if (!_idPrompt2Lab) {
        self.idPrompt2Lab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.idPromptLab)+2, kScreenW - 30, 16)];
        self.idPrompt2Lab.font = [UIFont systemFontOfSize:12];
        self.idPrompt2Lab.textAlignment = NSTextAlignmentCenter;
        self.idPrompt2Lab.text = @"(带有国徽及有效日期的一面)";
        self.idPrompt2Lab.textColor = RGB(255, 255, 255,0.87);
    }
    return _idPrompt2Lab;
}
- (UIImageView *)reverseImage
{
    if (_reverseImage ==nil) {
        self.reverseImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.idPrompt2Lab)+26, kScreenW -30, 220)];
        self.reverseImage.contentMode = UIViewContentModeScaleAspectFit;
        self.reverseImage.image = [UIImage imageNamed:@"pic_拍摄身份证反面"];
        self.reverseImage.clipsToBounds = YES;
    }
    return _reverseImage;
}
- (UILabel *)idReversePromptLab
{
    if (_idReversePromptLab == nil) {
        self.idReversePromptLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.reverseImage)+8, kScreenW - 30, 20)];
        self.idReversePromptLab.font = [UIFont systemFontOfSize:12];
        self.idReversePromptLab.textAlignment = NSTextAlignmentCenter;
        self.idReversePromptLab.text = @"身份证正面照";
        self.idReversePromptLab.textColor = RGB(255, 255, 255,0.87);
    }
    return _idReversePromptLab;
}

- (UILabel *)idReversePrompt2Lab
{
    if (_idReversePrompt2Lab == nil) {
        self.idReversePrompt2Lab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.idReversePromptLab)+2, kScreenW - 30, 20)];
        self.idReversePrompt2Lab.font = [UIFont systemFontOfSize:12];
        self.idReversePrompt2Lab.textAlignment = NSTextAlignmentCenter;
        self.idReversePrompt2Lab.text = @"(带有个人头像照片的一面)";
        self.idReversePrompt2Lab.textColor = RGB(255, 255, 255,0.87);
    }
    return _idReversePrompt2Lab;
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
