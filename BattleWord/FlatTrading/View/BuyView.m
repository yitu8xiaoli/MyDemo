//
//  BuyView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/12.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "BuyView.h"

@implementation BuyView

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
    [self addSubview:self.headView];
    [self addSubview:self.backView];
    [self.headView addSubview:self.cancelBtn];
    [self.headView addSubview:self.buyNameLab];
    [self.headView addSubview:self.priceLab];
    [self.headView addSubview:self.headImage];
    [self.headView addSubview:self.nameLab];
    [self.headView addSubview:self.payOneImage];
    [self.headView addSubview:self.payTwoImage];
    [self.headView addSubview:self.payThreeImage];
    [self.headView addSubview:self.tradeLab];
    [self.headView addSubview:self.closingLab];
    [self.headView addSubview:self.putCoinTimeLab];
    


    [self.backView addSubview:self.amountLab];
    [self.backView addSubview:self.amountText];
    [self.backView addSubview:self.lineAmountView];
    [self.backView addSubview:self.allPutBtn];
    [self.backView addSubview:self.myLine];
    [self.backView addSubview:self.numberLab];
    [self.backView addSubview:self.numberText];
    [self.backView addSubview:self.lineNumberView];
    [self.backView addSubview:self.allNumberBtn];
    
    [self addSubview:self.buyBtn];

    
}

-(UIView *)headView
{
    if (_headView == nil) {
        self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 160)];
        self.headView.backgroundColor = RGB(9, 27, 53, 1);
        
    }
    return _headView;
}
-(UIView *)backView
{
    if (_backView == nil) {
        self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, maxY(self.headView)+10, kScreenW, 100)];
        self.backView.backgroundColor = RGB(9, 27, 53, 1);
        
    }
    return _backView;
}
-(UIButton *)cancelBtn
{
    if (_cancelBtn ==nil) {
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBtn.frame = CGRectMake(8,  8, 29, 29);
        [self.cancelBtn setTitle:@"X" forState:UIControlStateNormal];
        [self.cancelBtn setBackgroundColor:RGB(35, 198, 249, 1)];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.cancelBtn.layer.cornerRadius = 2;
    }
    return _cancelBtn;
}
- (UILabel *)buyNameLab
{
    if (_buyNameLab ==nil) {
        self.buyNameLab = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2, 9, kScreenW/2-15, 31)];
        self.buyNameLab.font = [UIFont systemFontOfSize:22];
        self.buyNameLab.textAlignment = NSTextAlignmentRight;
        self.buyNameLab.text = @"购买BTC";
        self.buyNameLab.textColor = RGB(4, 197, 252, 1);
        
    }
    return _buyNameLab;
}

- (UILabel *)priceLab
{
    if (_priceLab ==nil) {
        self.priceLab = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2, maxY(self.buyNameLab)+3, kScreenW/2-15, 20)];
        self.priceLab.font = [UIFont systemFontOfSize:14];
        self.priceLab.textAlignment = NSTextAlignmentRight;
        self.priceLab.text = @"单价$47850.00";
        self.priceLab.textColor = kWordGrayColor;
        
    }
    return _priceLab;
}
-(UIImageView *)headImage
{
    
    if (_headImage == nil) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(16, maxY(self.cancelBtn)+56, 26, 26)];
        self.headImage.backgroundColor = [UIColor redColor];
        self.headImage.layer.cornerRadius = 13;
    }
    return _headImage;
}
-(UILabel *)nameLab
{
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(_headImage)+8, 14, 50, 23)];
        _nameLab.font = [UIFont systemFontOfSize:16.0f];
        _nameLab.textColor = RGB(255, 255, 255,1.0);
        _nameLab.text = @"信小呆";
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _nameLab;
}
-(UIImageView *)payOneImage
{
    
    if (_payOneImage == nil) {
        self.payOneImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-73, maxY(self.priceLab)+36, 16, 16)];
        self.payOneImage.image = [UIImage imageNamed:@"支付宝"];
    }
    return _payOneImage;
}
-(UIImageView *)payTwoImage
{
    
    if (_payTwoImage == nil) {
        self.payTwoImage = [[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.payOneImage)+5, maxY(self.priceLab)+36, 16, 16)];
        self.payTwoImage.image = [UIImage imageNamed:@"微信"];
    }
    return _payTwoImage;
}
-(UIImageView *)payThreeImage
{
    
    if (_payThreeImage == nil) {
        self.payThreeImage = [[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.payTwoImage)+5, maxY(self.priceLab)+36, 16, 16)];
        self.payThreeImage.image = [UIImage imageNamed:@"银行卡"];
    }
    return _payThreeImage;
}

