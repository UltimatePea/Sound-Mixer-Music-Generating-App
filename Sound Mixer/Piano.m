//
//  Piano.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "Piano.h"
#import "Timer.h"
#import "SheetMusic.h"
#import "Score.h"

@interface Piano ()

@property ( nonatomic) int currentTimerCount;
@property (nonatomic) BOOL shouldContinue;

@end

@implementation Piano

- (void)play
{
    self.shouldContinue = YES;
    [self.sheetMusic.scores makeObjectsPerformSelector:@selector(preplay)];
    [Timer timerWithFireDuration:self.duration invoking:^BOOL{
        
        [self.sheetMusic.scores enumerateObjectsUsingBlock:^(Score * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.playTime == self.currentTimerCount) {
                [obj play];
            }
        }];
        self.currentTimerCount ++;
        return self.shouldContinue;
    } recursive:YES];
}

- (void)stop
{
    self.shouldContinue = NO;
}

- (BOOL)isplaying
{
    return self.shouldContinue;
}

@end
