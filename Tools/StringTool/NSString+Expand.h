//
//  NSString+Expand.h
//  ParkPlus
//
//  Created by xuls on 16/4/5.
//  Copyright © 2016年 Genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Expand)

#pragma mark - 公用的方法

/**
 *  多行字体间距设置
 *
 *  @param lineHeight    行间距
 *  @param maxLineHeight 每行最大高度
 *  @param minLineHeight 每行最小高度
 *
 *  @return 行间距属性
 */
+ (NSMutableParagraphStyle *)paragraphStylePropertyWithLineHeight:(CGFloat)lineHeight
                                                withMaxLineHeight:(CGFloat)maxLineHeight
                                                withMinLineHeight:(CGFloat)minLineHeight;

/**
 *  计算字符串的宽度
 *
 *  @param string 字符串
 *  @param font   字体大小
 *
 *  @return 宽度
 */
+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font;

/**
 *  获取字符串的高度
 *
 *  @param content   字符串内容
 *  @param font      字体大小
 *  @param paragraph 字符串行间距属性
 *  @param width     字符串的宽度
 *
 *  @return 字符串高度
 */
+ (CGFloat)heightOfString:(NSString *)content
                 withFont:(UIFont *)font
          withStringWidth:(CGFloat)width;

+ (CGFloat)heightOfString:(NSString *)content
                 withFont:(UIFont *)font
            withParagraph:(NSMutableParagraphStyle *)paragraph
          withStringWidth:(CGFloat)width;

/**
 *  字符串中，某个区间的属性设置
 *
 *  @param tempStr   字符串
 *  @param tempRange 需要变换属性的区间
 *  @param tempFont  字体大小
 *  @param tempColor 字体颜色
 *
 *  @return 返回修改后字符串
 */
+ (NSMutableAttributedString *)dealStringWith:(NSString *)tempStr
                                        range:(NSRange)tempRange
                                     withFont:(UIFont *)tempFont
                                    withColor:(UIColor *)tempColor;

#pragma mark - 个别地方用到的

/**
 *  将传入的参数进行处理，如果为空或nil是设为空字符串
 *
 *  @param tempContent 参数
 *
 *  @return
 */
+ (NSString *)backStringWithContent:(id)tempContent;

/**
 *  js字符串属性设置
 *
 *  @param tempFontSize 字体大小
 *  @param tempFamily   字体类型
 *  @param width        图片宽度
 *  @param content      字符串内容
 *
 *  @return 返回js字符串
 */
+ (NSString *)getJsStringWithFontSize:(int)tempFontSize
                       withFamilyFont:(NSString *)tempFamily
                       withImageWidth:(CGFloat)width
                          withContent:(NSString *)content;

/**
 *  获取随机字符串
 *
 *  @param length 随机字符串的长度
 *
 *  @return 返回字符串
 */
+ (NSString *)randomStringWithLength:(NSInteger)length;

/**
 *  数组，字典转json
 *
 *  @param param 参数
 *
 *  @return json字符串
 */
+ (NSString *)jsonStringFromArrayOrDictionary:(id)param;

//十六进制转换成十进制
+ (NSString *)turn16to10:(NSString *)str;

//MD5加密
+ (NSString *)md5OfString:(NSString *)content;

@end
