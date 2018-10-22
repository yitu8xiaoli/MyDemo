//
//  ModifyNameViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ModifyNameViewController.h"

@interface ModifyNameViewController ()
@property (nonatomic,strong)UITextField *nameText;
@end

@implementation ModifyNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化
    self.nameText = [[UITextField alloc]initWithFrame:CGRectMake(0, 10, kScreenW, 49)];
    self.nameText.backgroundColor = kCellbackColor;
    UIView *blankView = [[UIView alloc]initWithFrame:CGRectMake(_nameText.frame.origin.x,_nameText.frame.origin.y,15.0,_nameText.frame.size.height)];
    _nameText.leftView = blankView;
    _nameText.leftViewMode =UITextFieldViewModeAlways;
    _nameText.textColor = [UIColor whiteColor];
    _nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    UIButton *clean = [self.nameText valueForKey:@"_clearButton"];
    clean.imageView.backgroundColor = [UIColor whiteColor];//这里需要更换image
    
  
    [self.view addSubview:self.nameText];
   
    
    //重写右侧按钮
    self.navigationItem.rightBarButtonItem = [self ls_changeRightBarItemWithImage:nil target:self title:@"完成" selector:@selector(rightAction)];

}
#pragma mark 修改完成事件
-(void)rightAction
{
    self.returnText(self.nameText.text);
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma block方法
-(void)returnText:(returnNameText)block
{
    self.returnText = block;
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
