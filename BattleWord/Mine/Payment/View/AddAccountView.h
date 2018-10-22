//
//  AddAccountView.h
//  ProjectFramework
//
//  Created by 中链 on 2018/9/30.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAccountView : UIView
@property (nonatomic,strong)UIView *headView;//上部view
@property (nonatomic,strong)UILabel *nameLab;//姓名
@property (nonatomic,strong)UITextField *nameText;//姓名输入
@property (nonatomic,strong)UILabel *idLab;//账号
@property (nonatomic,strong)UITextField *idText;//账号输入
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic,strong)UILabel *promptLab;//提示
@property (nonatomic,strong)UIImageView *addImage;//

@property (nonatomic,strong)UIButton *nextBtn;//
@end
