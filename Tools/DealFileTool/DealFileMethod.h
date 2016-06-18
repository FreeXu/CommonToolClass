//
//  DealFileMethod.h
//  ToolClassProduct
//
//  Created by xuls on 16/3/17.
//  Copyright © 2016年 Genvict. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DealFileMethod : NSObject

/**
 *  将文件写入沙盒
 *
 *  @param fileName 文件名称
 *
 *  @return 返回路径名
 */
+ (NSString *)createAndBackDocumentsDirectoryFile:(NSString *)fileName;

/**
 *  从沙盒中获取文件路径
 *
 *  @param fileName 文件名称
 *
 *  @return 文件路径
 */
+ (NSString *)achiveAppDocumentsDirectoryFile:(NSString *)fileName;

@end