-(UILabel_LSLabel *)tradeLab
{
    if (_tradeLab == nil) {
        self.tradeLab  = [LSUIFactory createLabelWithFrame:CGRectMake(15, maxY(self.headImage)+11, (kScreenW - 30)/3, 23) FontSize:15 Text:@"572 交易单"textColor:[UIColor whiteColor] NSTextAlignment:NSTextAlignmentLeft];
        [self.tradeLab setFontWithFirstColor:kWordLightColor FirstFontSize:16 SecondColor:kWordGrayColor SecondFontSize:12 locationTag:3];
    }
    return _tradeLab;
}
-(UILabel_LSLabel *)closingLab
{
    if (_closingLab == nil) {
        self.closingLab  = [LSUIFactory createLabelWithFrame:CGRectMake(maxX(self.tradeLab), maxY(self.headImage)+11, (kScreenW - 30)/3, 23) FontSize:16 Text:@"80% 成交率"textColor:[UIColor whiteColor] NSTextAlignment:NSTextAlignmentCenter];
        [self.closingLab setFontWithFirstColor:kWordLightColor FirstFontSize:16 SecondColor:kWordGrayColor SecondFontSize:12 locationTag:3];
    }
    return _closingLab;
}
-(UILabel_LSLabel *)putCoinTimeLab
{
    if (_putCoinTimeLab == nil) {
        self.putCoinTimeLab  = [LSUIFactory createLabelWithFrame:CGRectMake(maxX(self.closingLab), maxY(self.headImage)+11, (kScreenW - 30)/3, 23) FontSize:15 Text:@"1'57'' 放币时效"textColor:[UIColor whiteColor] NSTextAlignment:NSTextAlignmentRight];
        [self.putCoinTimeLab setFontWithFirstColor:kWordLightColor FirstFontSize:16 SecondColor:kWordGrayColor SecondFontSize:12 locationTag:6];
    }
    return _putCoinTimeLab;
}

- (UILabel *)amountLab
{
    if (_amountLab ==nil) {
        self.amountLab = [[UILabel alloc]initWithFrame:CGRectMake(16, 14, 87, 23)];
        self.amountLab.font = [UIFont systemFontOfSize:16];
        self.amountLab.textAlignment = NSTextAlignmentLeft;
        self.amountLab.text = @"金额(CNY)";
        self.amountLab.textColor = kWordLightColor;
        
    }
    return _amountLab;
}
-(UITextField *)amountText
{
    if (_amountText == nil) {
        self.amountText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.amountLab)+14, 17, kScreenW -192, 17)];
        self.amountText.textColor = [UIColor whiteColor];
        self.amountText.placeholder = @"交易限额400-2,334.22";
        self.amountText.font = [UIFont systemFontOfSize:12];

        [self.amountText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];

    }
    return _amountText;
}
-(UIView *)lineAmountView
{
    
    if (_lineAmountView == nil) {
        self.lineAmountView = [[UIImageView alloc]initWithFrame:CGRectMake(maxX(_amountText), 18, 1, 14)];
        self.lineAmountView.backgroundColor = kWordGrayColor;
        self.lineAmountView.alpha = 0.5;
    }
    return _lineAmountView;
}
- (UIButton *)allPutBtn
{
    if (_allPutBtn ==nil) {
        self.allPutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.allPutBtn.frame = CGRectMake(maxX(self.lineAmountView)+11, 16, 50, 17);
        [self.allPutBtn setTitle:@"全部输入" forState:UIControlStateNormal];
        self.allPutBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.allPutBtn setTitleColor:RGB(4, 197, 252, 1) forState:UIControlStateNormal];
        self.allPutBtn.layer.cornerRadius = 2;
    }
    return _allPutBtn;
}

-(UIView *)myLine
{
    
    if (_myLine == nil) {
        self.myLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, maxY(self.amountLab)+13, kScreenW, 1)];
        self.myLine.backgroundColor = kWordGrayColor;
        self.myLine.alpha = 0.5;
    }
    return _myLine;
}
- (UILabel *)numberLab
{
    if (_numberLab ==nil) {
        self.numberLab = [[UILabel alloc]initWithFrame:CGRectMake(16, maxY(_myLine)+15, 87, 23)];
        self.numberLab.font = [UIFont systemFontOfSize:16];
        self.numberLab.textAlignment = NSTextAlignmentLeft;
        self.numberLab.text = @"数量(BTC)";
        self.numberLab.textColor = kWordLightColor;
        
    }
    return _numberLab;
}
-(UITextField *)numberText
{
    if (_numberText == nil) {
        self.numberText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.amountLab)+14,  maxY(_myLine)+17, kScreenW -192, 17)];
        self.numberText.textColor = [UIColor whiteColor];
        self.numberText.font = [UIFont systemFontOfSize:12];
        self.numberText.placeholder = @"请输入购买数量";
        [self.numberText setValue:kWordGrayColor forKeyPath:@"_placeholderLabel.textColor"];

    }
    return _numberText;
}
-(UIView *)lineNumberView
{
    
    if (_lineNumberView == nil) {
        self.lineNumberView = [[UIImageView alloc]initWithFrame:CGRectMake(maxX(_amountText),  maxY(_myLine)+18, 1, 14)];
        self.lineNumberView.backgroundColor = kWordGrayColor;
        self.lineNumberView.alpha = 0.5;
    }
    return _lineNumberView;
}
- (UIButton *)allNumberBtn
{
    if (_allNumberBtn ==nil) {
        self.allNumberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.allNumberBtn.frame = CGRectMake(maxX(self.lineAmountView)+11,  maxY(_myLine)+16, 50, 17);
        [self.allNumberBtn setTitle:@"全部输入" forState:UIControlStateNormal];
        self.allNumberBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.allNumberBtn setTitleColor:RGB(4, 197, 252, 1) forState:UIControlStateNormal];
        self.allNumberBtn.layer.cornerRadius = 2;
    }
    return _allNumberBtn;
}
- (UIButton *)buyBtn
{
    if (_buyBtn ==nil) {
        self.buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buyBtn.frame = CGRectMake(15,  maxY(_backView)+40, kScreenW-30, 45);
        [self.buyBtn setTitle:@"买入" forState:UIControlStateNormal];
        self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.buyBtn.backgroundColor = RGB(179, 186, 200, 1);
        self.buyBtn.layer.cornerRadius = 2;
    }
    return _buyBtn;
}

@end
