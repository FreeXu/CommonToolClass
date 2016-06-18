//
//  NSString+Regular.h
//  ParkPlus
//
//  Created by xuls on 16/4/5.
//  Copyright © 2016年 Genvict. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regular)

#pragma mark - 常用的正则
//手机号码正则
+ (BOOL)mobilePhoneRegularOfString:(NSString *)content;
+ (BOOL)mobileNumRegularOfString:(NSString *)mobileNum;

//电话号码正则
+ (BOOL)phoneNumRegularOfString:(NSString *)content;

//汉语化昵称
+ (BOOL)chinaNickRegularOfString:(NSString *)content;

//英语化昵称
+ (BOOL)englishNickRegularOfString:(NSString *)content;

/**
 *  密码正则 ,英数_ 组合
 *
 *  @param content   内容
 *  @param minLength 密码最短长度
 *  @param maxLength 密码最大长度
 *
 *  @return YES Or NO
 */
+ (BOOL)passwordRegularOfString:(NSString *)content
                  withMinLength:(NSInteger)minLength
                  withMaxLength:(NSInteger)maxLength;
+ (BOOL)passwordRegularOfString:(NSString *)content;

/**
 *  全数字正则
 *
 *  @param content   内容
 *  @param minLength 最短
 *  @param maxLength 最长
 *
 *  @return YES Or NO
 */
+ (BOOL)allNumRegularOfString:(NSString *)content
                withMinLength:(NSInteger)minLength
                withMaxLength:(NSInteger)maxLength;
+ (BOOL)allNumRegularOfString:(NSString *)content;

/**
 *  全英文
 *
 *  @param content   内容
 *  @param minLength 最短
 *  @param maxLength 最长
 *
 *  @return
 */
+ (BOOL)allEnglishRegularOfString:(NSString *)content
                    withMinLength:(NSInteger)minLength
                    withMaxLength:(NSInteger)maxLength;
+ (BOOL)allEnglishRegularOfString:(NSString *)content;

#pragma mark - 个别正则

/**
 *  验证中文
 *
 *  @param content   内容
 *  @param minLength 最小的长度
 *  @param maxLength 最大长度
 *
 *  @return YES or NO
 */
+ (BOOL)chinaStringRegularOfString:(NSString *)content
                     withMinLength:(NSInteger)minLength
                     withMaxLength:(NSInteger)maxLength;

//邮箱正则
+ (BOOL)emailRegularOfString:(NSString *)content;

//身份证正则
+ (BOOL)manIdRegularOfString:(NSString *)content;
+ (BOOL)manIDRegular:(NSString *)tempId;

//网址正则
+ (BOOL)urlHttlRegularOfString:(NSString *)content;

//判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string;

//时间格式检验，年月日
+ (BOOL)yearMonthDayRegularOfString:(NSString *)dateString;

@end
