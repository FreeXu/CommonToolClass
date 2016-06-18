//
//  XLSWeekTimer.h
//  ToolProduct
//
//  Created by xulisheng-Mac on 15/8/18.
//  Copyright (c) 2015年 xulisheng-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLSWeekTimer : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selectorMethod;
@property (nonatomic, weak) NSTimer *timer;

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

@end
