//
//  screeningView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/12.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "screeningView.h"

@implementation screeningView

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
    [self addSubview:self.businessTypeLab];
    [self addSubview:self.allBussnessTypeBtn];
    [self addSubview:self.seniorBtn];
    [self addSubview:self.tradingLab];
    [self addSubview:self.alltradingTypeBtn];
    [self addSubview:self.fiveBtn];
    [self addSubview:self.tenBtn];
    [self addSubview:self.twentyBtn];

    [self addSubview:self.payStyleLab];
    [self addSubview:self.allpayTypeBtn];
    [self addSubview:self.cardBtn];
    [self addSubview:self.zhiBtn];
    [self addSubview:self.wechatBtn];
    
    [self addSubview:self.resetBtn];
    [self addSubview:self.screenBtn];


}
- (UILabel *)businessTypeLab
{
    if (_businessTypeLab ==nil) {
        self.businessTypeLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 52, 100, 28)];
        self.businessTypeLab.font = [UIFont systemFontOfSize:20];
        self.businessTypeLab.textAlignment = NSTextAlignmentLeft;
        self.businessTypeLab.text = @"商家类型";
        self.businessTypeLab.textColor = [UIColor whiteColor];
        
    }
    return _businessTypeLab;
}
- (UIButton *)allBussnessTypeBtn
{
    if (_allBussnessTypeBtn ==nil) {
        self.allBussnessTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.allBussnessTypeBtn.frame = CGRectMake(15, maxY(_businessTypeLab)+15, 83, 33);
        [self.allBussnessTypeBtn setTitle:@"全部" forState:UIControlStateNormal];
        [self.allBussnessTypeBtn setBackgroundColor:kBlackColor];
        self.allBussnessTypeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.allBussnessTypeBtn.layer.cornerRadius = 2;
    }
    return _allBussnessTypeBtn;
}
- (UIButton *)seniorBtn
{
    if (_seniorBtn ==nil) {
        self.seniorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.seniorBtn.frame = CGRectMake(maxX(self.allBussnessTypeBtn)+11, maxY(_businessTypeLab)+15, 83, 33);
        [self.seniorBtn setTitle:@"高级认证" forState:UIControlStateNormal];
        self.seniorBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.seniorBtn setBackgroundColor:kBlackColor];
        self.seniorBtn.layer.cornerRadius = 2;
    }
    return _seniorBtn;
}

- (UILabel *)tradingLab
{
    if (_tradingLab ==nil) {
        self.tradingLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(_businessTypeLab)+88, 100, 28)];
        self.tradingLab.font = [UIFont systemFontOfSize:20];
        self.tradingLab.textAlignment = NSTextAlignmentLeft;
        self.tradingLab.text = @"交易金额";
        self.tradingLab.textColor = [UIColor whiteColor];
        
    }
    return _tradingLab;
}
- (UIButton *)alltradingTypeBtn
{
    if (_alltradingTypeBtn ==nil) {
        self.alltradingTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.alltradingTypeBtn.frame = CGRectMake(15, maxY(_tradingLab)+15, 83, 33);
        [self.alltradingTypeBtn setTitle:@"全部" forState:UIControlStateNormal];
        self.alltradingTypeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.alltradingTypeBtn setBackgroundColor:kBlackColor];
        self.alltradingTypeBtn.layer.cornerRadius = 2;
    }
    return _alltradingTypeBtn;
}
- (UIButton *)fiveBtn
{
    if (_fiveBtn ==nil) {
        self.fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.fiveBtn.frame = CGRectMake(maxX(self.alltradingTypeBtn)+11, maxY(_tradingLab)+15, 83, 33);
        [self.fiveBtn setTitle:@"五万以上" forState:UIControlStateNormal];
        [self.fiveBtn setBackgroundColor:kBlackColor];
        self.fiveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.fiveBtn.layer.cornerRadius = 2;
    }
    return _fiveBtn;
}
- (UIButton *)tenBtn
{
    if (_tenBtn ==nil) {
        self.tenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.tenBtn.frame = CGRectMake(maxX(self.fiveBtn)+11, maxY(_tradingLab)+15, 83, 33);
        [self.tenBtn setTitle:@"十万以上" forState:UIControlStateNormal];
        [self.tenBtn setBackgroundColor:kBlackColor];
        self.tenBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.tenBtn.layer.cornerRadius = 2;
    }
    return _tenBtn;
}
- (UIButton *)twentyBtn
{
    if (_twentyBtn ==nil) {
        self.twentyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.twentyBtn.frame = CGRectMake(15, maxY(_alltradingTypeBtn)+10, 83, 33);
        [self.twentyBtn setTitle:@"20万以上" forState:UIControlStateNormal];
        [self.twentyBtn setBackgroundColor:kBlackColor];
        self.twentyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.twentyBtn.layer.cornerRadius = 2;
    }
    return _twentyBtn;
}

