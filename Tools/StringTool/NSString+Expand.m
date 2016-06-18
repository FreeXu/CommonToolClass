//
//  NSString+Expand.m
//  ParkPlus
//
//  Created by xuls on 16/4/5.
//  Copyright © 2016年 Genvict. All rights reserved.
//

#import "NSString+Expand.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (Expand)

#pragma mark - 公用的方法
//行间距属性设置
+ (NSMutableParagraphStyle *)paragraphStylePropertyWithLineHeight:(CGFloat)lineHeight
                                                withMaxLineHeight:(CGFloat)maxLineHeight
                                                withMinLineHeight:(CGFloat)minLineHeight {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineHeightMultiple = lineHeight;    //行间距
    paragraphStyle.maximumLineHeight  = maxLineHeight;    //每行的最大高度
    paragraphStyle.minimumLineHeight  = minLineHeight;    //每行的最小高度
    paragraphStyle.alignment = NSTextAlignmentJustified;
    
    return paragraphStyle;
}

//字符串的宽度
+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}

//字符串高度
+ (CGFloat)heightOfString:(NSString *)content
                 withFont:(UIFont *)font
          withStringWidth:(CGFloat)width {
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, 0)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil];
    //文字的高度
    CGFloat tempHeight = rect.size.height;
    
    return tempHeight;
}

+ (CGFloat)heightOfString:(NSString *)content
                 withFont:(UIFont *)font
            withParagraph:(NSMutableParagraphStyle *)paragraph
          withStringWidth:(CGFloat)width {
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, 0)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraph}
                                        context:nil];
    //文字的高度
    CGFloat tempHeight = rect.size.height;
    
    return tempHeight;
}

//字符串中，某个区间的属性设置
+ (NSMutableAttributedString *)dealStringWith:(NSString *)tempStr
                                        range:(NSRange)tempRange
                                     withFont:(UIFont *)tempFont
                                    withColor:(UIColor *)tempColor {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:tempStr];
    [attributedString addAttribute:NSFontAttributeName value:tempFont range:tempRange];  //字体大小
    [attributedString addAttribute:NSForegroundColorAttributeName value:tempColor range:tempRange]; //颜色
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:tempRange]; //下划线
    
    return attributedString;
}

#pragma mark - 个别地方用到的

//根据字符串内容，对字符串进行处理，如null时，返回空
+ (NSString *)backStringWithContent:(id)tempContent {
    NSString *tempStr = [NSString stringWithFormat:@"%@",tempContent];
    if (tempStr == nil || tempStr == NULL) {
        return @"";
    }
    if ([tempStr isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([tempStr isEqualToString:@"<null>"]) {
        return @"";
    }
    if ([tempStr isEqualToString:@"(null)"]) {
        return @"";
    }
    if ([[tempStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return @"";
    }
    
    return tempStr;
}

//js字符串属性设置
+ (NSString *)getJsStringWithFontSize:(int)tempFontSize
                       withFamilyFont:(NSString *)tempFamily
                       withImageWidth:(CGFloat)width
                          withContent:(NSString *)content {
    NSString *jsString = [NSString stringWithFormat:@"<html> \n"
                          "<head> \n"
                          "<style type=\"text/css\"> \n"
                          "body {font-size: %dpx; font-family: \"%@\"; color: #515151; line-height:20px; margin:20px 10px 20px 12px;}\n"
                          "body img{ max-width: %fpx; margin: 10px auto;}\n"
                          "</style> \n"
                          "</head> \n"
                          "<body>%@</body> \n"
                          "</html>", tempFontSize, tempFamily, width, content];
    
    return jsString;
}

//获取随机字符串
+ (NSString *)randomStringWithLength:(NSInteger)length {
    NSString *tempStr = @"abcdefABCDEF0123456789abcdefABCDEF0123456789";
    NSString *kRandomAlphabet = [NSString stringWithFormat:@"%@",tempStr];
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (NSInteger i = 0; i<length; i++) {
        [randomString appendFormat: @"%C", [kRandomAlphabet characterAtIndex:arc4random_uniform((u_int32_t)[kRandomAlphabet length])]];
    }
    NSLog(@"randomString = %@", randomString);
    
    return randomString;
}

//数组，字典转json
+ (NSString *)jsonStringFromArrayOrDictionary:(id)param {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:param
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *backString = @"";
    if ([jsonData length] > 0 && error == nil){
        //把json数据转化为String类型
        backString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //NSLog(@"JSON String = %@", backString);
    }
    
    return backString;
}

//十六进制转换成十进制
+ (NSString *)turn16to10:(NSString *)str {
    int sum = 0;
    for (int i = 0; i < str.length; i++) {
        sum *= 16;
        char c = [str characterAtIndex:i] ;
        if (c >= 'A') {
            sum += c - 'A' + 10;
        } else{
            sum += c - '0';
        }
    }
    
    return [NSString stringWithFormat:@"%d",sum];
}

//MD5加密
+ (NSString *)md5OfString:(NSString *)content {
    const char *original_str = [content UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (int)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

@end
