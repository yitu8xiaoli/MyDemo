//
//  AppealView.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/18.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AppealView.h"

@implementation AppealView

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
    
    [self.backScrollview addSubview:self.resonView];
    [self.resonView addSubview:self.resonLab];
    [self.resonView addSubview:self.resonShowLab];
    [self.resonView addSubview:self.resonArrow];
    [self.backScrollview addSubview:self.adviceTextView];
    [self.adviceTextView addSubview:self.placeholderLab];

    [self.backScrollview addSubview:self.imageBackView];
    [self.imageBackView addSubview:self.addLabel];
    [self.imageBackView addSubview:self.addImage1];
    [self.imageBackView addSubview:self.addImage2];
    [self.imageBackView addSubview:self.addImage3];

    [self.backScrollview addSubview:self.promptImage];
    [self.backScrollview addSubview:self.promptLabel];
    [self.backScrollview addSubview:self.promptShowLabel];
    [self.backScrollview addSubview:self.nextBtn];

    
    
    
    
    
    
    
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

-(UIView *)resonView
{
    if (_resonView == nil) {
        self.resonView =[[UIView alloc]initWithFrame:CGRectMake(0, maxY(_headView)+5, kScreenW, 45)];
        self.resonView.backgroundColor = [UIColor whiteColor];
        
    }
    return _resonView;
}
-(UILabel *)resonLab
{
    if (_resonLab == nil) {
        _resonLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 13,kScreenW / 2, 20)];
        _resonLab.font = [UIFont systemFontOfSize:14.0f];
        _resonLab.textAlignment = NSTextAlignmentLeft;
        _resonLab.textColor = RGB(10, 31, 55, 0.56);
        _resonLab.adjustsFontSizeToFitWidth = YES;
        _resonLab.minimumScaleFactor = 0.5;
        _resonLab.text = @"请选择申诉原因";
    }
    return _resonLab;
}
-(UILabel *)resonShowLab
{
    if (_resonShowLab == nil) {
        _resonShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW/2, 13,kScreenW / 2-30, 20)];
        _resonShowLab.font = [UIFont systemFontOfSize:14.0f];
        _resonShowLab.textAlignment = NSTextAlignmentRight;
        _resonShowLab.textColor = RGB(10, 31, 55, 0.56);
        _resonShowLab.adjustsFontSizeToFitWidth = YES;
        _resonShowLab.minimumScaleFactor = 0.5;
    }
    return _resonShowLab;
}
-(UIImageView *)resonArrow
{
    if (_resonArrow == nil) {
        
        _resonArrow = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW -25, 15, 18,18)];
        _resonArrow.image = [UIImage imageNamed:@"next_b"];
    }
    return _resonArrow;
}
-(UITextView *)adviceTextView
{
    if (_adviceTextView == nil) {
        self.adviceTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, maxY(self.resonView)+5, kScreenW, 250)];
        self.adviceTextView.font = [UIFont systemFontOfSize:14];
        self.adviceTextView.textContainerInset = UIEdgeInsetsMake(11, 15, 0, 15);//设置页边距
    }
    return _adviceTextView;
}

