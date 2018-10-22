//
//  AddAccountView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/9/30.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AddAccountView.h"

@implementation AddAccountView

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
    self.backgroundColor = RGB(6, 19, 51,0.24);
    [self addSubview:self.headView];
    [self.headView addSubview:self.nameLab];
    [self.headView addSubview:self.nameText];
    [self.headView addSubview:self.lineView];
    [self.headView addSubview:self.idLab];
    [self.headView addSubview:self.idText];
    [self.headView addSubview:self.promptLab];
    [self.headView addSubview:self.addImage];
    [self.headView addSubview:self.nextBtn];

    
}
-(UIView *)headView
{
    if (_headView == nil) {
        self.headView =[[UIView alloc]initWithFrame:CGRectMake(0, 10, kScreenW, 100)];
        self.headView.backgroundColor = RGB(6, 19, 51, 0.48);
        
    }
    return _headView;
}
- (UILabel *)nameLab
{
    if (_nameLab ==nil) {
        self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 14, 62, 23)];
        self.nameLab.font = [UIFont systemFontOfSize:16];
        self.nameLab.textAlignment = NSTextAlignmentLeft;
        self.nameLab.text = @"姓名";
        self.nameLab.textColor = RGB(255, 255, 255,1);
        
    }
    return _nameLab;
}
-(UITextField *)nameText
{
    if (_nameText == nil) {
        self.nameText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.nameLab)+38, 14, kScreenW-130, 23)];
        self.nameText.placeholder = @"请输入你的真实姓名";
        [self.nameText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
        self.nameText.font = [UIFont systemFontOfSize:16];
        self.nameText.textColor = [UIColor whiteColor];
    }
    return _nameText;
}
-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, maxY(_nameLab)+13, kScreenW, 0.5)];
        self.lineView.backgroundColor = RGB(255, 255, 255,0.5);
        self.lineView.alpha = 0.5;
    }
    return _lineView;
}
- (UILabel *)idLab
{
    if (_idLab ==nil) {
        self.idLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(_lineView)+14, 62, 23)];
        self.idLab.font = [UIFont systemFontOfSize:16];
        self.idLab.textAlignment = NSTextAlignmentLeft;
        self.idLab.text = @"账号";
        self.idLab.textColor = RGB(255, 255, 255,1);
    }
    return _idLab;
}
-(UITextField *)idText
{
    if (_idText == nil) {
        self.idText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.idLab)+38, maxY(_lineView)+14, kScreenW-130, 23)];
        self.idText.placeholder = @"请输入你的账号";
        [self.idText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];
        self.idText.font = [UIFont systemFontOfSize:16];
        self.idText.textColor = [UIColor whiteColor];
    }
    return _idText;
}
- (UILabel *)promptLab
{
    if (!_promptLab) {
        self.promptLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(self.headView)+11, kScreenW - 30, 20)];
        self.promptLab.font = [UIFont systemFontOfSize:14];
        self.promptLab.textAlignment = NSTextAlignmentLeft;
        self.promptLab.text = @"添加收款二维码(选填)";
        self.promptLab.textColor = RGB(255, 255, 255,0.87);
    }
    return _promptLab;
}

- (UIImageView *)addImage
{
    if (_addImage ==nil) {
        self.addImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.promptLab)+15, 70, 70)];
        self.addImage.contentMode = UIViewContentModeScaleAspectFit;
        self.addImage.image = [UIImage imageNamed:@"添加照片"];
        self.addImage.clipsToBounds = YES;
    }
    return _addImage;
}
- (UIButton *)nextBtn
{
    if (_nextBtn ==nil) {
        self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBtn.frame = CGRectMake(15, maxY(_addImage)+30, kScreenW - 30, 45);
        [self.nextBtn setTitle:@"完成" forState:UIControlStateNormal];
        [self.nextBtn setBackgroundColor:RGB(179, 186, 201, 1)];
        self.nextBtn.layer.cornerRadius = 2;
    }
    return _nextBtn;
}


@end
