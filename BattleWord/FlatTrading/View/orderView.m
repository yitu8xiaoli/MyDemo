//
//  orderView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/15.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "orderView.h"
#define kOrderBackImageWidth self.orderBackImage.frame.size.width

@implementation orderView
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
    [self addSubview:self.backScrollview];
    [self.backScrollview addSubview:self.headView];
    [self.headView addSubview:self.paidLab];
    [self.headView addSubview:self.timeImage];
    [self.headView addSubview:self.timeLab];
    [self.headView addSubview:self.paidShowLab];
    
    //订单
    [self.backScrollview addSubview:self.orderBackImage];
    [self.orderBackImage addSubview:self.accountName];
    [self.orderBackImage addSubview:self.accountMoneyLab];
    [self.orderBackImage addSubview:self.tradingPriceLab];
    [self.orderBackImage addSubview:self.tradingNumberLab];
    
    //银行卡
    [self.orderBackImage addSubview:self.cardImage];
    [self.orderBackImage addSubview:self.cardlab];
    [self.orderBackImage addSubview:self.switchBtn];
    [self.orderBackImage addSubview:self.arrowImage];
    [self.orderBackImage addSubview:self.lineView];
    [self.orderBackImage addSubview:self.cardMessigeLab];
    [self.orderBackImage addSubview:self.cardNameLab];
    [self.orderBackImage addSubview:self.cardBranchLab];
    
    //收款
    [self.orderBackImage addSubview:self.payeeLab];
    [self.orderBackImage addSubview:self.payeeNameLab];
    [self.orderBackImage addSubview:self.copOneImage];
    [self.orderBackImage addSubview:self.cardNumberLab];
    [self.orderBackImage addSubview:self.cardNumberShowLab];
    [self.orderBackImage addSubview:self.copTwoImage];
    [self.orderBackImage addSubview:self.referenceLab];
    [self.orderBackImage addSubview:self.referenceImage];
    [self.orderBackImage addSubview:self.referenceShowLab];
    [self.orderBackImage addSubview:self.copThreeImage];
    
    
    [self.orderBackImage addSubview:self.lineReferenceView];
    [self.orderBackImage addSubview:self.PaymentLab];
    [self.orderBackImage addSubview:self.cancelBtn];
    [self.orderBackImage addSubview:self.determineBtn];
    
    [self.backScrollview addSubview:self.promptImage];
    [self.backScrollview addSubview:self.promptLab];
    [self.backScrollview addSubview:self.promptOneLab];
    [self.backScrollview addSubview:self.promptTwoLab];
    [self.backScrollview addSubview:self.promptThreeLab];

    
}
-(UIScrollView *)backScrollview
{
    if (_backScrollview == nil)
    {
        self.backScrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.backScrollview.backgroundColor = kMainbackColor;
        [self.backScrollview  setContentSize:CGSizeMake(kScreenW, 789)];
    }
    return _backScrollview;
}
-(UIImageView *)headView
{
    if (_headView == nil) {
        self.headView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 108)];
        self.headView.backgroundColor = RGB(26, 218, 181, 1);
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
        _paidLab.text = @"待支付";
    }
    return _paidLab;
}
-(UIImageView *)timeImage
{
    if (_timeImage == nil) {
        self.timeImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-68, 16, 16, 16)];
        self.timeImage.backgroundColor = [UIColor whiteColor];
    }
    return _timeImage;
}
-(UILabel *)timeLab
{
    if (_timeLab == nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.timeImage)+2, 14, 38, 17)];
        _timeLab.font = [UIFont systemFontOfSize:12.0f];
        _timeLab.textAlignment = NSTextAlignmentLeft;
        _timeLab.textColor = [UIColor whiteColor];
        _timeLab.adjustsFontSizeToFitWidth = YES;
        _timeLab.minimumScaleFactor = 0.5;
        _timeLab.text = @"13:32";
    }
    return _timeLab;
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
        _paidShowLab.text = @"订单已提交,请在15分钟内完成支付,超市订单将会自动取消";
    }
    return _paidShowLab;
}

