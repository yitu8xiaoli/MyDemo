//
//  UIColor+LSExtension.h
//  Project
//
//  Created by 李帅 on 2017/3/3.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LSExtension)

#pragma mark - hex
+ (UIColor *)ls_colorWithHex:(UInt32)hex;
+ (UIColor *)ls_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)ls_colorWithHexString:(NSString *)hexString;
- (NSString *)ls_HEXString;

#pragma mark - RGB
///值不需要除以255.0
+ (UIColor *)ls_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)ls_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue;



@end
