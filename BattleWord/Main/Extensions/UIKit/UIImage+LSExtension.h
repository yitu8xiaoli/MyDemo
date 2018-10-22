//
//  UIImage+LSExtension.h
//  Project
//
//  Created by 李帅 on 2017/3/8.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LSExtension)

/**
 给图片加一个高斯模糊效果

 @param blur 模糊值
 @return UIImage
 */
- (UIImage *)ls_boxblurImageWithBlur:(CGFloat)blur;

+ (UIImage *)ls_imageWithColor:(UIColor *)color;

+ (UIImage *)ls_imageWithColor:(UIColor *)color alpha:(CGFloat)alpha;

@end
