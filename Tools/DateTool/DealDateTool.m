//
//  DealDateTool.m
//  BabyButtonProduct
//
//  Created by 徐立生 on 15/12/26.
//  Copyright © 2015年 DeveloperXLS. All rights reserved.
//

#import "DealDateTool.h"

@implementation DealDateTool

#pragma mark - 根据给定的时间，获取对应的日期值
//获取给定时间的号数
+ (NSUInteger)backDayWithDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitDay) fromDate:tempDate];
    NSUInteger dayNum = [comps day];
    
    return dayNum;
}

//获取给定时间的月
+ (NSUInteger)backMonthWithDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitMonth) fromDate:tempDate];
    NSUInteger nowMonth = [comps month];
    
    return nowMonth;
}

//获取给定时间的年
+ (NSUInteger)backYearWithDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitYear) fromDate:tempDate];
    NSUInteger nowYear = [comps year];
    
    return nowYear;
}

//获取指定日期的星期
+ (NSUInteger)backWeekNumWithDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitWeekday) fromDate:tempDate];
    NSUInteger weekDay = [comps weekday];
    
    return weekDay;
}

+ (NSUInteger)backWeekNumOfChineseWith:(NSDate *)tempDate {
    NSUInteger weekDay = [self backWeekNumWithDate:tempDate];
    NSUInteger weekNum = 0;
    switch (weekDay) {
        case 1:
            weekNum = 7;
            break;
        case 2:
            weekNum = 1;
            break;
        case 3:
            weekNum = 2;
            break;
        case 4:
            weekNum = 3;
            break;
        case 5:
            weekNum = 4;
            break;
        case 6:
            weekNum = 5;
            break;
        case 7:
            weekNum = 6;
            break;
            
        default:
            break;
    }
    
    return weekNum;
}

+ (NSString *)backWeekStringWithDate:(NSDate *)tempDate {
    NSUInteger weekDay = [self backWeekNumWithDate:tempDate];
    NSString *weekStr = [[NSString alloc] init];
    switch (weekDay) {
        case 1:
            weekStr = @"星期天";
            break;
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        case 7:
            weekStr = @"星期六";
            break;
            
        default:
            break;
    }
    
    return weekStr;
}

//获取指定月份第一天的日期
+ (NSDate *)backFirstDayDateInMonthFromDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                          fromDate:tempDate];
    [comps setDay:1];
    NSDate *firstDay = [calendar dateFromComponents:comps];
    
    return firstDay;
}

+ (NSString *)backFirstDayDateInMonthFromDate:(NSDate *)tempDate withFormat:(NSString *)format {
    NSDate *firstDay = [self backFirstDayDateInMonthFromDate:tempDate];
    
    return [self stringFromDate:firstDay withFormat:format];
}

//获取指定月份最后一天的日期
+ (NSDate *)backLastDayDateInMonthFromDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                          fromDate:tempDate];
    [comps setDay:[self backTotalDayInAMonthWithDate:tempDate]];
    NSDate *lastDay = [calendar dateFromComponents:comps];
    
    return lastDay;
}

+ (NSString *)backLastDayDateInMonthFromDate:(NSDate *)tempDate withFormat:(NSString *)format {
    NSDate *lastDay = [self backLastDayDateInMonthFromDate:tempDate];
    
    return [self stringFromDate:lastDay withFormat:format];
}

#pragma mark 日期的计算
//计算一个月中包含多少周
+ (NSUInteger)backWeekCountInAMonthWithDate:(NSDate *)tempDate {
    //确认第一天星期几
    NSDate *firstDay = [self backFirstDayDateInMonthFromDate:tempDate];
    NSUInteger firstWeek = [self backWeekNumOfChineseWith:firstDay];
    //确认最后天星期几
    NSDate *lastDay = [self backLastDayDateInMonthFromDate:tempDate];
    NSUInteger lastWeek = [self backWeekNumOfChineseWith:lastDay];
    
    NSUInteger totalDay = [self backTotalDayInAMonthWithDate:tempDate];
    NSUInteger weekCount = (totalDay - (8 - firstWeek + lastWeek)) / 7;
    return weekCount + 2;
}

//获取月份的总天数
+ (NSUInteger)backTotalDayInAMonthWithDate:(NSDate *)tempDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:tempDate];
    NSUInteger numberOfDaysInMonth = range.length;
    
    return numberOfDaysInMonth;
}

#pragma mark 日期的变更，转换
//date转换成指定格式的string
+ (NSString *)stringFromDate:(NSDate *)tempDate withFormat:(NSString *)format {
    //设置转换格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setCalendar:[NSCalendar currentCalendar]];
    [dateFormatter setDateFormat:format];
    
    NSString *dateString = [dateFormatter stringFromDate:tempDate];
    return dateString;
}

