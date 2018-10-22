//
//  UILabel+LSLabel.m
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/21.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "UILabel+LSLabel.h"

@implementation UILabel_LSLabel

- (void)LabelClick:(id)target action:(SEL)action
{
    self.userInteractionEnabled  = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}


-(void)setFontWithFirstColor:(UIColor *)firstColor FirstFontSize:(NSInteger)firstFontsize SecondColor:(UIColor *)secondColor SecondFontSize:(NSInteger)secondFontsize locationTag:(NSInteger)tag
{

    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSForegroundColorAttributeName value:firstColor range:NSMakeRange(0,tag)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:firstFontsize] range:NSMakeRange(0,tag)];

    [str addAttribute:NSForegroundColorAttributeName value:secondColor range:NSMakeRange(tag,self.text.length-tag)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:secondFontsize] range:NSMakeRange(tag,self.text.length-tag)];

    self.attributedText = str;
}


@end
