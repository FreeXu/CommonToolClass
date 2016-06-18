//
//  Singleton.m
//  BabyButtonProduct
//
//  Created by 徐立生 on 15/12/24.
//  Copyright © 2015年 DeveloperXLS. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
static id _instance;

/**
 *  alloc方法内部会调用这个方法
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_instance == nil) { // 防止频繁加锁
        @synchronized(self) {
            if (_instance == nil) { // 防止创建多次
                _instance = [super allocWithZone:zone];
            }
        }
    }
    return _instance;
}

+ (instancetype)sharedSingleton {
    if (_instance == nil) { // 防止频繁加锁
        @synchronized(self) {
            if (_instance == nil) { // 防止创建多次
                _instance = [[self alloc] init];
            }
        }
    }
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

#pragma mark set method
- (void)setAppBecomeActive:(BOOL)appBecomeActive {
    _appBecomeActive = appBecomeActive;
}

- (void)setIsOpenAntiLost:(BOOL)isOpenAntiLost {
    _isOpenAntiLost = isOpenAntiLost;
}

- (void)setAlertType:(NSString *)alertType {
    _alertType = alertType;
}

- (void)setMp3Name:(NSString *)mp3Name {
    _mp3Name = mp3Name;
}

- (void)setAlertTimeCount:(CGFloat)alertTimeCount {
    _alertTimeCount = alertTimeCount;
}

- (void)setAlertPissCount:(NSInteger)alertPissCount {
    _alertPissCount = alertPissCount;
}

- (void)setIsOpenAlert:(BOOL)isOpenAlert {
    _isOpenAlert = isOpenAlert;
}

- (void)setHumidity:(NSString *)humidity {
    _humidity = humidity;
}

- (void)setHumidityWorth:(CGFloat)humidityWorth {
    _humidityWorth = humidityWorth;
}

@end
