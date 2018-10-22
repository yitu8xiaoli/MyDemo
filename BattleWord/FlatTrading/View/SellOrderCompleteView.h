//
//  SellOrderCompleteView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/19.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SellOrderCompleteView : UIView

@property (nonatomic,strong)UIImageView *headView;//上部view
@property (nonatomic,strong)UILabel *paidLab;//取消
@property (nonatomic,strong)UILabel *paidShowLab;//

@property (nonatomic,strong)UIImageView *orderBackImage;//背景图

@property (nonatomic,strong)UILabel *accountName;//交易总额
@property (nonatomic,strong)UILabel *accountMoneyLab;//金额
@property (nonatomic,strong)UILabel *tradingPriceLab;//交易单价
@property (nonatomic,strong)UILabel *tradingNumberLab;//交易数量

@property (nonatomic,strong)UILabel *MessigeLab;//卖家
@property (nonatomic,strong)UILabel *NameLab;//名字

@property (nonatomic,strong)UILabel *orderTimeLab;//下单时间
@property (nonatomic,strong)UILabel *orderTimeShowLab;//展示

@property (nonatomic,strong)UILabel *orderNumberLab;//下单编号
@property (nonatomic,strong)UILabel *orderNumberShowLab;//展示



@property (nonatomic,strong)UILabel *referenceLab;//参考号
@property (nonatomic,strong)UIImageView *referenceImage;//参考号问好图片
@property (nonatomic,strong)UILabel *referenceShowLab;//参考号展示
@end
