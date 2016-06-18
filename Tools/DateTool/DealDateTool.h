//
//  DealDateTool.h
//  BabyButtonProduct
//
//  Created by 徐立生 on 15/12/26.
//  Copyright © 2015年 DeveloperXLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DealDateTool : NSObject

#pragma mark - 根据给定的时间，获取对应的日期值
//获取给定时间的号数
+ (NSUInteger)backDayWithDate:(NSDate *)tempDate;

//获取给定时间的月
+ (NSUInteger)backMonthWithDate:(NSDate *)tempDate;

//获取给定时间的年
+ (NSUInteger)backYearWithDate:(NSDate *)tempDate;

//获取指定日期的星期
+ (NSUInteger)backWeekNumWithDate:(NSDate *)tempDate;
+ (NSUInteger)backWeekNumOfChineseWith:(NSDate *)tempDate;
+ (NSString *)backWeekStringWithDate:(NSDate *)tempDate;

//获取指定月份第一天的日期
+ (NSDate *)backFirstDayDateInMonthFromDate:(NSDate *)tempDate;
+ (NSString *)backFirstDayDateInMonthFromDate:(NSDate *)tempDate withFormat:(NSString *)format;

//获取指定月份最后一天的日期
+ (NSDate *)backLastDayDateInMonthFromDate:(NSDate *)tempDate;
+ (NSString *)backLastDayDateInMonthFromDate:(NSDate *)tempDate withFormat:(NSString *)format;

#pragma mark 日期的计算
//计算一个月中包含多少周
+ (NSUInteger)backWeekCountInAMonthWithDate:(NSDate *)tempDate;

//获取月份的总天数
+ (NSUInteger)backTotalDayInAMonthWithDate:(NSDate *)tempDate;

#pragma mark 日期的变更，转换
//date转换成指定格式的string
+ (NSString *)stringFromDate:(NSDate *)tempDate withFormat:(NSString *)format;

//string转化成date
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

//获取指定日期的前一天
+ (NSDate *)backBeforeADayDateFromDate:(NSDate *)tempDate;
+ (NSString *)backBeforeADayDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format;

//获取指定日期的下一天
+ (NSDate *)backAfterADayDateFromDate:(NSDate *)tempDate;
+ (NSString *)backAfterADayDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format;

//获取指定日期的前一个月
+ (NSDate *)backBeforeAMonthDateFromDate:(NSDate *)tempDate;
+ (NSString *)backBeforeAMonthDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format;

//获取指定日期的下一个月
+ (NSDate *)backAfterAMonthDateFromDate:(NSDate *)tempDate;
+ (NSString *)backAfterAMonthDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format;

#pragma mark - 时间格式处理
/*
 * @method         替换日期格式
 * @tempContent    日期内容
 * @tempCurrent    要替换的内容
 * @tempReplace    新的内容
 * @例子   @"2015-06-12"改成@"2015.06.12"  那么tempCurrent = @"-" tempReplace = @"."
 */
+ (NSString*)modifyDateStringFormatWithContent:(NSString *)tempContent
                                 currentString:(NSString *)tempCurrent
                               byReplaceString:(NSString *)tempReplace;

/*
 * @method      时间戳转成时间
 * @timeStr     时间戳内容
 * @tempFormat  转成时间后的时间格式
 * @例子    如把时间戳转成@"2015-06-12"  那么tempFormat = @“YYYY-MM-dd”;
 */
+ (NSString *)getTimeStringWith:(NSString *)timeStr withFormat:(NSString *)tempFormat;

//时间转时间戳
+ (long long)getLongWithDate:(NSDate *)tempDate;

//时间转时间戳
+ (long long)getLongWithDateString:(NSString *)tempDateString;

@end
