//
//  SellOrderWaitPaymentView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/19.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SellOrderWaitPaymentView : UIView

@property (nonatomic,strong)UIScrollView *backScrollview;//背景

@property (nonatomic,strong)UIImageView *headView;//上部view
@property (nonatomic,strong)UILabel *paidLab;//取消

@property (nonatomic,strong)UIImageView *timeImage;//倒计时图片
@property (nonatomic,strong)UILabel *timeLab;//倒计时lab
@property (nonatomic,strong)UILabel *paidShowLab;//

@property (nonatomic,strong)UIImageView *orderBackImage;//背景图

@property (nonatomic,strong)UILabel *accountName;//交易总额
@property (nonatomic,strong)UILabel *accountMoneyLab;//金额
@property (nonatomic,strong)UILabel *tradingPriceLab;//交易单价
@property (nonatomic,strong)UILabel *tradingNumberLab;//交易数量

@property (nonatomic,strong)UILabel *MessigeLab;//卖家
@property (nonatomic,strong)UILabel *NameLab;//名字

@property (nonatomic,strong)UIImageView *copOneImage;//复制图片

@property (nonatomic,strong)UILabel *orderTimeLab;//下单时间
@property (nonatomic,strong)UILabel *orderTimeShowLab;//展示

@property (nonatomic,strong)UILabel *orderNumberLab;//下单编号
@property (nonatomic,strong)UILabel *orderNumberShowLab;//展示




@property (nonatomic,strong)UILabel *referenceLab;//参考号
@property (nonatomic,strong)UIImageView *referenceImage;//参考号问好图片
@property (nonatomic,strong)UILabel *referenceShowLab;//参考号展示



@property (nonatomic,strong)UIView *lineView;//线
@property (nonatomic,strong)UILabel *remindLab;//提醒

@property (nonatomic,strong)UIButton *cancelBtn;//申诉,
@property (nonatomic,strong)UIButton *determineBtn;//确认放行

@property (nonatomic,strong)UIImageView *promptImage;//提示
@property (nonatomic,strong)UILabel *promptLab;//温馨提示
@property (nonatomic,strong)UILabel *promptOneLab;//提示
@property (nonatomic,strong)UILabel *promptTwoLab;//提示
@property (nonatomic,strong)UILabel *promptThreeLab;//提示
@end
