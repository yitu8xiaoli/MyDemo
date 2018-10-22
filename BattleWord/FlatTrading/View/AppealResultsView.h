//
//  AppealResultsView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/19.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppealResultsView : UIView

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

//申诉原因
@property (nonatomic,strong)UIView  *midView;

@property (nonatomic,strong)UILabel *appealResonLab;//申诉原因
@property (nonatomic,strong)UILabel *appealResonShowLab;//申诉原因展示
@property (nonatomic,strong)UILabel *appealDetailLab;//申诉理由
@property (nonatomic,strong)UILabel *appealDetailShowLab;//申诉理由展示
@property (nonatomic,strong)UILabel *appealImageLab;//申诉图片
@property (nonatomic,strong)UIImageView *appealOneImage;//申诉图片
@property (nonatomic,strong)UIImageView *appealTwoImage;//申诉图片
@property (nonatomic,strong)UIImageView *appealThreeImage;//申诉图片

@property (nonatomic,strong)UILabel *appealTime;//申诉时间
@property (nonatomic,strong)UILabel *appealShowTime;//申诉时间展示

//状态
@property (nonatomic,strong)UIView  *bottomView;
@property (nonatomic,strong)UILabel *dealStateLab;//处理状态
@property (nonatomic,strong)UILabel *dealStateShowLab;//处理状态展示
@property (nonatomic,strong)UILabel *dealCustomerLab;//客服处理
@property (nonatomic,strong)UILabel *dealCustomerShowLab;//客服处理展示
@property (nonatomic,strong)UILabel *dealResultLab;//处理结果
@property (nonatomic,strong)UILabel *dealResultShowLab;//处理结果展示
@property (nonatomic,strong)UILabel *dealTimeLab;//处理时间
@property (nonatomic,strong)UILabel *dealTimeShowLab;//处理时间展示

@end
