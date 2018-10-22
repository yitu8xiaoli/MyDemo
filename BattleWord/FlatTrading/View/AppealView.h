//
//  AppealView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/18.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppealView : UIView

@property (nonatomic,strong)UIScrollView *backScrollview;//背景


@property (nonatomic,strong)UIView  *headView;
@property (nonatomic,strong)UIImageView *leftImage;//购买标记
@property (nonatomic,strong)UILabel *titleLab;//币种名称
@property (nonatomic,strong)UILabel *timeLab;//时间
@property (nonatomic,strong)UILabel *priceLab;//单价
@property (nonatomic,strong)UILabel *priceShowLab;//单价
@property (nonatomic,strong)UILabel *numberLab;//数量
@property (nonatomic,strong)UILabel *numberShow;//
@property (nonatomic,strong)UILabel *totalMoneyLab;//总额
@property (nonatomic,strong)UILabel *totalMoneyShowLab;//



@property (nonatomic,strong)UIView  *resonView;//申诉理由背景
@property (nonatomic,strong)UILabel *resonLab;//原因
@property (nonatomic,strong)UILabel *resonShowLab;//原因

@property (nonatomic,strong)UIImageView *resonArrow;//箭头


@property (nonatomic,strong)UITextView *adviceTextView;
@property (nonatomic,strong)UILabel *placeholderLab;//占位
@property (nonatomic,strong)UILabel  *stirngLenghLabel;//数字显示

@property (nonatomic,strong)UIView  *imageBackView;//背景
@property (nonatomic,strong)UILabel  *addLabel;
@property (nonatomic,strong)UIImageView  *addImage1;//添加图片显示
@property (nonatomic,strong)UIImageView  *addImage2;//添加图片显示
@property (nonatomic,strong)UIImageView  *addImage3;//添加图片显示

@property (nonatomic,strong)UIImageView  *promptImage;//提示图片
@property (nonatomic,strong)UILabel  *promptLabel;//提示
@property (nonatomic,strong)UILabel  *promptShowLabel;//提示

@property (nonatomic,strong)UIButton  *nextBtn;//提示







@end
