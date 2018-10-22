//
//  AppealResultsView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/19.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AppealResultsView.h"

@implementation AppealResultsView


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
    [self.headView addSubview:self.leftImage];
    [self.headView addSubview:self.titleLab];
    [self.headView addSubview:self.timeLab];
    
    [self.headView addSubview:self.priceShowLab];
    [self.headView addSubview:self.priceLab];
    [self.headView addSubview:self.numberShow];
    [self.headView addSubview:self.numberLab];
    [self.headView addSubview:self.totalMoneyShowLab];
    [self.headView addSubview:self.totalMoneyLab];
    
//    [self.backScrollview addSubview:self.resonView];
//    [self.resonView addSubview:self.resonLab];
//    [self.resonView addSubview:self.resonShowLab];
//    [self.resonView addSubview:self.resonArrow];
//    [self.backScrollview addSubview:self.adviceTextView];
//    [self.adviceTextView addSubview:self.placeholderLab];
//    
//    [self.backScrollview addSubview:self.imageBackView];
//    [self.imageBackView addSubview:self.addLabel];
//    [self.imageBackView addSubview:self.addImage1];
//    [self.imageBackView addSubview:self.addImage2];
//    [self.imageBackView addSubview:self.addImage3];
//    
//    [self.backScrollview addSubview:self.promptImage];
//    [self.backScrollview addSubview:self.promptLabel];
//    [self.backScrollview addSubview:self.promptShowLabel];
//    [self.backScrollview addSubview:self.nextBtn];
    
    
    
    
    
    
    
    
}

-(UIScrollView *)backScrollview
{
    if (_backScrollview == nil)
    {
        self.backScrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.backScrollview.backgroundColor = RGB(237, 235, 242, 0.7);
        [self.backScrollview  setContentSize:CGSizeMake(kScreenW,812)];
    }
    return _backScrollview;
}
-(UIView *)headView
{
    if (_headView == nil) {
        self.headView =[[UIView alloc]initWithFrame:CGRectMake(0, 10, kScreenW, 85)];
        self.headView.backgroundColor = [UIColor whiteColor];
        
    }
    return _headView;
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
        _titleLab.textColor = RGB(10, 31, 55, 1);
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
        _timeLab.textColor = RGB(10, 31, 55, 0.56);;
        _timeLab.adjustsFontSizeToFitWidth = YES;
        _timeLab.minimumScaleFactor = 0.5;
        _timeLab.text = @"2018-08-10  10:33;17";
    }
    return _timeLab;
}

-(UILabel *)priceShowLab
{
    if (_priceShowLab == nil) {
        _priceShowLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.titleLab)+9,(kScreenW - 30)/3, 23)];
        _priceShowLab.font = [UIFont systemFontOfSize:16.0f];
        _priceShowLab.textAlignment = NSTextAlignmentLeft;
        _priceShowLab.textColor = RGB(10, 31, 55, 0.87);;
        _priceShowLab.adjustsFontSizeToFitWidth = YES;
        _priceShowLab.minimumScaleFactor = 0.5;
        _priceShowLab.text = @"$47889999.00";
    }
    return _priceShowLab;
}
-(UILabel *)priceLab
{
    if (_priceLab == nil) {
        _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(15, maxY(self.priceShowLab),(kScreenW - 30)/3, 23)];
        _priceLab.font = [UIFont systemFontOfSize:12.0f];
        _priceLab.textAlignment = NSTextAlignmentLeft;
        _priceLab.textColor = RGB(10, 31, 55, 0.56);
        _priceLab.adjustsFontSizeToFitWidth = YES;
        _priceLab.minimumScaleFactor = 0.5;
        _priceLab.text = @"交易单价";
    }
    return _priceLab;
}
-(UILabel *)numberShow
{
    if (_numberShow == nil) {
        _numberShow = [[UILabel alloc] initWithFrame:CGRectMake(maxX(self.priceShowLab), maxY(self.titleLab)+9,(kScreenW - 30)/3, 23)];
        _numberShow.font = [UIFont systemFontOfSize:16.0f];
        _numberShow.textAlignment = NSTextAlignmentCenter;
        _numberShow.textColor = RGB(10, 31, 55, 0.87);;
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
        _numberLab.textColor = RGB(10, 31, 55, 0.56);;
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
        _totalMoneyShowLab.textColor = RGB(10, 31, 55, 0.87);;
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
        _totalMoneyLab.textColor = RGB(10, 31, 55, 0.56);
        _totalMoneyLab.adjustsFontSizeToFitWidth = YES;
        _totalMoneyLab.minimumScaleFactor = 0.5;
        _totalMoneyLab.text = @"交易金额";
    }
    return _totalMoneyLab;
}
@end
