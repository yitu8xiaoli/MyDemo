//
//  orderView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/15.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface orderView : UIView

@property (nonatomic,strong)UIScrollView *backScrollview;//背景
@property (nonatomic,strong)UIImageView *headView;//上部view
@property (nonatomic,strong)UILabel *paidLab;//待支付
@property (nonatomic,strong)UIImageView *timeImage;//倒计时图片
@property (nonatomic,strong)UILabel *timeLab;//倒计时lab
@property (nonatomic,strong)UILabel *paidShowLab;//

@property (nonatomic,strong)UIImageView *orderBackImage;//待支付

@property (nonatomic,strong)UILabel *accountName;//付款账户提醒
@property (nonatomic,strong)UILabel *accountMoneyLab;//金额
@property (nonatomic,strong)UILabel *tradingPriceLab;//交易单价
@property (nonatomic,strong)UILabel *tradingNumberLab;//交易数量

@property (nonatomic,strong)UIImageView *cardImage;//银行卡图标
@property (nonatomic,strong)UILabel *cardlab;//银行卡
@property (nonatomic,strong)UIButton *switchBtn;//切换按钮
@property (nonatomic,strong)UIImageView *arrowImage;//箭头
@property (nonatomic,strong)UIView *lineView;//横线
@property (nonatomic,strong)UILabel *cardMessigeLab;//银行卡信息
@property (nonatomic,strong)UILabel *cardNameLab;//银行卡名字
@property (nonatomic,strong)UILabel *cardBranchLab;//银行卡支行地址


@property (nonatomic,strong)UILabel *payeeLab;//收款人
@property (nonatomic,strong)UILabel *payeeNameLab;//姓名
@property (nonatomic,strong)UIImageView *copOneImage;//复制图片
@property (nonatomic,strong)UILabel *cardNumberLab;//银行卡卡号
@property (nonatomic,strong)UILabel *cardNumberShowLab;//银行卡卡号展示
@property (nonatomic,strong)UIImageView *copTwoImage;//
@property (nonatomic,strong)UILabel *referenceLab;//参考号
@property (nonatomic,strong)UIImageView *referenceImage;//参考号问好图片
@property (nonatomic,strong)UILabel *referenceShowLab;//参考号展示
@property (nonatomic,strong)UIImageView *copThreeImage;//
@property (nonatomic,strong)UIView *lineReferenceView;//横线
@property (nonatomic,strong)UILabel *PaymentLab;//付款提醒
@property (nonatomic,strong)UIButton *cancelBtn;//取消订单
@property (nonatomic,strong)UIButton *determineBtn;//我已付款


@property (nonatomic,strong)UIImageView *promptImage;//提示
@property (nonatomic,strong)UILabel *promptLab;//温馨提示
@property (nonatomic,strong)UILabel *promptOneLab;//提示
@property (nonatomic,strong)UILabel *promptTwoLab;//提示
@property (nonatomic,strong)UILabel *promptThreeLab;//提示



@end
