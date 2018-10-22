//
//  FiatTradingTableViewCell.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/12.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiatTradingTableViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *headImage;//头像
@property (nonatomic,strong)UILabel *nameLab;//名字
@property (nonatomic,strong)UILabel *allMoneyLab;//金额
@property (nonatomic,strong)UILabel *tradingDataLab;//交易数据
@property (nonatomic,strong)UILabel *numberLab;//交易数量
@property (nonatomic,strong)UIImageView *payOneImage;//交易方式展示
@property (nonatomic,strong)UIImageView *payTwoImage;
@property (nonatomic,strong)UIImageView *payThreeImage;
@property (nonatomic,strong)UILabel *limitLab;//限额







@end
