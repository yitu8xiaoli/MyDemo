//
//  NameCertificationViewController.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/11.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSBaseViewController.h"

@interface NameCertificationViewController : LSBaseViewController
@property (nonatomic,strong)UILabel *idPromptLab;//身份证正面拍照提示
@property (nonatomic,strong)UILabel *idPrompt2Lab;//身份证正面拍照提示

@property (nonatomic,strong)UIImageView *positiveImage;//身份证正面
@property (nonatomic,strong)UILabel *idReversePromptLab;//身份证反面拍照提示
@property (nonatomic,strong)UILabel *idReversePrompt2Lab;//身份证反面拍照提示

@property (nonatomic,strong)UIImageView *reverseImage;//身份证反面



@end
