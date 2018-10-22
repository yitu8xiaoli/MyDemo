//
//  ConfirmOrderView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/18.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "ConfirmOrderView.h"

@implementation ConfirmOrderView


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
    self.backgroundColor = RGB(0, 0, 0, 0.5);
    [self addSubview:self.backView];
    [self.backView addSubview:self.titleLab];
    [self.backView addSubview:self.contentLab];
    [self.backView addSubview:self.prometLab];
    [self.backView addSubview:self.lineOneView];
    [self.backView addSubview:self.cancelBtn];
    [self.backView addSubview:self.lineTwoView];
    [self.backView addSubview:self.detertionBtn];
    
    
    
}
-(UIView *)backView
{
    if (_backView == nil) {
        self.backView = [[UIView alloc]initWithFrame:CGRectMake(25,kScreenH/2-100 , kScreenW-50, 200)];
        self.backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
- (UILabel *)titleLab
{
    if (_titleLab ==nil) {
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 14, kScreenW-30, 25)];
        self.titleLab.font = [UIFont systemFontOfSize:18];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        self.titleLab.text = @"确认取消交易";
        self.titleLab.textColor = RGB(10, 31, 55, 0.87);
        
    }
    return _titleLab;
}
- (UILabel *)contentLab
{
    if (_contentLab ==nil) {
        self.contentLab = [[UILabel alloc]initWithFrame:CGRectMake((kScreenW-30-170)/2, maxY(_titleLab)+26, 170, 24)];
        self.contentLab.font = [UIFont systemFontOfSize:17];
        self.contentLab.textAlignment = NSTextAlignmentCenter;
        self.contentLab.text = @"请确认您已向卖家付款";
        self.contentLab.adjustsFontSizeToFitWidth = YES;
        self.contentLab.minimumScaleFactor = 0.5;
        self.contentLab.textColor = RGB(10, 31, 55, 0.56);
        
    }
    return _contentLab;
}
- (UILabel *)prometLab
{
    if (_prometLab ==nil) {
        self.prometLab = [[UILabel alloc]initWithFrame:CGRectMake(26, maxY(_contentLab)+7, self.backView.frame.size.width-52, 45)];
        self.prometLab.font = [UIFont systemFontOfSize:16];
        self.prometLab.textAlignment = NSTextAlignmentCenter;
        self.prometLab.text = @"请勿再未付款的前提下点击 我已付款 该行为属于恶意支付,超过三次将封号";
        self.prometLab.numberOfLines = 0;
        self.prometLab.adjustsFontSizeToFitWidth = YES;
        self.prometLab.minimumScaleFactor = 0.5;
        self.prometLab.textColor = RGB(10, 31, 55, 0.35);
        
    }
    return _prometLab;
}
-(UIView *)lineOneView
{
    if (_lineOneView == nil) {
        self.lineOneView = [[UIView alloc]initWithFrame:CGRectMake(0,maxY(self.prometLab)+8 , self.backView.frame.size.width, 1)];
        self.lineOneView.backgroundColor = RGB(179, 186, 201, 1);
    }
    return _lineOneView;
}
-(UIButton *)cancelBtn
{
    if (_cancelBtn ==nil) {
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBtn.frame = CGRectMake(0,  maxY(_lineOneView), self.backView.frame.size.width/2-1, 49);
        //        [self.cancelBtn setBackgroundColor:RGB(35, 198, 249, 1)];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.cancelBtn setTitle:@"我再想想" forState:UIControlStateNormal];
        [self.cancelBtn setTitleColor:RGB(179, 186, 201, 1) forState:UIControlStateNormal];
        self.cancelBtn.layer.cornerRadius = 2;
    }
    return _cancelBtn;
}
-(UIView *)lineTwoView
{
    if (_lineTwoView == nil) {
        self.lineTwoView = [[UIView alloc]initWithFrame:CGRectMake(maxX(self.cancelBtn),maxY(self.lineOneView) , 1, 48)];
        self.lineTwoView.backgroundColor = RGB(179, 186, 201, 1);
        
    }
    return _lineTwoView;
}
-(UIButton *)detertionBtn
{
    if (_detertionBtn ==nil) {
        self.detertionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.detertionBtn.frame = CGRectMake(maxX(self.lineTwoView),  maxY(_lineOneView), self.backView.frame.size.width/2, 49);
        //        [self.cancelBtn setBackgroundColor:RGB(35, 198, 249, 1)];
        [self.detertionBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.detertionBtn setTitleColor:RGB(4, 197, 252, 1) forState:UIControlStateNormal];
        self.detertionBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        self.detertionBtn.layer.cornerRadius = 2;
    }
    return _detertionBtn;
}

@end
