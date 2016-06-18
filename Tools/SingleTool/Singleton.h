//
//  Singleton.h
//  BabyButtonProduct
//
//  Created by 徐立生 on 15/12/24.
//  Copyright © 2015年 DeveloperXLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Singleton : NSObject

//app是否在前台运行，是为YES；不是为NO
@property (nonatomic) BOOL appBecomeActive;

//是否开启防丢功能
@property (nonatomic) BOOL isOpenAntiLost;//是否开启防丢功能，默认为NO;

//设置中警告的类型
@property (nonatomic, copy) NSString *alertType;
//警告的铃声
@property (nonatomic, copy) NSString *mp3Name;
//设置中警告时长
@property (nonatomic) CGFloat alertTimeCount;
//设置中尿几次警告
@property (nonatomic) NSInteger alertPissCount;
@property (nonatomic) BOOL isOpenAlert;

//保存湿度
@property (nonatomic, copy) NSString *humidity;

//报警修正中，各个模式对应的湿度值
@property (nonatomic) CGFloat humidityWorth;

+ (instancetype)sharedSingleton;

@end
