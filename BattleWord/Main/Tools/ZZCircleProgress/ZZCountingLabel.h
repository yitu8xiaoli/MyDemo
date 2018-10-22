//
//  ZZCountingLabel.h
//  动画测试
//
//  Created by 李帅 on 2017/6/29.
//  Copyright © 2017年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZCountingLabel : UILabel

@property (nonatomic, assign) CGFloat duration;

- (void)countingFrom:(CGFloat)fromValue to:(CGFloat)toValue;
- (void)countingFrom:(CGFloat)fromValue to:(CGFloat)toValue duration:(CGFloat)duration;

@end
