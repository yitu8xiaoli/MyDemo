//
//  SellOrderWaitReleaseView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/19.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "SellOrderWaitReleaseView.h"

@implementation SellOrderWaitReleaseView

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
    
    [self.backScrollview addSubview:self.orderBackImage];
    [self.orderBackImage addSubview:self.accountName];
    [self.orderBackImage addSubview:self.accountMoneyLab];
    [self.orderBackImage addSubview:self.tradingPriceLab];
    [self.orderBackImage addSubview:self.tradingNumberLab];
    [self.orderBackImage addSubview:self.MessigeLab];
    [self.orderBackImage addSubview:self.NameLab];
    [self.orderBackImage addSubview:self.copOneImage];
    
    [self.orderBackImage addSubview:self.orderTimeLab];
    [self.orderBackImage addSubview:self.orderTimeShowLab];
    [self.orderBackImage addSubview:self.orderNumberLab];
    [self.orderBackImage addSubview:self.orderNumberShowLab];
    [self.orderBackImage addSubview:self.referenceLab];
    [self.orderBackImage addSubview:self.referenceImage];
    [self.orderBackImage addSubview:self.referenceShowLab];
    [self.orderBackImage addSubview:self.lineView];
    [self.orderBackImage addSubview:self.remindLab];
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
        _paidLab.text = @"请放行";
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
        _paidShowLab.text = @"买家已付款,请在12小时内放行,超时将自动放行";
    }
    return _paidShowLab;
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
-(UIImageView *)orderBackImage
{
    if (_orderBackImage == nil) {
        self.orderBackImage =[[UIImageView alloc]initWithFrame:CGRectMake(15, 69, kScreenW-30, 386)];
        self.orderBackImage.backgroundColor = [UIColor whiteColor];
    }
    return _orderBackImage;
}
//订单详情
-(UILabel *)accountName
{
    if (
        _accountName == nil) {
        _accountName = [[UILabel alloc] initWithFrame:CGRectMake(15, 17, kOrderBackImageWidth/2-30, 17)];
        _accountName.font = [UIFont systemFontOfSize:12.0f];
        _accountName.textAlignment = NSTextAlignmentLeft;
        _accountName.textColor = RGB(10, 31, 55, 0.56);
        _accountName.adjustsFontSizeToFitWidth = YES;
        _accountName.minimumScaleFactor = 0.5;
        _accountName.text = @"你将收到";
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
        _tradingPriceLab.text = @"0.012BTC";
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
        _MessigeLab.text = @"买家";
    }
    return _MessigeLab;
}
-(UILabel *)NameLab
{
    if (_NameLab == nil) {
        _NameLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.tradingPriceLab)+ 26, kOrderBackImageWidth/2-37, 20)];
        _NameLab.font = [UIFont systemFontOfSize:14.0f];
        _NameLab.textAlignment = NSTextAlignmentRight;
        _NameLab.textColor = RGB(10, 31, 55, 0.87);;
        _NameLab.adjustsFontSizeToFitWidth = YES;
        _NameLab.minimumScaleFactor = 0.5;
        _NameLab.text = @"信小呆";
    }
    return _NameLab;
}
-(UIImageView *)copOneImage
{
    if (_copOneImage == nil) {
        self.copOneImage =[[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.NameLab)+8, maxY(self.tradingNumberLab)+31, 16, 16)];
        self.copOneImage.backgroundColor = [UIColor redColor];
        //        self.copOneImage.image = [UIImage imageNamed:@"复制"];;
    }
    return _copOneImage;
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
        _orderNumberLab.text = @"订单号";
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
        _referenceShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kOrderBackImageWidth/2, maxY(self.orderNumberLab)+ 25, kOrderBackImageWidth/2-14, 20)];
        _referenceShowLab.font = [UIFont systemFontOfSize:14.0f];
        _referenceShowLab.textAlignment = NSTextAlignmentRight;
        _referenceShowLab.textColor = RGB(10, 31, 55, 0.87);;
        _referenceShowLab.adjustsFontSizeToFitWidth = YES;
        _referenceShowLab.minimumScaleFactor = 0.5;
        _referenceShowLab.text = @"5363637";
    }
    return _referenceShowLab;
}
-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_referenceLab)+12, kOrderBackImageWidth-30, 0.5)];
        self.lineView.backgroundColor = RGB(10, 31, 55,0.24);
    }
    return _lineView;
}
-(UILabel *)remindLab
{
    if (_remindLab == nil) {
        _remindLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.lineView)+ 12, kOrderBackImageWidth-30, 33)];
        _remindLab.font = [UIFont systemFontOfSize:12.0f];
        _remindLab.textAlignment = NSTextAlignmentLeft;
        _remindLab.textColor = RGB(10, 31, 55, 0.35);;
        _remindLab.adjustsFontSizeToFitWidth = YES;
        _remindLab.minimumScaleFactor = 0.5;
        _remindLab.numberOfLines = 0;
        _remindLab.text = @"请务必登录收款账户确认到账明细,避免因错误点击放行造成财产损失.";
    }
    return _remindLab;
}
-(UIButton *)cancelBtn
{
    if (_cancelBtn == nil) {
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBtn.frame = CGRectMake(15, maxY(self.remindLab)+26, (kOrderBackImageWidth-35)/31*13, 45);
        [self.cancelBtn setTitle:@"申诉" forState:UIControlStateNormal];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        self.cancelBtn.backgroundColor = RGB(255, 39, 152, 1);
        [self.cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.cancelBtn.layer.cornerRadius = 1;
    }
    return _cancelBtn;
}
-(UIButton *)determineBtn
{
    if (_determineBtn == nil) {
        self.determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.determineBtn.frame = CGRectMake(maxX(self.cancelBtn)+5,maxY(self.remindLab)+26, (kOrderBackImageWidth-35)/31*18, 45);
        [self.determineBtn setTitle:@"确认放行" forState:UIControlStateNormal];
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
        _promptOneLab.text = @"1.交易过程中您所出售的数字资产由平台托管冻结,请确认收到对方汇款后,点击确认方形支付数字资产.";
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
        _promptTwoLab.text = @"2.请不要相信任何催促放币的理由,确认收到款项后在释放数字资产,避免造成损失.";
    }
    return _promptTwoLab;
}
-(UILabel *)promptThreeLab
{
    if (_promptThreeLab == nil) {
        _promptThreeLab = [[UILabel alloc] initWithFrame:CGRectMake(18, maxY(self.promptTwoLab), kScreenW-33, 60)];
        _promptThreeLab.font = [UIFont systemFontOfSize:14.0f];
        _promptThreeLab.textAlignment = NSTextAlignmentLeft;
        _promptThreeLab.numberOfLines = 0;
        _promptThreeLab.textColor = kWordGrayColor;
        _promptThreeLab.text = @"3.在收到到账短信后,请务必登录网上银行或者手机银行确认款项是否入账,避免因受到诈骗短信错误释放数字资产";
    }
    return _promptThreeLab;
}



@end
