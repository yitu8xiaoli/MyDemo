//
//  LanguageViewController.h
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "LSBaseViewController.h"

typedef void(^langusgeBlock)(NSString *);
@interface LanguageViewController : LSBaseViewController

@property (nonatomic,copy)langusgeBlock langBlock;

-(void)returnLang:(langusgeBlock)langBlock;

@property (nonatomic,strong)NSString *langTag;


@end
