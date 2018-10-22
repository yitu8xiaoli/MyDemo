//
//  NSString+lsExtension.h
//  Project
//
//  Created by 李帅 on 2017/2/10.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LSExtension)

#pragma mark - 字符串长宽计算

/**
 根据相应的宽度求出对应string的size

 @param string 字符
 @param width 宽度
 @param font 字体
 @return size
 */
+ (CGSize)ls_caculateHeightOfString:(NSString *)string
                       withMaxWidth:(CGFloat)width
                           withFont:(UIFont *)font;

#pragma mark - 汉字相关操作

/**
 汉字转拼音

 @param chineseString 汉字字符串
 @return 返回拼音字符串
 */
+ (NSString *)ls_chineseToPinyin:(NSString *)chineseString;

/**
 汉字转拼音，带有声调

 @param chineseString 汉字字符串
 @return 返回带有声调的拼音字符串
 */
+ (NSString *)ls_chineseToPinyinWithShengDiao:(NSString *)chineseString;

/**
 检测是否是纯汉字
 
 @param chineseString 汉字串
 @return YES or NO
 */
+ (BOOL)ls_isChinese:(NSString *)chineseString;

#pragma mark - 常规校验

/**
 手机号是否合法

 @param telNumber 手机号码
 @return 格式是否正确
 */
+ (BOOL)ls_checkTelNumberValidate:(NSString *)telNumber;

/**
 身份证号匹配
 
 @param identityNum 身份证号
 @return 格式是否正确
 */
+ (BOOL)ls_checkIdentityValidate:(NSString *)identityNum;

/**
 获取当前时间
 
 @return 返回时间
 */
+ (NSString *)ls_getCurrentTime;

#pragma mark - 标识符获取

// 获取Mac地址
+ (NSString *)ls_getMacString;
// 获取idfa标识符
+ (NSString *)ls_getIdfaString;
// 获取idfv标识符
+ (NSString *)ls_getIdfvString;
/**
 自动生成属性申明的 Code
 
 @param dict 传入的属性字典
 */
+ (void)jd_propertyCodeWithDictionary:(NSDictionary *)dict;







@end
