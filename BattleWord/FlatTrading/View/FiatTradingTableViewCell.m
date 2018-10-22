//
//  FiatTradingTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/12.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "FiatTradingTableViewCell.h"

@implementation FiatTradingTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        
        [self.contentView addSubview:self.headImage];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.allMoneyLab];
        [self.contentView addSubview:self.tradingDataLab];
        [self.contentView addSubview:self.numberLab];
        [self.contentView addSubview:self.payOneImage];
        [self.contentView addSubview:self.payTwoImage];
        [self.contentView addSubview:self.payThreeImage];
        [self.contentView addSubview:self.limitLab];


        
    }
    
    return self;
}


-(UIImageView *)headImage
{
    
    if (_headImage == nil) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(16, 13, 26, 26)];
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
-(UILabel *)allMoneyLab
{
    if (_allMoneyLab == nil) {
        _allMoneyLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW/2, 12, kScreenW/2-14, 28)];
        _allMoneyLab.font = [UIFont systemFontOfSize:20.0f];
        _allMoneyLab.textAlignment = NSTextAlignmentRight;
        _allMoneyLab.textColor = RGB(4, 197, 252,1.0);
        _allMoneyLab.text = @"$47,918.00";
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _allMoneyLab;
}

-(UILabel *)tradingDataLab
{
    if (_tradingDataLab == nil) {
        _tradingDataLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.headImage)+17, kScreenW/2-15, 17)];
        _tradingDataLab.font = [UIFont systemFontOfSize:12.0f];
        _tradingDataLab.textColor = kWordGrayColor;
        _tradingDataLab.textAlignment = NSTextAlignmentLeft;
        _tradingDataLab.text = @"已交易104/成交率100%";
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _tradingDataLab;
}
-(UILabel *)numberLab
{
    if (_numberLab == nil) {
        _numberLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW/2, maxY(self.headImage)+17, kScreenW/2-14, 17)];
        _numberLab.font = [UIFont systemFontOfSize:12.0f];
        _numberLab.textColor = kWordGrayColor;
        _numberLab.text = @"数量5.600000BTC";
        _numberLab.textAlignment = NSTextAlignmentRight;
    }
    return _numberLab;
}
-(UIImageView *)payOneImage
{
    
    if (_payOneImage == nil) {
        self.payOneImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(self.tradingDataLab)+7, 16, 16)];
        self.payOneImage.backgroundColor = [UIColor redColor];
    }
    return _payOneImage;
}
-(UIImageView *)payTwoImage
{
    
    if (_payTwoImage == nil) {
        self.payTwoImage = [[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.payOneImage)+5, maxY(self.tradingDataLab)+7, 16, 16)];
        self.payTwoImage.backgroundColor = [UIColor redColor];
    }
    return _payTwoImage;
}
-(UIImageView *)payThreeImage
{
    
    if (_payThreeImage == nil) {
        self.payThreeImage = [[UIImageView alloc]initWithFrame:CGRectMake(maxX(self.payTwoImage)+5, maxY(self.tradingDataLab)+7, 16, 16)];
        self.payThreeImage.backgroundColor = [UIColor redColor];
    }
    return _payThreeImage;
}
-(UILabel *)limitLab
{
    if (_limitLab == nil) {
        _limitLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW/2, maxY(self.numberLab)+7, kScreenW/2-14, 17)];
        _limitLab.font = [UIFont systemFontOfSize:12.0f];
        _limitLab.textColor = kWordGrayColor;
        _limitLab.text = @"限额$18.888.00-$363.660.00";
        _limitLab.textAlignment = NSTextAlignmentRight;
    }
    return _limitLab;
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
