//
//  NSDate+lsExtension.m
//  Project
//
//  Created by 李帅 on 2017/4/17.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import "NSDate+LSExtension.h"

@implementation NSDate (LSExtension)

#pragma mark - 获取日月年，周几

- (NSUInteger)ls_day {
    return [NSDate ls_day:self];
}

- (NSUInteger)ls_month {
    return [NSDate ls_month:self];
}

- (NSUInteger)ls_year {
    return [NSDate ls_year:self];
}

+ (NSUInteger)ls_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
    return [dayComponents day];
}

+ (NSUInteger)ls_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
    return [dayComponents month];
}

+ (NSUInteger)ls_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
    return [dayComponents year];
}


- (NSUInteger)ls_daysInYear {
    return [NSDate ls_daysInYear:self];
}

+ (NSUInteger)ls_daysInYear:(NSDate *)date {
    return [self ls_isLeapYear:date] ? 366 : 365;
}

- (BOOL)ls_isLeapYear {
    return [NSDate ls_isLeapYear:self];
}

+ (BOOL)ls_isLeapYear:(NSDate *)date {
    NSUInteger year = [date ls_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)ls_formatYMD {
    return [NSDate ls_formatYMD:self];
}

+ (NSString *)ls_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",[date ls_year],[date ls_month], [date ls_day]];
}

- (NSInteger)ls_weekday {
    return [NSDate ls_weekday:self];
}

+ (NSInteger)ls_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

#pragma mark - 日期加减

- (NSDate *)ls_addWithYear:(NSInteger)year
                  month:(NSInteger)month
                    day:(NSInteger)day {
    NSCalendar *tcalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [tcalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    return [tcalendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
}

- (NSDate *)ls_addWithYear:(NSInteger)year {
    return [self ls_addWithYear:year month:0 day:0];
}

- (NSDate *)ls_addWithMonth:(NSInteger)month {
    return [self ls_addWithYear:0 month:month day:0];
}

- (NSDate *)ls_addWithDay:(NSInteger)day {
    return [self ls_addWithYear:0 month:0 day:day];
}

#pragma mark - 节日判断

+ (NSString *)ls_lunarHoliDayWithDate:(NSDate *)date {
    NSTimeInterval timeInterval_day = (float)(60*60*24);
    NSDate *nextDay_date = [NSDate dateWithTimeInterval:timeInterval_day sinceDate:date];
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:nextDay_date];
    if ( 1 == localeComp.month && 1 == localeComp.day ) {
        return @"除夕";
    }
    NSDictionary *chineseHoliDay = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"春 节", @"1-1",
                                    @"元宵节", @"1-15",
                                    @"端午节", @"5-5",
                                    @"七夕", @"7-7",
                                    @"中秋节", @"8-15",
                                    @"重阳节", @"9-9",
                                    @"腊 八", @"12-8",
                                    @"小 年", @"12-24",
                                    nil];
    
    localeComp = [localeCalendar components:unitFlags fromDate:date];
    NSString *key_str = [NSString stringWithFormat:@"%zd-%zd",localeComp.month,localeComp.day];
    return [chineseHoliDay objectForKey:key_str];
}

+ (NSString *)ls_sunHoliDayWithDate:(NSDate *)date {
    NSTimeInterval timeInterval_day = (float)(60*60*24);
    NSDate *nextDay_date = [NSDate dateWithTimeInterval:timeInterval_day sinceDate:date];
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:nextDay_date];
    NSDictionary *chineseHoliDay = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"元 旦", @"1-1",
                                    @"情人节", @"2-14",
                                    @"愚人节", @"4-1",
                                    @"劳动节", @"5-1",
                                    @"儿童节", @"6-1",
                                    @"国庆节", @"10-1",
                                    @"平安夜", @"12-24",
                                    @"圣诞节", @"12-25",
                                    nil];
    
    localeComp = [localeCalendar components:unitFlags fromDate:date];
    NSString *key_str = [NSString stringWithFormat:@"%zd-%zd",localeComp.month,localeComp.day];
    return [chineseHoliDay objectForKey:key_str];
}

@end