//string转化成date
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSCalendar currentCalendar]];
    [formatter setDateFormat:format];
    
    NSDate *date=[formatter dateFromString:string];
    return date;
}

//获取指定日期的前一天
+ (NSDate *)backBeforeADayDateFromDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                          fromDate:[[NSDate alloc] init]];
    [comps setHour:-24]; //-24表示获取前一天的date
    [comps setMinute:0];
    [comps setSecond:0];
    
    NSDate *beforeDay = [calendar dateByAddingComponents:comps toDate:tempDate options:0];
    return beforeDay;
}

+ (NSString *)backBeforeADayDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format {
    NSDate *beforeDay = [self backBeforeADayDateFromDate:tempDate];
    
    return [self stringFromDate:beforeDay withFormat:format];
}

//获取指定日期的下一天
+ (NSDate *)backAfterADayDateFromDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                          fromDate:[[NSDate alloc] init]];
    [comps setHour:+24]; //+24表示获取下一天的date
    [comps setMinute:0];
    [comps setSecond:0];
    
    NSDate *afterDay = [calendar dateByAddingComponents:comps toDate:tempDate options:0];
    return afterDay;
}

+ (NSString *)backAfterADayDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format {
    NSDate *afterDay = [self backAfterADayDateFromDate:tempDate];
    
    return [self stringFromDate:afterDay withFormat:format];
}

//获取指定日期的前一个月
+ (NSDate *)backBeforeAMonthDateFromDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitMonth)
                                          fromDate:[[NSDate alloc] init]];
    [comps setMonth:-1];
    
    NSDate *beforeMonth = [calendar dateByAddingComponents:comps toDate:tempDate options:0];
    return beforeMonth;
}

+ (NSString *)backBeforeAMonthDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format {
    NSDate *beforeMonth = [self backBeforeAMonthDateFromDate:tempDate];
    
    return [self stringFromDate:beforeMonth withFormat:format];
}

//获取指定日期的下一个月
+ (NSDate *)backAfterAMonthDateFromDate:(NSDate *)tempDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitMonth) fromDate:[[NSDate alloc] init]];
    [comps setMonth:+1];
    
    NSDate *afterMonth = [calendar dateByAddingComponents:comps toDate:tempDate options:0];
    return afterMonth;
}

+ (NSString *)backAfterAMonthDateFromDate:(NSDate *)tempDate withFormat:(NSString *)format {
    NSDate *afterMonth = [self backAfterAMonthDateFromDate:tempDate];
    
    return [self stringFromDate:afterMonth withFormat:format];
}

#pragma mark - 时间格式处理
/*
 * @method         替换日期格式
 * @tempContent    日期内容
 * @tempCurrent    要替换的内容
 * @tempReplace    新的内容
 * @例子   @"2015-06-12"改成@"2015.06-12"  那么tempCurrent = @"-" tempReplace = @"."
 */
+ (NSString*)modifyDateStringFormatWithContent:(NSString *)tempContent
                                 currentString:(NSString *)tempCurrent
                               byReplaceString:(NSString *)tempReplace {
    NSRange range = [tempContent rangeOfString:tempCurrent];
    if (range.location != NSNotFound) {
        tempContent = [tempContent stringByReplacingCharactersInRange:range withString:tempReplace];
    }
    
    return tempContent;
}

/*
 * @method      时间戳转成时间
 * @timeStr     时间戳内容
 * @tempFormat  转成时间后的时间格式
 * @例子    如把时间戳转成@"2015-06-12"  那么tempFormat = @“YYYY-MM-dd”;
 */
+ (NSString *)getTimeStringWith:(NSString *)timeStr withFormat:(NSString *)tempFormat {
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:tempFormat];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStr integerValue]];
    //NSLog(@"时间One = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    //NSLog(@"时间Two =  %@",confromTimespStr);
    
    return confromTimespStr;
}

//时间转时间戳
+ (long long)getLongWithDate:(NSDate *)tempDate {
    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[tempDate timeIntervalSince1970]];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    return [timeSp longLongValue];
}

//时间转时间戳
+ (long long)getLongWithDateString:(NSString *)tempDateString {
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];  //这里设置的属性要一致
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSDate *tempDate = [formatter dateFromString:tempDateString];
    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[tempDate timeIntervalSince1970]];
    NSLog(@"++++timeSp:%@",timeSp); //时间戳的值
    
    return [timeSp longLongValue];
}

@end
