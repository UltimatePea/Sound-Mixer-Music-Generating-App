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

@end

@implementation Piano

- (void)play
{
    [self.sheetMusic.scores makeObjectsPerformSelector:@selector(preplay)];
    [Timer timerWithFireDuration:0.25 invoking:^BOOL{
        
        [self.sheetMusic.scores enumerateObjectsUsingBlock:^(Score * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.playTime == self.currentTimerCount) {
                [obj play];
            }
        }];
        self.currentTimerCount ++;
        return YES;
    } recursive:YES];
}

@end
