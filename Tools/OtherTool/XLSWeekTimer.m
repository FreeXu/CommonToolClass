//
//  XLSWeekTimer.m
//  ToolProduct
//
//  Created by xulisheng-Mac on 15/8/18.
//  Copyright (c) 2015年 xulisheng-Mac. All rights reserved.
//

#import "XLSWeekTimer.h"

@implementation XLSWeekTimer

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        [self.target performSelector:self.selectorMethod withObject:timer.userInfo];
    }
    else {
        [self.timer invalidate];
    }
}

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats {
    XLSWeekTimer *timerTarget = [[XLSWeekTimer alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selectorMethod = aSelector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget 
                                                       selector:@selector(fire:) 
                                                       userInfo:userInfo 
                                                        repeats:repeats]; 
    return timerTarget.timer; 
}

@end
