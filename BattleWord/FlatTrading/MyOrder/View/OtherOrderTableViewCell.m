//
//  OtherOrderTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "OtherOrderTableViewCell.h"

@implementation OtherOrderTableViewCell
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
