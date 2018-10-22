//
//  ModifySignatureViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ModifySignatureViewController.h"

@interface ModifySignatureViewController ()<UITextViewDelegate>
@property (nonatomic,strong)UITextView *adviceTextView;
@property (nonatomic,strong)UILabel *placeholderLab;//占位
@property (nonatomic,strong)UILabel  *stirngLenghLabel;//数字显示
@property (nonatomic,strong)NSString   *signStr;//签名字符串


@end

@implementation ModifySignatureViewController
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
    self.title = @"修改个性签名";
    [self.view addSubview:self.adviceTextView];
    [self.adviceTextView addSubview:self.placeholderLab];
    [self.adviceTextView addSubview:self.stirngLenghLabel];

    self.adviceTextView.delegate = self;
    self.navigationItem.rightBarButtonItem = [self ls_changeRightBarItemWithImage:nil target:self title:@"完成" selector:@selector(rightAction)];
}
#pragma mark 完成事件
-(void)rightAction
{
    //代理回传
    __weak ModifySignatureViewController *mySelf = self;
    self.signBlock(mySelf.signStr);
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)returnSign:(returnSignBlock)signBlock
{
    self.signBlock = signBlock;
}

#pragma mark textview 代理
- (void)textViewDidChange:(UITextView *)textView
{
    self.placeholderLab.hidden = YES;
    self.stirngLenghLabel.text = [NSString stringWithFormat:@"%lu/30", (unsigned long)textView.text.length];
    //字数限制操作
    if (textView.text.length >= 30)
    {
        self.stirngLenghLabel.text = @"30/30";
        textView.text = [textView.text substringToIndex:30];
    }
    self.signStr = textView.text;
}
-(UITextView *)adviceTextView
{
    if (_adviceTextView == nil) {
        self.adviceTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, kScreenW, 75)];
        self.adviceTextView.font = [UIFont systemFontOfSize:14];
        self.adviceTextView.textContainerInset = UIEdgeInsetsMake(14, 15, 0, 15);//设置页边距
        self.adviceTextView.backgroundColor = kCellbackColor;
        self.adviceTextView.textColor = [UIColor whiteColor];
    }
    return _adviceTextView;
}

- (UILabel *)placeholderLab
{
    if (_placeholderLab ==nil) {
        self.placeholderLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 14, kScreenW-30, 20)];
        self.placeholderLab.font = [UIFont systemFontOfSize:14];
        self.placeholderLab.textAlignment = NSTextAlignmentLeft;
        self.placeholderLab.text = @"请设置个性签名";
        self.placeholderLab.textColor = [UIColor whiteColor];
    }
    return _placeholderLab;
}
- (UILabel *)stirngLenghLabel
{
    if (_stirngLenghLabel ==nil) {
        self.stirngLenghLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2, 47, kScreenW/2-15, 17)];
        self.stirngLenghLabel.font = [UIFont systemFontOfSize:12];
        self.stirngLenghLabel.textAlignment = NSTextAlignmentRight;
        self.stirngLenghLabel.text = @"5/30";
        self.stirngLenghLabel.textColor = [UIColor whiteColor];
        //        self.stirngLenghLabel.backgroundColor = [UIColor redColor];
        
    }
    return _stirngLenghLabel;
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