-(UIImageView *)orderBackImage
{
    if (_orderBackImage == nil) {
        self.orderBackImage =[[UIImageView alloc]initWithFrame:CGRectMake(15, 69, kScreenW-30, 471)];
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
        _accountName.text = @"请向以下账户付款";
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
-(UIImageView *)cardImage
{
    if (_cardImage == nil) {
        self.cardImage =[[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.tradingPriceLab)+28, 16, 16)];
        self.cardImage.backgroundColor = [UIColor redColor];
    }
    return _cardImage;
}
-(UILabel *)cardlab
{
    if (_cardlab == nil) {
        _cardlab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.cardImage)+8, maxY(self.tradingPriceLab)+ 26, 42, 20)];
        _cardlab.font = [UIFont systemFontOfSize:14.0f];
        _cardlab.textAlignment = NSTextAlignmentRight;
        _cardlab.textColor = RGB(10, 31, 55, 0.56);;
        _cardlab.adjustsFontSizeToFitWidth = YES;
        _cardlab.minimumScaleFactor = 0.5;
        _cardlab.text = @"银行卡";
    }
    return _cardlab;
}

-(UIButton *)switchBtn
{
    if (_switchBtn == nil) {
        self.switchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.switchBtn.frame = CGRectMake(kOrderBackImageWidth -86, maxY(self.tradingNumberLab)+30, 58, 20);
        [self.switchBtn setTitle:@"切换方式" forState:UIControlStateNormal];
        self.switchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.switchBtn setTitleColor:RGB(10, 31, 55, 0.56) forState:UIControlStateNormal];
        self.switchBtn.layer.cornerRadius = 1;
    }
    return _switchBtn;
}
-(UIImageView *)arrowImage
{
    if (_arrowImage == nil) {
        self.arrowImage =[[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.switchBtn)+5, maxY(self.tradingPriceLab)+32, 9, 18)];
        self.arrowImage.backgroundColor = [UIColor redColor];
    }
    return _arrowImage;
}

-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_cardlab)+12, kOrderBackImageWidth-30, 0.5)];
        self.lineView.backgroundColor = RGB(10, 31, 55,0.24);
    }
    return _lineView;
}
-(UILabel *)cardMessigeLab
{
    if (_cardMessigeLab == nil) {
        _cardMessigeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.lineView)+ 13, (kOrderBackImageWidth-30)/2, 20)];
        _cardMessigeLab.font = [UIFont systemFontOfSize:14.0f];
        _cardMessigeLab.textAlignment = NSTextAlignmentLeft;
        _cardMessigeLab.textColor = RGB(10, 31, 55, 0.56);;
        _cardMessigeLab.adjustsFontSizeToFitWidth = YES;
        _cardMessigeLab.minimumScaleFactor = 0.5;
        _cardMessigeLab.text = @"银行卡";
    }
    return _cardMessigeLab;
}
-(UILabel *)cardNameLab
{
    if (_cardNameLab == nil) {
        _cardNameLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.lineView)+ 13, (kOrderBackImageWidth-30)/2, 20)];
        _cardNameLab.font = [UIFont systemFontOfSize:14.0f];
        _cardNameLab.textAlignment = NSTextAlignmentRight;
        _cardNameLab.textColor = RGB(10, 31, 55, 0.87);;
        _cardNameLab.adjustsFontSizeToFitWidth = YES;
        _cardNameLab.minimumScaleFactor = 0.5;
        _cardNameLab.text = @"民生银行";
    }
    return _cardNameLab;
}
-(UILabel *)cardBranchLab
{
    if (_cardBranchLab == nil) {
        _cardBranchLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(_cardMessigeLab)+ 8, kOrderBackImageWidth-30, 50)];
        _cardBranchLab.font = [UIFont systemFontOfSize:12.0f];
        _cardBranchLab.numberOfLines = 0;
        _cardBranchLab.textAlignment = NSTextAlignmentLeft;
        _cardBranchLab.textColor = RGB(10, 31, 55, 0.87);;
        _cardBranchLab.adjustsFontSizeToFitWidth = YES;
        _cardBranchLab.minimumScaleFactor = 0.5;
        _cardBranchLab.text = @"浙江省杭州市滨江区江南大道支行(不要备注任何信息,请用实名认证相同的名字的账号打款)";
        _cardBranchLab.backgroundColor = RGB(247, 247, 251, 1);
    }
    return _cardBranchLab;
}



