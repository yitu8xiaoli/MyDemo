//
//  NameAuthenticationView.h
//  ProjectFramework
//
//  Created by apple on 2018/9/28.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameAuthenticationView : UIView

@property (nonatomic,strong)UIScrollView *backScrollview;//背景
@property (nonatomic,strong)UIView *headView;//上部view
@property (nonatomic,strong)UILabel *nameLab;//姓名
@property (nonatomic,strong)UITextField *nameText;//姓名输入
@property (nonatomic,strong)UILabel *idLab;//身份证
@property (nonatomic,strong)UITextField *idText;//身份证输入
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic,strong)UILabel *promptLab;//提示
@property (nonatomic,strong)UIButton *finshBtn;//完成





@property (nonatomic,strong)UILabel *idPromptLab;//身份证正面拍照提示
@property (nonatomic,strong)UIImageView *positiveImage;//身份证正面
@property (nonatomic,strong)UILabel *idReversePromptLab;//身份证反面拍照提示

@property (nonatomic,strong)UIImageView *reverseImage;//身份证反面


@end
