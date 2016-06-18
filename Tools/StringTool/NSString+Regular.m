//
//  NSString+Regular.m
//  ParkPlus
//
//  Created by xuls on 16/4/5.
//  Copyright © 2016年 Genvict. All rights reserved.
//

#import "NSString+Regular.h"

#define VALIDATEALLHTTP    @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"

@implementation NSString (Regular)

#pragma mark - 常用的正则
//手机号码正则
+ (BOOL)mobilePhoneRegularOfString:(NSString *)content {
    NSString *phoneRegex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:content];
}

+ (BOOL)mobileNumRegularOfString:(NSString *)mobileNum {
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)) {
        
        return YES;
    }
    
    return NO;
}

//电话号码正则
+ (BOOL)phoneNumRegularOfString:(NSString *)content {
    NSString *phoneRegex = @"(^(\\d{3,4}-)?\\d{7,8})$|(^1[3|4|5|7|8][0-9]\\d{8}$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:content];
}

//汉语化昵称 支持中文、英文、数字、\"-\"\"_\"组合
+ (BOOL)chinaNickRegularOfString:(NSString *)content {
    NSString *chineseName = @"^[\u4e00-\u9fa5|a-zA-Z0-9_-]{2,24}";
    NSPredicate *chineseNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", chineseName];
    
    return [chineseNameTest evaluateWithObject:content];
}

//英语化昵称 只允许全中文，或英数“_”组合
+ (BOOL)englishNickRegularOfString:(NSString *)content {
    NSString *userNameRegex = @"^([\u4e00-\u9fa5]|[a-zA-Z0-9_]){1,20}$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    
    return  [userNamePredicate evaluateWithObject:content];
}

//密码正则 英数_ 组合
+ (BOOL)passwordRegularOfString:(NSString *)content
                  withMinLength:(NSInteger)minLength
                  withMaxLength:(NSInteger)maxLength {
    NSString *passWordRegex = [NSString stringWithFormat:@"^[a-zA-Z0-9_]{%ld,%ld}+$",minLength,maxLength];
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:content];
}

+ (BOOL)passwordRegularOfString:(NSString *)content {
    NSString *passWordRegex = @"^[a-zA-Z0-9_]+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:content];
}

//全数字正则
+ (BOOL)allNumRegularOfString:(NSString *)content
                withMinLength:(NSInteger)minLength
                withMaxLength:(NSInteger)maxLength {
    NSString *passWordRegex = [NSString stringWithFormat:@"^[0-9]{%ld,%ld}+$",minLength,maxLength];
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:content];
}

+ (BOOL)allNumRegularOfString:(NSString *)content {
    NSString *passWordRegex = @"^[0-9]+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:content];
}

//全英文
+ (BOOL)allEnglishRegularOfString:(NSString *)content
                    withMinLength:(NSInteger)minLength
                    withMaxLength:(NSInteger)maxLength {
    NSString *allEnglishStr = [NSString stringWithFormat:@"^[a-zA-Z]{%ld,%ld}+$",minLength,maxLength];
    NSPredicate *allEnglishPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",allEnglishStr];
    
    return [allEnglishPredicate evaluateWithObject:content];
}

+ (BOOL)allEnglishRegularOfString:(NSString *)content {
    NSString *allEnglishStr = @"^[a-zA-Z]+$";
    NSPredicate *allEnglishPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",allEnglishStr];
    
    return [allEnglishPredicate evaluateWithObject:content];
}

#pragma mark - 个别正则
//验证中文
+ (BOOL)chinaStringRegularOfString:(NSString *)content
                     withMinLength:(NSInteger)minLength
                     withMaxLength:(NSInteger)maxLength {
    NSString *nicknameRegex = [NSString stringWithFormat:@"^[\u4e00-\u9fa5]{%ld,%ld}$",minLength,maxLength];
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    
    return [passWordPredicate evaluateWithObject:content];
}

//邮箱正则
+ (BOOL)emailRegularOfString:(NSString *)content {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:content];
}

//身份证正则
+ (BOOL)manIdRegularOfString:(NSString *)content {
    NSString *manId = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])(\\d{3}(\\d|X|x))$";
    NSPredicate *manIdPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", manId];
    
    return [manIdPredicate evaluateWithObject:content];
}

+ (BOOL)manIDRegular:(NSString *)tempId {
    tempId = [tempId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([tempId length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:tempId]) {
        return NO;
    }
    
    int summary = ([tempId substringWithRange:NSMakeRange(0,1)].intValue + [tempId substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([tempId substringWithRange:NSMakeRange(1,1)].intValue + [tempId substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([tempId substringWithRange:NSMakeRange(2,1)].intValue + [tempId substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([tempId substringWithRange:NSMakeRange(3,1)].intValue + [tempId substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([tempId substringWithRange:NSMakeRange(4,1)].intValue + [tempId substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([tempId substringWithRange:NSMakeRange(5,1)].intValue + [tempId substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([tempId substringWithRange:NSMakeRange(6,1)].intValue + [tempId substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [tempId substringWithRange:NSMakeRange(7,1)].intValue *1 + [tempId substringWithRange:NSMakeRange(8,1)].intValue *6
    + [tempId substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[tempId substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

//网址正则
+ (BOOL)urlHttlRegularOfString:(NSString *)content {
    NSPredicate *URLTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", VALIDATEALLHTTP];
    
    return [URLTest evaluateWithObject:content];
}

//判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    
    return NO;
}

//时间格式检验，年月日
+ (BOOL)yearMonthDayRegularOfString:(NSString *)dateString {
    NSString *dateRegex = @"((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])$";
    NSPredicate *dateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dateRegex];
    
    return [dateTest evaluateWithObject:dateString];
}

@end