-(UILabel *)payeeLab
{
    if (_payeeLab == nil) {
        _payeeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.cardBranchLab)+ 13, (kOrderBackImageWidth-30)/2, 20)];
        _payeeLab.font = [UIFont systemFontOfSize:14.0f];
        _payeeLab.textAlignment = NSTextAlignmentLeft;
        _payeeLab.textColor = RGB(10, 31, 55, 0.56);;
        _payeeLab.adjustsFontSizeToFitWidth = YES;
        _payeeLab.minimumScaleFactor = 0.5;
        _payeeLab.text = @"收款人";
    }
    return _payeeLab;
}
-(UILabel *)payeeNameLab
{
    if (_payeeNameLab == nil) {
        _payeeNameLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.cardBranchLab)+ 13, kOrderBackImageWidth/2-37, 20)];
        _payeeNameLab.font = [UIFont systemFontOfSize:14.0f];
        _payeeNameLab.textAlignment = NSTextAlignmentRight;
        _payeeNameLab.textColor = RGB(10, 31, 55, 0.87);;
        _payeeNameLab.adjustsFontSizeToFitWidth = YES;
        _payeeNameLab.minimumScaleFactor = 0.5;
        _payeeNameLab.text = @"信小呆";
    }
    return _payeeNameLab;
}
-(UIImageView *)copOneImage
{
    if (_copOneImage == nil) {
        self.copOneImage =[[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.payeeNameLab)+8, maxY(self.cardBranchLab)+16, 16, 16)];
        self.copOneImage.image = [UIImage imageNamed:@"复制"];;
    }
    return _copOneImage;
}
-(UILabel *)cardNumberLab
{
    if (_cardNumberLab == nil) {
        _cardNumberLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.payeeLab)+ 25, (kOrderBackImageWidth-30)/2, 20)];
        _cardNumberLab.font = [UIFont systemFontOfSize:14.0f];
        _cardNumberLab.textAlignment = NSTextAlignmentLeft;
        _cardNumberLab.textColor = RGB(10, 31, 55, 0.56);;
        _cardNumberLab.adjustsFontSizeToFitWidth = YES;
        _cardNumberLab.minimumScaleFactor = 0.5;
        _cardNumberLab.text = @"银行卡卡号";
    }
    return _cardNumberLab;
}
-(UILabel *)cardNumberShowLab
{
    if (_cardNumberShowLab == nil) {
        _cardNumberShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.payeeLab)+ 25, kOrderBackImageWidth/2-37, 20)];
        _cardNumberShowLab.font = [UIFont systemFontOfSize:14.0f];
        _cardNumberShowLab.textAlignment = NSTextAlignmentRight;
        _cardNumberShowLab.textColor = RGB(10, 31, 55, 0.87);;
        _cardNumberShowLab.adjustsFontSizeToFitWidth = YES;
        _cardNumberShowLab.minimumScaleFactor = 0.5;
        _cardNumberShowLab.text = @"6222021702044001626";
    }
    return _cardNumberShowLab;
}
-(UIImageView *)copTwoImage
{
    if (_copTwoImage == nil) {
        self.copTwoImage =[[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.payeeNameLab)+8, maxY(self.payeeLab)+28, 16, 16)];
        self.copTwoImage.image = [UIImage imageNamed:@"复制"];;
    }
    return _copTwoImage;
}
-(UILabel *)referenceLab
{
    if (_referenceLab == nil) {
        _referenceLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.cardNumberLab)+ 25, 42, 20)];
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
        self.referenceImage =[[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.referenceLab)+8, maxY(self.cardNumberLab)+28, 16, 16)];
        self.referenceImage.backgroundColor = [UIColor redColor];
    }
    return _referenceImage;
}
-(UILabel *)referenceShowLab
{
    if (_referenceShowLab == nil) {
        _referenceShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.cardNumberLab)+ 25, kOrderBackImageWidth/2-37, 20)];
        _referenceShowLab.font = [UIFont systemFontOfSize:14.0f];
        _referenceShowLab.textAlignment = NSTextAlignmentRight;
        _referenceShowLab.textColor = RGB(10, 31, 55, 0.87);;
        _referenceShowLab.adjustsFontSizeToFitWidth = YES;
        _referenceShowLab.minimumScaleFactor = 0.5;
        _referenceShowLab.text = @"5363637";
    }
    return _referenceShowLab;
}
-(UIImageView *)copThreeImage
{
    if (_copThreeImage == nil) {
        self.copThreeImage =[[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.payeeNameLab)+8, maxY(self.cardNumberLab)+28, 16, 16)];
        self.copThreeImage.image = [UIImage imageNamed:@"复制"];;
    }
    return _copThreeImage;
}
-(UIView *)lineReferenceView
{
    
    if (_lineReferenceView == nil) {
        self.lineReferenceView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_referenceLab)+12, kOrderBackImageWidth-30, 0.5)];
        self.lineReferenceView.backgroundColor = RGB(10, 31, 55,0.24);
    }
    return _lineReferenceView;
}
-(UILabel *)PaymentLab
{
    if (_PaymentLab == nil) {
        _PaymentLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(_lineReferenceView)+ 12, kOrderBackImageWidth-30, 33)];
        _PaymentLab.font = [UIFont systemFontOfSize:12.0f];
        _PaymentLab.numberOfLines = 0;
        _PaymentLab.textAlignment = NSTextAlignmentLeft;
        _PaymentLab.textColor = RGB(10, 31, 55, 0.35);;
        _PaymentLab.adjustsFontSizeToFitWidth = YES;
        _PaymentLab.minimumScaleFactor = 0.5;
        _PaymentLab.text = @"如您已向卖家转账付款,请务必点击右下角我已付款按钮否则有可能造成资金损失";
