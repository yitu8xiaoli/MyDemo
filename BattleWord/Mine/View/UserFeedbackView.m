//
//  UserFeedbackView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/8.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "UserFeedbackView.h"

@implementation UserFeedbackView
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
//    self.backgroundColor = RGB(237, 235, 242, 0.35);
    [self addSubview:self.backScrollview];
    [self.backScrollview addSubview:self.adviceTextView];
    [self.adviceTextView addSubview:self.placeholderLab];
    [self.adviceTextView addSubview:self.stirngLenghLabel];
    [self.backScrollview addSubview:self.imageBackView];
    [self.imageBackView addSubview:self.addLabel];
    [self.imageBackView addSubview:self.addImage1];
    [self.imageBackView addSubview:self.addImage2];
    [self.imageBackView addSubview:self.addImage3];
    [self.backScrollview addSubview:self.contactTextView];
    [self.contactTextView addSubview:self.placeholderContactLab];
    [self.backScrollview addSubview:self.promptImage];
    [self.backScrollview addSubview:self.promptLabel];
    [self.backScrollview addSubview:self.promptShowLabel];
    [self.backScrollview addSubview:self.nextBtn];



}
-(UIScrollView *)backScrollview
{
    if (_backScrollview == nil)
    {
        self.backScrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.backScrollview.backgroundColor = RGB(237, 235, 242, 0.7);
        [self.backScrollview  setContentSize:CGSizeMake(kScreenW, kScreenH+20+50)];
    }
    return _backScrollview;
}

-(UITextView *)adviceTextView
{
    if (_adviceTextView == nil) {
        self.adviceTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, kScreenW, 250)];
        self.adviceTextView.font = [UIFont systemFontOfSize:14];
        self.adviceTextView.textContainerInset = UIEdgeInsetsMake(11, 15, 0, 15);//设置页边距
    }
    return _adviceTextView;
}

- (UILabel *)placeholderLab
{
    if (_placeholderLab ==nil) {
        self.placeholderLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, kScreenW-30, 20)];
        self.placeholderLab.font = [UIFont systemFontOfSize:14];
        self.placeholderLab.textAlignment = NSTextAlignmentLeft;
        self.placeholderLab.text = @"请输入你的建议,你的支持是我们前行的动力!";
        self.placeholderLab.textColor = RGB(10, 31, 55,0.56);
    }
    return _placeholderLab;
}
- (UILabel *)stirngLenghLabel
{
    if (_stirngLenghLabel ==nil) {
        self.stirngLenghLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2, 223, kScreenW/2-15, 17)];
        self.stirngLenghLabel.font = [UIFont systemFontOfSize:12];
        self.stirngLenghLabel.textAlignment = NSTextAlignmentRight;
        self.stirngLenghLabel.text = @"0/1000";
        self.stirngLenghLabel.textColor = RGB(10, 31, 55,0.56);
//        self.stirngLenghLabel.backgroundColor = [UIColor redColor];
        
    }
    return _stirngLenghLabel;
}
-(UIView *)imageBackView
{
    if (_imageBackView == nil) {
        self.imageBackView =[[UIView alloc]initWithFrame:CGRectMake(0, maxY(self.adviceTextView)+10, kScreenW, 117)];
        self.imageBackView.backgroundColor = [UIColor whiteColor];
        
    }
    return _imageBackView;
}
- (UILabel *)addLabel
{
    if (_addLabel ==nil) {
        self.addLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, kScreenW - 30, 20)];
        self.addLabel.font = [UIFont systemFontOfSize:14];
        self.addLabel.textAlignment = NSTextAlignmentLeft;
        self.addLabel.text = @"添加图片(最多添加3张,可不添加)";
        self.addLabel.textColor = RGB(10, 31, 55,0.56);
    }
    return _addLabel;
}

-(UIImageView *)addImage1
{
    if (_addImage1 == nil) {
        _addImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, maxY(_addLabel)+7, 70, 70)];
        _addImage1.image = [UIImage imageNamed:@"添加照片"];
    }
    return _addImage1;
}

-(UIImageView *)addImage2
{
    if (_addImage2 == nil) {
        _addImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(maxX(_addImage1)+10, maxY(_addLabel)+7, 70, 70)];
        _addImage2.image = [UIImage imageNamed:@"添加照片"];
        _addImage2.hidden = YES;

    }
    return _addImage2;
}
-(UIImageView *)addImage3
{
    if (_addImage3 == nil) {
        _addImage3 = [[UIImageView alloc] initWithFrame:CGRectMake(maxX(_addImage2)+10, maxY(_addLabel)+7, 70, 70)];
        _addImage3.image = [UIImage imageNamed:@"添加照片"];
        _addImage3.hidden = YES;
    }
    return _addImage3;
}
-(UITextView *)contactTextView
{
    if (_contactTextView == nil) {
        self.contactTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, maxY(self.imageBackView)+10, kScreenW, 60)];
        self.contactTextView.font = [UIFont systemFontOfSize:14];
        self.contactTextView.textContainerInset = UIEdgeInsetsMake(11, 15, 0, 15);//设置页边距
    }
    return _contactTextView;
}
- (UILabel *)placeholderContactLab
{
    if (_placeholderContactLab ==nil) {
        self.placeholderContactLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, kScreenW-30, 20)];
        self.placeholderContactLab.font = [UIFont systemFontOfSize:14];
        self.placeholderContactLab.textAlignment = NSTextAlignmentLeft;
        self.placeholderContactLab.text = @"留下你的联系方式,手机号,QQ,邮箱均可~";
        self.placeholderContactLab.textColor = RGB(10, 31, 55,0.56);
    }
    return _placeholderContactLab;
}
-(UIImageView *)promptImage
{
    if (_promptImage == nil) {
        _promptImage = [[UIImageView alloc] initWithFrame:CGRectMake(16, maxY(_contactTextView)+16, 14, 14)];
        _promptImage.image = [UIImage imageNamed:@"礼物"];
    }
    return _promptImage;
}
- (UILabel *)promptLabel
{
    if (_promptLabel ==nil) {
        self.promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(maxX(self.promptImage)+8, maxY(_contactTextView)+13, kScreenW/2, 20)];
        self.promptLabel.font = [UIFont systemFontOfSize:15];
        self.promptLabel.textAlignment = NSTextAlignmentLeft;
        self.promptLabel.text = @"温馨提示";
        self.promptLabel.textColor = RGB(10, 31, 55,1);
    }
    return _promptLabel;
}
- (UILabel *)promptShowLabel
{
    if (_promptShowLabel ==nil) {
        self.promptShowLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(_promptLabel)+3, kScreenW-30, 40)];
        self.promptShowLabel.font = [UIFont systemFontOfSize:14];
        self.promptShowLabel.textAlignment = NSTextAlignmentLeft;
        self.promptShowLabel.text = @"有效的反馈或建议,将会得到BattleWorld准备的一份精美礼物~";
        self.promptShowLabel.textColor = RGB(10, 31, 55,0.56);
        self.promptShowLabel.numberOfLines = 0;
    }
    return _promptShowLabel;
}

-(UIButton *)nextBtn
{
    if (_nextBtn == nil) {
        self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBtn.frame = CGRectMake(15, maxY(self.promptShowLabel)+27, kScreenW-30, 45);
        [self.nextBtn setTitle:@"提交" forState:UIControlStateNormal];
        self.nextBtn.backgroundColor = RGB(179, 186, 201, 1);
        self.nextBtn.layer.cornerRadius = 1;
    }
    return _nextBtn;
}










@end
