//
//  OrderListTableViewCell.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *leftImage;//购买标记
@property (nonatomic,strong)UILabel *titleLab;//币种名称
@property (nonatomic,strong)UILabel *timeLab;//时间
@property (nonatomic,strong)UILabel *payStateLab;//支付状态
@property (nonatomic,strong)UILabel *priceLab;//单价
@property (nonatomic,strong)UILabel *priceShowLab;//单价
@property (nonatomic,strong)UILabel *numberLab;//数量
@property (nonatomic,strong)UILabel *numberShow;//
@property (nonatomic,strong)UILabel *totalMoneyLab;//总额
@property (nonatomic,strong)UILabel *totalMoneyShowLab;//

@property (nonatomic,strong)UIView *lineView;//横线
@property (nonatomic,strong)UIImageView *timeImage;//倒计时图标
@property (nonatomic,strong)UILabel *countdownLab;//倒计时
@property (nonatomic,strong)UILabel *promptLab;//提示
@property (nonatomic,strong)UIButton *complaintBtn;//申诉
@property (nonatomic,strong)UIButton *determineBtn;//确认放币


@end
