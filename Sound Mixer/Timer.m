//
//  Timer.m
//  CockroachIsland
//
//  Created by Chen Zhibo on 9/19/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "Timer.h"

@interface Timer ()

@property (strong, nonatomic) BOOL (^block)();

@end

@implementation Timer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (void)timerWithFireDuration:(NSTimeInterval)timeDuration invoking:(BOOL (^)())block recursive:(BOOL)recur;//return no to stop
{
    Timer *timer = [[Timer alloc] init];
    timer.block = block;
    if (recur) {
        NSTimer *nstimer = [NSTimer timerWithTimeInterval:timeDuration target:timer selector:@selector(time:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:nstimer forMode:NSDefaultRunLoopMode];
        [nstimer fire];
    } else {
        
        NSTimer *nstimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:timeDuration] interval:0 target:timer selector:@selector(time:) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:nstimer forMode:NSDefaultRunLoopMode];
//        [nstimer fire];
    }
   
}

- (void)time:(NSTimer *)timer
{
    if (self.block()) {
        
    } else {
        [timer invalidate];
    }
}

@end
