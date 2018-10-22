//
//  BatterAlertView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/17.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BatterAlertView : UIView
@property (nonatomic,strong)UIView *backView;//背景

@property (nonatomic,strong)UILabel *titleLab;//标题
@property (nonatomic,strong)UILabel *contentLab;//内容
@property (nonatomic,strong)UILabel *prometLab;//提醒
@property (nonatomic,strong)UIView *lineOneView;//横线

@property (nonatomic,strong)UIView *lineTwoView;//竖线

@property (nonatomic,strong)UIButton *cancelBtn;//取消
@property (nonatomic,strong)UIButton *detertionBtn;//确定


@end
