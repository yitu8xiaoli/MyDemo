//
//  OrderListTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "OrderListTableViewCell.h"

@implementation OrderListTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        [self.contentView addSubview:self.leftImage];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.payStateLab];

        [self.contentView addSubview:self.priceShowLab];
        [self.contentView addSubview:self.priceLab];
        [self.contentView addSubview:self.numberShow];
        [self.contentView addSubview:self.numberLab];
        [self.contentView addSubview:self.totalMoneyShowLab];
        [self.contentView addSubview:self.totalMoneyLab];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.timeImage];
        [self.contentView addSubview:self.countdownLab];
        [self.contentView addSubview:self.promptLab];
        [self.contentView addSubview:self.complaintBtn];
        [self.contentView addSubview:self.determineBtn];



    }
    
    return self;
}
-(UIImageView *)leftImage
{
    
    if (_leftImage == nil) {
        self.leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5,5, 21)];
        self.leftImage.backgroundColor = RGB(255, 39, 152, 1);
    }
    return _leftImage;
}
//订单详情
-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(_leftImage)+10, 3,51, 25)];
        _titleLab.font = [UIFont systemFontOfSize:18.0f];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.adjustsFontSizeToFitWidth = YES;
        _titleLab.minimumScaleFactor = 0.5;
        _titleLab.text = @"USDT";
    }
    return _titleLab;
}
-(UILabel *)timeLab
{
    if (_timeLab == nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(_titleLab)+10, 8,146, 17)];
        _timeLab.font = [UIFont systemFontOfSize:12.0f];
        _timeLab.textAlignment = NSTextAlignmentLeft;
        _timeLab.textColor = kWordDrakColor;
        _timeLab.adjustsFontSizeToFitWidth = YES;
        _timeLab.minimumScaleFactor = 0.5;
        _timeLab.text = @"2018-08-10  10:33;17";
    }
    return _timeLab;
}
-(UILabel *)payStateLab
{
    if (_payStateLab == nil) {
        _payStateLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW -90, 6,75, 20)];
        _payStateLab.font = [UIFont systemFontOfSize:14.0f];
        _payStateLab.textAlignment = NSTextAlignmentRight;
        _payStateLab.textColor = RGB(4, 197, 252, 1);
        _payStateLab.adjustsFontSizeToFitWidth = YES;
        _payStateLab.minimumScaleFactor = 0.5;
        _payStateLab.text = @"对方已支付";
    }
    return _payStateLab;
}
-(UILabel *)priceShowLab
{
    if (_priceShowLab == nil) {
        _priceShowLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.titleLab)+9,(kScreenW - 30)/3, 23)];
        _priceShowLab.font = [UIFont systemFontOfSize:16.0f];
        _priceShowLab.textAlignment = NSTextAlignmentLeft;
        _priceShowLab.textColor = kWordLightColor;
        _priceShowLab.adjustsFontSizeToFitWidth = YES;
        _priceShowLab.minimumScaleFactor = 0.5;
        _priceShowLab.text = @"6.91";
    }
    return _priceShowLab;
}
-(UILabel *)priceLab
{
    if (_priceLab == nil) {
        _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.priceShowLab),(kScreenW - 30)/3, 23)];
        _priceLab.font = [UIFont systemFontOfSize:12.0f];
        _priceLab.textAlignment = NSTextAlignmentLeft;
        _priceLab.textColor = kWordGrayColor;
        _priceLab.adjustsFontSizeToFitWidth = YES;
        _priceLab.minimumScaleFactor = 0.5;
        _priceLab.text = @"CNY";
    }
    return _priceLab;
}
-(UILabel *)numberShow
{
    if (_numberShow == nil) {
        _numberShow = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.priceShowLab), maxY(self.titleLab)+9,(kScreenW - 30)/3, 23)];
        _numberShow.font = [UIFont systemFontOfSize:16.0f];
        _numberShow.textAlignment = NSTextAlignmentCenter;
        _numberShow.textColor = kWordLightColor;
        _numberShow.adjustsFontSizeToFitWidth = YES;
        _numberShow.minimumScaleFactor = 0.5;
        _numberShow.text = @"80000.8";
    }
    return _numberShow;
}
-(UILabel *)numberLab
{
    if (_numberLab == nil) {
        _numberLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.priceShowLab), maxY(self.numberShow),(kScreenW - 30)/3, 23)];
        _numberLab.font = [UIFont systemFontOfSize:12.0f];
        _numberLab.textAlignment = NSTextAlignmentCenter;
        _numberLab.textColor = kWordGrayColor;
        _numberLab.adjustsFontSizeToFitWidth = YES;
        _numberLab.minimumScaleFactor = 0.5;
        _numberLab.text = @"数量";
    }
    return _numberLab;
}
-(UILabel *)totalMoneyShowLab
{
    if (_totalMoneyShowLab == nil) {
        _totalMoneyShowLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.numberLab), maxY(self.titleLab)+9,(kScreenW - 30)/3, 23)];
        _totalMoneyShowLab.font = [UIFont systemFontOfSize:16.0f];
        _totalMoneyShowLab.textAlignment = NSTextAlignmentRight;
        _totalMoneyShowLab.textColor = kWordLightColor;
        _totalMoneyShowLab.adjustsFontSizeToFitWidth = YES;
        _totalMoneyShowLab.minimumScaleFactor = 0.5;
        _totalMoneyShowLab.text = @"2636323.87";
    }
    return _totalMoneyShowLab;
}
-(UILabel *)totalMoneyLab
{
    if (_totalMoneyLab == nil) {
        _totalMoneyLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.numberLab), maxY(self.totalMoneyShowLab),(kScreenW - 30)/3, 23)];
        _totalMoneyLab.font = [UIFont systemFontOfSize:12.0f];
        _totalMoneyLab.textAlignment = NSTextAlignmentRight;
        _totalMoneyLab.textColor = kWordGrayColor;
        _totalMoneyLab.adjustsFontSizeToFitWidth = YES;
        _totalMoneyLab.minimumScaleFactor = 0.5;
        _totalMoneyLab.text = @"交易金额";
    }
    return _totalMoneyLab;
}
-(UIView *)lineView
{
    if (_lineView == nil) {
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(15, maxY(self.priceLab)+7, kScreenW - 30, 1)];
        self.lineView.backgroundColor = RGB(255, 255, 255, 0.24);
    }
    return _lineView;
}
-(UIImageView *)timeImage
{
    if (_timeImage == nil) {
        self.timeImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.lineView)+16,16, 16)];
        self.timeImage.backgroundColor = [UIColor redColor];
    }
    return _timeImage;
}
-(UILabel *)countdownLab
{
    if (_countdownLab == nil) {
        _countdownLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.timeImage)+5, maxY(self.lineView)+16,35, 17)];
        _countdownLab.font = [UIFont systemFontOfSize:12.0f];
        _countdownLab.textAlignment = NSTextAlignmentLeft;
        _countdownLab.textColor = kWordGrayColor;
        _countdownLab.adjustsFontSizeToFitWidth = YES;
        _countdownLab.minimumScaleFactor = 0.5;
        _countdownLab.text = @"15:44";
    }
    return _countdownLab;
}
-(UILabel *)promptLab
{
    if (_promptLab == nil) {
        _promptLab = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.countdownLab)+6, maxY(self.lineView)+16,82, 17)];
        _promptLab.font = [UIFont systemFontOfSize:12.0f];
        _promptLab.textAlignment = NSTextAlignmentLeft;
        _promptLab.textColor = RGB(255, 39, 152, 0.87);
        _promptLab.adjustsFontSizeToFitWidth = YES;
        _promptLab.minimumScaleFactor = 0.5;
        _promptLab.text = @"超时自动取消";
    }
    return _promptLab;
}
- (UIButton *)complaintBtn
{
    if (_complaintBtn ==nil) {
        self.complaintBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.complaintBtn.frame =CGRectMake(kScreenW-179, maxY(_lineView)+10, 75, 27);
        [self.complaintBtn setTitle:@"申诉" forState:UIControlStateNormal];
        [self.complaintBtn setBackgroundColor:[UIColor clearColor]];
        self.complaintBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.complaintBtn setTitleColor:RGB(4, 197, 252, 1) forState:UIControlStateNormal];
        self.complaintBtn.layer.cornerRadius = 13.5;
        self.complaintBtn.layer.borderColor = [RGB(4, 197, 252, 1) CGColor];//设置边框颜色
        self.complaintBtn.layer.borderWidth = 1.0f;//设置边框颜色
    }
    return _complaintBtn;
}
- (UIButton *)determineBtn
{
    if (_determineBtn ==nil) {
        self.determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.determineBtn.frame = CGRectMake(maxX(self.complaintBtn)+10, maxY(_lineView)+10, 75, 27);
        [self.determineBtn setTitle:@"确认放币" forState:UIControlStateNormal];
        [self.determineBtn setTitleColor:RGB(4, 197, 252, 1) forState:UIControlStateNormal];
        [self.determineBtn setBackgroundColor:[UIColor clearColor]];
        self.determineBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.determineBtn.layer.cornerRadius = 13.5;
        self.determineBtn.layer.borderColor = [RGB(4, 197, 252, 1) CGColor];//设置边框颜色
        self.determineBtn.layer.borderWidth = 1.0f;//设置边框颜色
    }
    return _determineBtn;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
