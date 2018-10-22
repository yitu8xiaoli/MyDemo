//
//  UILabel+LSLabel.h
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/21.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel_LSLabel : UILabel

/**

 lab添加点击事件
 
 */
- (void)LabelClick:(id)target action:(SEL)action;




/**
 根据传入下标
 字体前后两部分不同的
 颜色,
 大小
 */
-(void)setFontWithFirstColor:(UIColor *)firstColor FirstFontSize:(NSInteger)firstFontsize SecondColor:(UIColor *)secondColor SecondFontSize:(NSInteger)secondFontsize locationTag:(NSInteger)tag;

/**
 根据需求灵活添加方法
 */

@end
