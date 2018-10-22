//
//  OtherOrderTableViewCell.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/16.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherOrderTableViewCell : UITableViewCell
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
@end
