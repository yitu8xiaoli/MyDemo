//
//  BuyView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/12.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+LSLabel.h"

@interface BuyView : UIView

@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong)UIView *backView;

@property (nonatomic,strong)UIButton *cancelBtn;//取消
@property (nonatomic,strong)UILabel *buyNameLab;//购买
@property (nonatomic,strong)UILabel *priceLab;//价格
@property (nonatomic,strong)UIImageView *headImage;//头像
@property (nonatomic,strong)UILabel *nameLab;//名字
@property (nonatomic,strong)UIImageView *payOneImage;//交易方式展示
@property (nonatomic,strong)UIImageView *payTwoImage;
@property (nonatomic,strong)UIImageView *payThreeImage;
@property (nonatomic,strong)UILabel_LSLabel *tradeLab;//交易单
@property (nonatomic,strong)UILabel_LSLabel *closingLab;//成交率
@property (nonatomic,strong)UILabel_LSLabel *putCoinTimeLab;//放币时效


//
@property (nonatomic,strong)UILabel *amountLab;//金额
@property (nonatomic,strong)UITextField *amountText;//金额输入
@property (nonatomic,strong)UIView *lineAmountView;//竖线
@property (nonatomic,strong)UIButton *allPutBtn;//全部输入

@property (nonatomic,strong)UIView *myLine;//横线

@property (nonatomic,strong)UILabel *numberLab;//数量
@property (nonatomic,strong)UITextField *numberText;//数量输入
@property (nonatomic,strong)UIView *lineNumberView;//竖线
@property (nonatomic,strong)UIButton *allNumberBtn;//全部输入


@property (nonatomic,strong)UIButton *buyBtn;//买入

@end
