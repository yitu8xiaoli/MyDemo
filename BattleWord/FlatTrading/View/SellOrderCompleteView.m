//
//  SellOrderCompleteView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/19.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "SellOrderCompleteView.h"
#define kOrderBackImageWidth self.orderBackImage.frame.size.width

@implementation SellOrderCompleteView

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
    [self.headView addSubview:self.paidLab];
    [self.headView addSubview:self.paidShowLab];

    [self addSubview:self.orderBackImage];
    [self.orderBackImage addSubview:self.accountName];
    [self.orderBackImage addSubview:self.accountMoneyLab];
    [self.orderBackImage addSubview:self.tradingPriceLab];
    [self.orderBackImage addSubview:self.tradingNumberLab];
    [self.orderBackImage addSubview:self.MessigeLab];
    [self.orderBackImage addSubview:self.NameLab];
    [self.orderBackImage addSubview:self.orderTimeLab];
    [self.orderBackImage addSubview:self.orderTimeShowLab];
    [self.orderBackImage addSubview:self.orderNumberLab];
    [self.orderBackImage addSubview:self.orderNumberShowLab];
    [self.orderBackImage addSubview:self.referenceLab];
    [self.orderBackImage addSubview:self.referenceImage];
    [self.orderBackImage addSubview:self.referenceShowLab];
    
}
-(UIImageView *)headView
{
    if (_headView == nil) {
        self.headView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 108)];
        self.headView.backgroundColor = RGB(253, 95, 142, 1);
    }
    return _headView;
}
-(UILabel *)paidLab
{
    if (_paidLab == nil) {
        _paidLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 11, kScreenW/2, 25)];
        _paidLab.font = [UIFont systemFontOfSize:18.0f];
        _paidLab.textAlignment = NSTextAlignmentLeft;
        _paidLab.textColor = [UIColor whiteColor];
        _paidLab.text = @"交易已完成";
    }
    return _paidLab;
}
-(UILabel *)paidShowLab
{
    if (_paidShowLab == nil) {
        _paidShowLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.paidLab)+2, kScreenW-30, 17)];
        _paidShowLab.font = [UIFont systemFontOfSize:12.0f];
        _paidShowLab.textAlignment = NSTextAlignmentLeft;
        _paidShowLab.textColor = [UIColor whiteColor];
        _paidShowLab.adjustsFontSizeToFitWidth = YES;
        _paidShowLab.minimumScaleFactor = 0.5;
        _paidShowLab.text = @"你所售出的数字资产已达到对方账户";
    }
    return _paidShowLab;
}
-(UIImageView *)orderBackImage
{
    if (_orderBackImage == nil) {
        self.orderBackImage =[[UIImageView alloc]initWithFrame:CGRectMake(15, 69, kScreenW-30, 255)];
        self.orderBackImage.backgroundColor = [UIColor whiteColor];
    }
    return _orderBackImage;
}


//订单详情
-(UILabel *)accountName
{
    if (_accountName == nil) {
        _accountName = [[UILabel alloc] initWithFrame:CGRectMake(15, 17, kOrderBackImageWidth/2-30, 17)];
        _accountName.font = [UIFont systemFontOfSize:12.0f];
        _accountName.textAlignment = NSTextAlignmentLeft;
        _accountName.textColor = RGB(10, 31, 55, 0.56);
        _accountName.adjustsFontSizeToFitWidth = YES;
        _accountName.minimumScaleFactor = 0.5;
        _accountName.text = @"交易总额";
    }
    return _accountName;
}
-(UILabel *)accountMoneyLab
{
    if (_accountMoneyLab == nil) {
        _accountMoneyLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, 17, kOrderBackImageWidth/2-30, 17)];
        _accountMoneyLab.font = [UIFont systemFontOfSize:12.0f];
        _accountMoneyLab.textAlignment = NSTextAlignmentRight;
        _accountMoneyLab.textColor = RGB(10, 31, 55, 0.56);;
        _accountMoneyLab.adjustsFontSizeToFitWidth = YES;
        _accountMoneyLab.minimumScaleFactor = 0.5;
        _accountMoneyLab.text = @"交易单价  $47850.00";
    }
    return _accountMoneyLab;
}

