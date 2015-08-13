//
//  Player.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 2/12/15.
//  Copyright (c) 2015 Chen Zhibo. All rights reserved.
//

#import "Player.h"
#import "AdvancedAVPlayer.h"
@import AVFoundation;


@interface Player ()

@property (strong, nonatomic) NSMutableArray *players;
@property (strong, nonatomic) NSArray *delays;

@end

@implementation Player

- (NSArray *)delays
{
    if (!_delays) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"delay" withExtension:@".plist"];
        if (url) {
            _delays = [NSArray arrayWithContentsOfURL:url];
        }
    }
    return _delays;
}

- (NSMutableArray *)players
{
    if (!_players) {
        _players = [NSMutableArray array];
    }
    return _players;
}
#define STANDARD_DELAY 1.0

- (void)playSoundFileAtIndex:(int)index withVolume:(float)volumn withDuration:(NSTimeInterval)duration
{
    AdvancedAVPlayer *player = [[AdvancedAVPlayer alloc] initWithURL:[self urlForMusicAtIndex:index]];
    player.volume = volumn;
    [self.players addObject:player];
    NSTimer *startTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:STANDARD_DELAY-[[self.delays objectAtIndex:index-1] doubleValue]] interval:0 target:self selector:@selector(startPlay:) userInfo:player repeats:NO];
    
    [[NSRunLoop currentRunLoop] addTimer:startTimer forMode:NSDefaultRunLoopMode];
    
    
    NSTimer *stopTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:STANDARD_DELAY + duration] interval:0 target:self selector:@selector(stopPlay:) userInfo:player repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:stopTimer forMode:NSDefaultRunLoopMode];
    
}

- (void)startPlay:(NSTimer *)timer
{
    AVPlayer *player = timer.userInfo;
    [player play];
    
}

- (void)stopPlay:(NSTimer *)timer
{
    AVPlayer *player = timer.userInfo;
    [player pause];
    [self.players removeObject:player];
}

- (void)stopAllSound
{
    [self.players enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        AVPlayer *player = obj;
        [player pause];
        
    }];
    self.players = nil;
}

- (NSURL *)urlForMusicAtIndex:(int)index
{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *fileName = [NSString stringWithFormat:@"%ld", (long)index];
    //NSString *path = [bundle pathForResource:fileName ofType:@".aif"];
    NSURL *url = [bundle URLForResource:fileName withExtension:@".mp3"];
    return url;
    
}

@end