- (UILabel *)placeholderLab
{
    if (_placeholderLab ==nil) {
        self.placeholderLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, kScreenW-30, 20)];
        self.placeholderLab.font = [UIFont systemFontOfSize:14];
        self.placeholderLab.textAlignment = NSTextAlignmentLeft;
        self.placeholderLab.text = @"请输入申诉理由";
        self.placeholderLab.textColor = RGB(10, 31, 55,0.56);
    }
    return _placeholderLab;
}
- (UILabel *)stirngLenghLabel
{
    if (_stirngLenghLabel ==nil) {
        self.stirngLenghLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2, 223, kScreenW/2-15, 17)];
        self.stirngLenghLabel.font = [UIFont systemFontOfSize:12];
        self.stirngLenghLabel.textAlignment = NSTextAlignmentRight;
        self.stirngLenghLabel.text = @"0/1000";
        self.stirngLenghLabel.textColor = RGB(10, 31, 55,0.56);
        //        self.stirngLenghLabel.backgroundColor = [UIColor redColor];
        
    }
    return _stirngLenghLabel;
}
-(UIView *)imageBackView
{
    if (_imageBackView == nil) {
        self.imageBackView =[[UIView alloc]initWithFrame:CGRectMake(0, maxY(self.adviceTextView)+5, kScreenW, 117)];
        self.imageBackView.backgroundColor = [UIColor whiteColor];
        
    }
    return _imageBackView;
}
- (UILabel *)addLabel
{
    if (_addLabel ==nil) {
        self.addLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, kScreenW - 30, 20)];
        self.addLabel.font = [UIFont systemFontOfSize:14];
        self.addLabel.textAlignment = NSTextAlignmentLeft;
        self.addLabel.text = @"添加图片(最多添加3张,可不添加)";
        self.addLabel.textColor = RGB(10, 31, 55,0.56);
    }
    return _addLabel;
}

-(UIImageView *)addImage1
{
    if (_addImage1 == nil) {
        _addImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, maxY(_addLabel)+7, 70, 70)];
        _addImage1.image = [UIImage imageNamed:@"添加照片"];
    }
    return _addImage1;
}

-(UIImageView *)addImage2
{
    if (_addImage2 == nil) {
        _addImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(maxX(_addImage1)+10, maxY(_addLabel)+7, 70, 70)];
        _addImage2.image = [UIImage imageNamed:@"添加照片"];
        _addImage2.hidden = YES;
        
    }
    return _addImage2;
}
-(UIImageView *)addImage3
{
    if (_addImage3 == nil) {
        _addImage3 = [[UIImageView alloc] initWithFrame:CGRectMake(maxX(_addImage2)+10, maxY(_addLabel)+7, 70, 70)];
        _addImage3.image = [UIImage imageNamed:@"添加照片"];
        _addImage3.hidden = YES;
    }
    return _addImage3;
}

-(UIImageView *)promptImage
{
    if (_promptImage == nil) {
        _promptImage = [[UIImageView alloc] initWithFrame:CGRectMake(16, maxY(_imageBackView)+16, 14, 14)];
        _promptImage.image = [UIImage imageNamed:@"礼物"];
    }
    return _promptImage;
}
- (UILabel *)promptLabel
{
    if (_promptLabel ==nil) {
        self.promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(maxX(self.promptImage)+8, maxY(_imageBackView)+13, kScreenW/2, 20)];
        self.promptLabel.font = [UIFont systemFontOfSize:15];
        self.promptLabel.textAlignment = NSTextAlignmentLeft;
        self.promptLabel.text = @"警告";
        self.promptLabel.textColor = RGB(10, 31, 55,1);
    }
    return _promptLabel;
}
- (UILabel *)promptShowLabel
{
    if (_promptShowLabel ==nil) {
        self.promptShowLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, maxY(_promptLabel)+3, kScreenW-30, 60)];
        self.promptShowLabel.font = [UIFont systemFontOfSize:14];
        self.promptShowLabel.textAlignment = NSTextAlignmentLeft;
        self.promptShowLabel.text = @"提起申诉后资产将会冻结,申诉专员将介入本次交易,直至申诉结束.恶意申诉属于扰乱平台正常运营的行为,情节严重将冻结账户";
        self.promptShowLabel.textColor = RGB(10, 31, 55,0.56);
        self.promptShowLabel.numberOfLines = 0;
    }
    return _promptShowLabel;
}

-(UIButton *)nextBtn
{
    if (_nextBtn == nil) {
        self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBtn.frame = CGRectMake(15, maxY(self.promptShowLabel)+24, kScreenW-30, 45);
        [self.nextBtn setTitle:@"提交" forState:UIControlStateNormal];
        self.nextBtn.backgroundColor = RGB(179, 186, 201, 1);
        self.nextBtn.layer.cornerRadius = 1;
    }
    return _nextBtn;
}





@end
