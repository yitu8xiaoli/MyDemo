//
//  NameAuthenticationView.m
//  ProjectFramework
//
//  Created by apple on 2018/9/28.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "NameAuthenticationView.h"

@implementation NameAuthenticationView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backScrollview];
    [self.backScrollview addSubview:self.promptLab];
    [self.backScrollview addSubview:self.headView];
    [self.headView addSubview:self.nameLab];
    [self.headView addSubview:self.nameText];
    [self.headView addSubview:self.lineView];
    [self.headView addSubview:self.idLab];
    [self.headView addSubview:self.idText];
    [self.backScrollview addSubview:self.finshBtn];
    
//    [self.backScrollview addSubview:self.idPromptLab];
//    [self.backScrollview addSubview:self.positiveImage];
//    [self.backScrollview addSubview:self.idReversePromptLab];
//    [self.backScrollview addSubview:self.reverseImage];
}

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
- (UILabel *)promptLab
{
    if (!_promptLab) {
        self.promptLab = [[UILabel alloc]initWithFrame:CGRectMake(15,0, kScreenW - 30, 32)];
        self.promptLab.font = [UIFont systemFontOfSize:12];
        self.promptLab.textAlignment = NSTextAlignmentLeft;
        self.promptLab.text = @"一经通过无法修改,清按实填写";
        self.promptLab.textColor = RGB(255, 255, 255,0.35);
    }
    return _promptLab;
}
-(UIView *)headView
{
    if (_headView == nil) {
        self.headView =[[UIView alloc]initWithFrame:CGRectMake(0, maxY(self.promptLab), kScreenW, 100)];
        self.headView.backgroundColor = RGB(6, 19, 51, 0.48);
        
    }
    return _headView;
}
- (UILabel *)nameLab
{
    if (_nameLab ==nil) {
        self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 14, 66, 23)];
        self.nameLab.font = [UIFont systemFontOfSize:16];
        self.nameLab.textAlignment = NSTextAlignmentLeft;
        self.nameLab.text = @"真实姓名";
        self.nameLab.textColor = RGB(255, 255, 255,0.87);
        
    }
    return _nameLab;
}
-(UITextField *)nameText
{
    if (_nameText == nil) {
        self.nameText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.nameLab)+20, 14, kScreenW-116, 23)];
        self.nameText.placeholder = @"请输入你的真实姓名";
        [self.nameText setValue:RGB(255, 255, 255, 0.56) forKeyPath:@"_placeholderLabel.textColor"];
        self.nameText.font = [UIFont systemFontOfSize:16];
        self.nameText.textColor = [UIColor whiteColor];
    }
    return _nameText;
}
-(UIView *)lineView
{
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_nameLab)+12, kScreenW-15, 0.5)];
        self.lineView.backgroundColor = RGB(255, 255, 255,0.5);
        self.lineView.alpha = 0.5;
    }
    return _lineView;
}
- (UILabel *)idLab
{
    if (_idLab ==nil) {
        self.idLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(_lineView)+14, 66, 23)];
        self.idLab.font = [UIFont systemFontOfSize:16];
        self.idLab.textAlignment = NSTextAlignmentLeft;
        self.idLab.text = @"身份证号";
        self.idLab.textColor = RGB(255, 255, 255,0.87);
    }
    return _idLab;
}
-(UITextField *)idText
{
    if (_idText == nil) {
        self.idText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.idLab)+20, maxY(_lineView)+14, kScreenW-116, 23)];
        self.idText.placeholder = @"请输入你的身份证号码";
        [self.idText setValue:RGB(255, 255, 255, 0.56) forKeyPath:@"_placeholderLabel.textColor"];
        self.idText.font = [UIFont systemFontOfSize:16];
        self.idText.textColor = RGB(255, 255, 255,0.87);
    }
    return _idText;
}
-(UIButton *)finshBtn
{
    if (_finshBtn == nil) {
        _finshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _finshBtn.frame = CGRectMake(15, maxY(self.headView)+31, kScreenW-30, 49);
        [_finshBtn setTitle:@"完成" forState:UIControlStateNormal];
        _finshBtn.backgroundColor = RGB(179, 186, 201, 1);

    }
    return _finshBtn;
}

- (UILabel *)idPromptLab
{
    if (!_idPromptLab) {
        self.idPromptLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.promptLab)+13, kScreenW - 30, 20)];
        self.idPromptLab.font = [UIFont systemFontOfSize:14];
        self.idPromptLab.textAlignment = NSTextAlignmentCenter;
        self.idPromptLab.text = @"身份证正面照";
        self.idPromptLab.textColor = RGB(255, 255, 255,1);
    }
    return _idPromptLab;
}
- (UIImageView *)positiveImage
{
    if (_positiveImage ==nil) {
        self.positiveImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.idPromptLab)+12, kScreenW -30, 220)];
        self.positiveImage.contentMode = UIViewContentModeScaleAspectFit;
        self.positiveImage.backgroundColor = [UIColor redColor];
        self.positiveImage.clipsToBounds = YES;
    }
    return _positiveImage;
}
- (UILabel *)idReversePromptLab
{
    if (_idReversePromptLab == nil) {
        self.idReversePromptLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.positiveImage)+15, kScreenW - 30, 20)];
        self.idReversePromptLab.font = [UIFont systemFontOfSize:14];
        self.idReversePromptLab.textAlignment = NSTextAlignmentCenter;
        self.idReversePromptLab.text = @"身份证正面照";
        self.idReversePromptLab.textColor = RGB(255, 255, 255,1);
    }
    return _idReversePromptLab;
}
- (UIImageView *)reverseImage
{
    if (_reverseImage ==nil) {
        self.reverseImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.idReversePromptLab)+12, kScreenW -30, 220)];
        self.reverseImage.contentMode = UIViewContentModeScaleAspectFit;
        self.reverseImage.backgroundColor = [UIColor redColor];
        self.reverseImage.clipsToBounds = YES;
    }
    return _reverseImage;
}



@end
