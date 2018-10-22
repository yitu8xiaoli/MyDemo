//
//  UserFeedbackView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/8.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserFeedbackView : UIView
@property (nonatomic,strong)UIScrollView *backScrollview;//背景
@property (nonatomic,strong)UITextView *adviceTextView;
@property (nonatomic,strong)UILabel *placeholderLab;//占位
@property (nonatomic,strong)UILabel  *stirngLenghLabel;//数字显示

@property (nonatomic,strong)UIView  *imageBackView;//背景
@property (nonatomic,strong)UILabel  *addLabel;
@property (nonatomic,strong)UIImageView  *addImage1;//添加图片显示
@property (nonatomic,strong)UIImageView  *addImage2;//添加图片显示
@property (nonatomic,strong)UIImageView  *addImage3;//添加图片显示

@property (nonatomic,strong)UITextView  *contactTextView;//联系背景
@property (nonatomic,strong)UILabel *placeholderContactLab;//占位

@property (nonatomic,strong)UIImageView  *promptImage;//提示图片
@property (nonatomic,strong)UILabel  *promptLabel;//提示
@property (nonatomic,strong)UILabel  *promptShowLabel;//提示

@property (nonatomic,strong)UIButton  *nextBtn;//提示

@end
