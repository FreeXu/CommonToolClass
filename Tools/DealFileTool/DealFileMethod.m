//
//  DealFileMethod.m
//  ToolClassProduct
//
//  Created by xuls on 16/3/17.
//  Copyright © 2016年 Genvict. All rights reserved.
//

#import "DealFileMethod.h"

@implementation DealFileMethod

/**
 *  将文件写入沙盒
 *
 *  @param fileName 文件名称
 *
 *  @return 返回路径名
 */
+ (NSString *)createAndBackDocumentsDirectoryFile:(NSString *)fileName {
    NSString *writableDBPath = [self achiveAppDocumentsDirectoryFile:fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL dbexits = [fileManager fileExistsAtPath:writableDBPath];
    if (!dbexits) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
        
        NSError *error;
        BOOL success=[fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success) {
            NSAssert1(0,@"错误写入文件：‘%@’",[error localizedDescription]);
        }
    }
    
    return writableDBPath;
}

/**
 *  从沙盒中获取文件路径
 *
 *  @param fileName 文件名称
 *
 *  @return 文件路径
 */
+ (NSString *)achiveAppDocumentsDirectoryFile:(NSString *)fileName {
    NSString *documentDirectory=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[documentDirectory stringByAppendingPathComponent:fileName];
    
    return path;
}

@end