//        _PaymentLab.backgroundColor = RGB(247, 247, 251, 1);
    }
    return _PaymentLab;
}

-(UIButton *)cancelBtn
{
    if (_cancelBtn == nil) {
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBtn.frame = CGRectMake(15, maxY(self.PaymentLab)+26, (kOrderBackImageWidth-35)/31*13, 45);
        [self.cancelBtn setTitle:@"取消交易" forState:UIControlStateNormal];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.cancelBtn.backgroundColor = RGB(179, 186, 201, 1);
        [self.cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.cancelBtn.layer.cornerRadius = 1;
    }
    return _cancelBtn;
}
-(UIButton *)determineBtn
{
    if (_determineBtn == nil) {
        self.determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.determineBtn.frame = CGRectMake(maxX(self.cancelBtn)+5,maxY(self.PaymentLab)+26, (kOrderBackImageWidth-35)/31*18, 45);
        [self.determineBtn setTitle:@"我已付款" forState:UIControlStateNormal];
        self.determineBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.determineBtn.backgroundColor = RGB(4, 197, 252, 1);
        [self.determineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.determineBtn.layer.cornerRadius = 1;
    }
    return _determineBtn;
}








-(UIImageView *)promptImage
{
    if (_promptImage == nil) {
        self.promptImage =[[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.orderBackImage)+20, 15, 12)];
        self.promptImage.backgroundColor = [UIColor whiteColor];
    }
    return _promptImage;
}
-(UILabel *)promptLab
{
    if (_promptLab == nil) {
        _promptLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.promptImage)+8, maxY(self.orderBackImage)+15, kScreenW/2, 21)];
        _promptLab.font = [UIFont systemFontOfSize:15.0f];
        _promptLab.textAlignment = NSTextAlignmentLeft;
        _promptLab.textColor = kWordLightColor;
        _promptLab.text = @"温馨提示";
    }
    return _promptLab;
}

-(UILabel *)promptOneLab
{
    if (_promptOneLab == nil) {
        _promptOneLab = [[UILabel alloc] initWithFrame:CGRectMake(18, maxY(self.promptLab)+3, kScreenW-33, 40)];
        _promptOneLab.font = [UIFont systemFontOfSize:14.0f];
        _promptOneLab.textAlignment = NSTextAlignmentLeft;
        _promptOneLab.numberOfLines = 0;
        _promptOneLab.textColor = kWordGrayColor;
        _promptOneLab.text = @"1.您的汇款将直接进入卖家账户,交易过程中卖家出售的数字资产由平台托管保护.";
    }
    return _promptOneLab;
}
-(UILabel *)promptTwoLab
{
    if (_promptTwoLab == nil) {
        _promptTwoLab = [[UILabel alloc] initWithFrame:CGRectMake(18, maxY(self.promptOneLab), kScreenW-33, 40)];
        _promptTwoLab.font = [UIFont systemFontOfSize:14.0f];
        _promptTwoLab.textAlignment = NSTextAlignmentLeft;
        _promptTwoLab.numberOfLines = 0;
        _promptTwoLab.textColor = kWordGrayColor;
        _promptTwoLab.text = @"2.请在规定的时间内完成付款,并务必点击我已付款,卖家确认收款后,系统会见数字资产转到您的账户.";
    }
    return _promptTwoLab;
}
-(UILabel *)promptThreeLab
{
    if (_promptThreeLab == nil) {
        _promptThreeLab = [[UILabel alloc] initWithFrame:CGRectMake(18, maxY(self.promptTwoLab), kScreenW-33, 40)];
        _promptThreeLab.font = [UIFont systemFontOfSize:14.0f];
        _promptThreeLab.textAlignment = NSTextAlignmentLeft;
        _promptThreeLab.numberOfLines = 0;
        _promptThreeLab.textColor = kWordGrayColor;
        _promptThreeLab.text = @"3.如果买家当日取消订单达三次,将会被限制当日的买入功能";
    }
    return _promptThreeLab;
}
















@end