-(UILabel *)tradingPriceLab
{
    if (_tradingPriceLab == nil) {
        _tradingPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.accountName), kOrderBackImageWidth/2-30, 28)];
        _tradingPriceLab.font = [UIFont systemFontOfSize:16.0f];
        _tradingPriceLab.textAlignment = NSTextAlignmentLeft;
        _tradingPriceLab.textColor = RGB(4, 197, 252, 1);
        _tradingPriceLab.adjustsFontSizeToFitWidth = YES;
        _tradingPriceLab.minimumScaleFactor = 0.5;
        _tradingPriceLab.text = @"$588.88";
    }
    return _tradingPriceLab;
}
-(UILabel *)tradingNumberLab
{
    if (_tradingNumberLab == nil) {
        _tradingNumberLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.accountMoneyLab)+ 9, kOrderBackImageWidth/2-30, 17)];
        _tradingNumberLab.font = [UIFont systemFontOfSize:12.0f];
        _tradingNumberLab.textAlignment = NSTextAlignmentRight;
        _tradingNumberLab.textColor = RGB(10, 31, 55, 0.56);;
        _tradingNumberLab.adjustsFontSizeToFitWidth = YES;
        _tradingNumberLab.minimumScaleFactor = 0.5;
        _tradingNumberLab.text = @"交易数量  0.01BTC";
    }
    return _tradingNumberLab;
}
-(UILabel *)MessigeLab
{
    if (_MessigeLab == nil) {
        _MessigeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.tradingPriceLab)+ 26, (kOrderBackImageWidth-30)/2, 20)];
        _MessigeLab.font = [UIFont systemFontOfSize:14.0f];
        _MessigeLab.textAlignment = NSTextAlignmentLeft;
        _MessigeLab.textColor = RGB(10, 31, 55, 0.56);;
        _MessigeLab.adjustsFontSizeToFitWidth = YES;
        _MessigeLab.minimumScaleFactor = 0.5;
        _MessigeLab.text = @"卖家";
    }
    return _MessigeLab;
}
-(UILabel *)NameLab
{
    if (_NameLab == nil) {
        _NameLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.tradingPriceLab)+ 26, (kOrderBackImageWidth-30)/2, 20)];
        _NameLab.font = [UIFont systemFontOfSize:14.0f];
        _NameLab.textAlignment = NSTextAlignmentRight;
        _NameLab.textColor = RGB(10, 31, 55, 0.87);;
        _NameLab.adjustsFontSizeToFitWidth = YES;
        _NameLab.minimumScaleFactor = 0.5;
        _NameLab.text = @"沈微";
    }
    return _NameLab;
}
-(UILabel *)orderTimeLab
{
    if (_orderTimeLab == nil) {
        _orderTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.MessigeLab)+ 25, (kOrderBackImageWidth-30)/2, 20)];
        _orderTimeLab.font = [UIFont systemFontOfSize:14.0f];
        _orderTimeLab.textAlignment = NSTextAlignmentLeft;
        _orderTimeLab.textColor = RGB(10, 31, 55, 0.56);;
        _orderTimeLab.adjustsFontSizeToFitWidth = YES;
        _orderTimeLab.minimumScaleFactor = 0.5;
        _orderTimeLab.text = @"下单时间";
    }
    return _orderTimeLab;
}
-(UILabel *)orderTimeShowLab
{
    if (_orderTimeShowLab == nil) {
        _orderTimeShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.MessigeLab)+ 25, (kOrderBackImageWidth-30)/2, 20)];
        _orderTimeShowLab.font = [UIFont systemFontOfSize:14.0f];
        _orderTimeShowLab.textAlignment = NSTextAlignmentRight;
        _orderTimeShowLab.textColor = RGB(10, 31, 55, 0.87);;
        _orderTimeShowLab.adjustsFontSizeToFitWidth = YES;
        _orderTimeShowLab.minimumScaleFactor = 0.5;
        _orderTimeShowLab.text = @"2018-08-13 11:13:46";
    }
    return _orderTimeShowLab;
}
-(UILabel *)orderNumberLab
{
    if (_orderNumberLab == nil) {
        _orderNumberLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.orderTimeLab)+ 26, (kOrderBackImageWidth-30)/2, 20)];
        _orderNumberLab.font = [UIFont systemFontOfSize:14.0f];
        _orderNumberLab.textAlignment = NSTextAlignmentLeft;
        _orderNumberLab.textColor = RGB(10, 31, 55, 0.56);;
        _orderNumberLab.adjustsFontSizeToFitWidth = YES;
        _orderNumberLab.minimumScaleFactor = 0.5;
        _orderNumberLab.text = @"下单编号";
    }
    return _orderNumberLab;
}
-(UILabel *)orderNumberShowLab
{
    if (_orderNumberShowLab == nil) {
        _orderNumberShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.orderTimeLab)+ 26, (kOrderBackImageWidth-30)/2, 20)];
        _orderNumberShowLab.font = [UIFont systemFontOfSize:14.0f];
        _orderNumberShowLab.textAlignment = NSTextAlignmentRight;
        _orderNumberShowLab.textColor = RGB(10, 31, 55, 0.87);;
        _orderNumberShowLab.adjustsFontSizeToFitWidth = YES;
        _orderNumberShowLab.minimumScaleFactor = 0.5;
        _orderNumberShowLab.text = @"1176728118328790";
    }
    return _orderNumberShowLab;
}

-(UILabel *)referenceLab
{
    if (_referenceLab == nil) {
        _referenceLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.orderNumberLab)+ 25, 42, 20)];
        _referenceLab.font = [UIFont systemFontOfSize:14.0f];
        _referenceLab.textAlignment = NSTextAlignmentLeft;
        _referenceLab.textColor = RGB(10, 31, 55, 0.56);;
        _referenceLab.adjustsFontSizeToFitWidth = YES;
        _referenceLab.minimumScaleFactor = 0.5;
        _referenceLab.text = @"参考号";
    }
    return _referenceLab;
}
-(UIImageView *)referenceImage
{
    if (_referenceImage == nil) {
        self.referenceImage =[[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.referenceLab)+8, maxY(self.orderNumberLab)+28, 16, 16)];
        self.referenceImage.backgroundColor = [UIColor redColor];
    }
    return _referenceImage;
}
-(UILabel *)referenceShowLab
{
    if (_referenceShowLab == nil) {
        _referenceShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.orderNumberLab)+ 25, kOrderBackImageWidth/2-37, 20)];
        _referenceShowLab.font = [UIFont systemFontOfSize:14.0f];
        _referenceShowLab.textAlignment = NSTextAlignmentRight;
        _referenceShowLab.textColor = RGB(10, 31, 55, 0.87);;
        _referenceShowLab.adjustsFontSizeToFitWidth = YES;
        _referenceShowLab.minimumScaleFactor = 0.5;
        _referenceShowLab.text = @"5363637";
    }
    return _referenceShowLab;
}


@end
