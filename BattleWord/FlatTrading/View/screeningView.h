//
//  screeningView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/12.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface screeningView : UIView

@property (nonatomic,strong)UILabel *businessTypeLab;//商家类型
@property (nonatomic,strong)UIButton *allBussnessTypeBtn;//全部
@property (nonatomic,strong)UIButton *seniorBtn;//高级认证


@property (nonatomic,strong)UILabel *tradingLab;//交易金额
@property (nonatomic,strong)UIButton *alltradingTypeBtn;//全部
@property (nonatomic,strong)UIButton *fiveBtn;//五万
@property (nonatomic,strong)UIButton *tenBtn;//十万以上
@property (nonatomic,strong)UIButton *twentyBtn;//二十万以上

@property (nonatomic,strong)UILabel *payStyleLab;//支付方式
@property (nonatomic,strong)UIButton *allpayTypeBtn;//全部
@property (nonatomic,strong)UIButton *cardBtn;//银行卡
@property (nonatomic,strong)UIButton *zhiBtn;//支付宝
@property (nonatomic,strong)UIButton *wechatBtn;//微信



@property (nonatomic,strong)UIButton *resetBtn;//重置
@property (nonatomic,strong)UIButton *screenBtn;//筛选


@end