- (UILabel *)payStyleLab
{
    if (_payStyleLab ==nil) {
        self.payStyleLab = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(_twentyBtn)+40, 100, 28)];
        self.payStyleLab.font = [UIFont systemFontOfSize:20];
        self.payStyleLab.textAlignment = NSTextAlignmentLeft;
        self.payStyleLab.text = @"支付方式";
        self.payStyleLab.textColor = [UIColor whiteColor];
        
    }
    return _payStyleLab;
}
- (UIButton *)allpayTypeBtn
{
    if (_allpayTypeBtn ==nil) {
        self.allpayTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.allpayTypeBtn.frame = CGRectMake(15, maxY(_payStyleLab)+15, 83, 33);
        [self.allpayTypeBtn setTitle:@"全部" forState:UIControlStateNormal];
        self.allpayTypeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.allpayTypeBtn setBackgroundColor:kBlackColor];
        self.allpayTypeBtn.layer.cornerRadius = 2;
    }
    return _allpayTypeBtn;
}
- (UIButton *)cardBtn
{
    if (_cardBtn ==nil) {
        self.cardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cardBtn.frame = CGRectMake(maxX(self.allpayTypeBtn)+11, maxY(_payStyleLab)+15, 83, 33);
        [self.cardBtn setTitle:@"银行卡" forState:UIControlStateNormal];
        [self.cardBtn setBackgroundColor:kBlackColor];
        self.cardBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.cardBtn.layer.cornerRadius = 2;
    }
    return _cardBtn;
}
- (UIButton *)zhiBtn
{
    if (_zhiBtn ==nil) {
        self.zhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.zhiBtn.frame = CGRectMake(maxX(self.cardBtn)+11, maxY(_payStyleLab)+15, 83, 33);
        [self.zhiBtn setTitle:@"支付宝" forState:UIControlStateNormal];
        [self.zhiBtn setBackgroundColor:kBlackColor];
        self.zhiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.zhiBtn.layer.cornerRadius = 2;
    }
    return _zhiBtn;
}
- (UIButton *)wechatBtn
{
    if (_wechatBtn ==nil) {
        self.wechatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.wechatBtn.frame = CGRectMake(15, maxY(_allpayTypeBtn)+10, 83, 33);
        [self.wechatBtn setTitle:@"20万以上" forState:UIControlStateNormal];
        [self.wechatBtn setBackgroundColor:kBlackColor];
        self.wechatBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.wechatBtn.layer.cornerRadius = 2;
    }
    return _wechatBtn;
}


- (UIButton *)resetBtn
{
    if (_resetBtn ==nil) {
        self.resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.resetBtn.frame = CGRectMake(10, kScreenH-88, (self.frame.size.width-25)/2, 45);
        [self.resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [self.resetBtn setBackgroundColor:RGB(179, 186, 200, 1)];
        self.resetBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.resetBtn.layer.cornerRadius = 2;
    }
    return _resetBtn;
}
- (UIButton *)screenBtn
{
    if (_screenBtn ==nil) {
        self.screenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.screenBtn.frame = CGRectMake(maxX(self.resetBtn)+5,  kScreenH-88, (self.frame.size.width-25)/2, 45);
        [self.screenBtn setTitle:@"筛选" forState:UIControlStateNormal];
        [self.screenBtn setBackgroundColor:RGB(35, 198, 249, 1)];
        self.screenBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.screenBtn.layer.cornerRadius = 2;
    }
    return _screenBtn;
}





@end
