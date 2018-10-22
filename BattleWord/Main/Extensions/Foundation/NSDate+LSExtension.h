//
//  NSDate+lsExtension.h
//  Project
//
//  Created by 李帅 on 2017/4/17.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LSExtension)

#pragma mark - 获取日月年，周几

/**
 获取日
 */
- (NSUInteger)ls_day;
+ (NSUInteger)ls_day:(NSDate *)date;

- (NSUInteger)ls_month;
+ (NSUInteger)ls_month:(NSDate *)date;

- (NSUInteger)ls_year;
+ (NSUInteger)ls_year:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)ls_daysInYear;
+ (NSUInteger)ls_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)ls_isLeapYear;
+ (BOOL)ls_isLeapYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)ls_formatYMD;
+ (NSString *)ls_formatYMD:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)ls_weekday;
+ (NSInteger)ls_weekday:(NSDate *)date;

#pragma mark - 日期加减

/**
 日期加减法

 @param year 年
 @param month 月
 @param day 日
 @return 返回计算以后的日期
 */
- (NSDate *)ls_addWithYear:(NSInteger)year
                  month:(NSInteger)month
                    day:(NSInteger)day;

/**
 日期计算

 @param year 加或减N年以后今天的日期
 @return NSDate
 */
- (NSDate *)ls_addWithYear:(NSInteger)year;

/**
 日期计算

 @param month 加或减N月以后今天的日期
 @return NSDate
 */
- (NSDate *)ls_addWithMonth:(NSInteger)month;

/**
 日期计算

 @param day 加或减N天以后今天的日期
 @return NSDate
 */
- (NSDate *)ls_addWithDay:(NSInteger)day;

#pragma mark - 节日判断

/**
 阴历中国传统节日获取

 @param date date
 @return 返回节日
 */
+ (NSString *)ls_lunarHoliDayWithDate:(NSDate *)date;

/**
 阳历节日

 @param date date
 @return 返回节日
 */
+ (NSString *)ls_sunHoliDayWithDate:(NSDate *)date;
@end
