//
//  MusicGeneratorViewController.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 2/12/15.
//  Copyright (c) 2015 Chen Zhibo. All rights reserved.
//

#import "MusicGeneratorViewController.h"
#import "Player.h"

@interface MusicGeneratorViewController ()

@property (nonatomic) float timePerNote, backgroundVolumn, foregroundVolumn;
@property (nonatomic) int currentHighMusicIndex ,playCount, notePerUnit;
@property (strong, nonatomic) Player *player;

@property (strong, nonatomic) NSTimer *mainTimer, *backgroundTimer;

@end

@implementation MusicGeneratorViewController


- (Player *)player
{
    if (!_player) {
        _player = [[Player alloc] init];
    }
    return _player;
}

- (float)timePerNote
{
    return _timePerNote;
}

- (int)notePerUnit
{
    if (_notePerUnit==0) {
        _notePerUnit = 4;
    }
    return _notePerUnit;
}

- (void)viewDidLoad
{
    [self setup];
}

- (void)setup
{
    self.currentHighMusicIndex = arc4random()%14 + 14;
    self.backgroundVolumn = 0.5;
    self.timePerNote = 0.5;
    self.foregroundVolumn = 0.5;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self startPlay:self];
}

- (void)play:(NSTimer *)timer
{
    [self scheduleTimeManager];
    [self.player playSoundFileAtIndex:[self getNextRandomTune] withVolume:self.foregroundVolumn withDuration:[self timeUntilUnitEnds]];
    
    if ([self isStartOfUnit]) {
        [self playBackgroundHarmonics];
    }
    
}

- (void)playBackgroundHarmonics
{
    NSArray *harmonics = [self generateHarmonicWithCurrentNote:self.currentHighMusicIndex - 7];
    NSRange range;
    range.length = 3;
    range.location = arc4random() % 3;
    NSArray *desiredNotes = [harmonics subarrayWithRange:range];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:self.timePerNote target:self selector:@selector(playBackgroundNote:) userInfo:desiredNotes repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    self.backgroundTimer = timer;
}

- (void)playBackgroundNote:(NSTimer *)timer
{
    NSArray *desiredNotes = timer.userInfo;
    int index;
    @try {
        index = [[desiredNotes objectAtIndex:[self currentCountInUnit]] intValue];
        [self.player playSoundFileAtIndex:index withVolume:self.backgroundVolumn withDuration:[self timeUntilUnitEnds]];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    @finally {
        
    }
    
    
    
    
//        NSLog(@"current music index: %d", index);
    
    
//    if (index < 1) {
//        NSLog(@"error");
//        [self generateHarmonicWithCurrentNote:self.currentHighMusicIndex];
//    }
    
    
    
    if ([self currentCountInUnit] == 2) {
        [timer invalidate];
    }
    
}

- (int)currentCountInUnit
{
    return (self.playCount%self.notePerUnit);
}

- (void)scheduleTimeManager
{
    self.playCount++;
}

- (float)timeUntilUnitEnds
{
    return (self.notePerUnit - self.playCount%self.notePerUnit ) *self.timePerNote;
}

- (BOOL)isStartOfUnit
{
    return (self.playCount%self.notePerUnit == 0 );
}

- (NSArray *)generateHarmonicWithCurrentNote:(int)note
{
    NSArray *result;
    if (note%7==0) {
        return nil;
    }
    if (note - 7 >=1 && note + 7 <= 29) {
        result = @[ @(note - 7), @(note - 3), @(note), @(note + 4), @(note + 7)];
    } else if (note - 7 < 1){
        result = @[ @(note - 3), @(note), @(note + 4), @(note + 7), @(note + 11)];
    } else if (note + 7 >29)
    {
        result = @[ @(note - 10), @(note - 7), @(note - 3), @(note), @(note + 4)];
    } else if (note - 3 < 1){
        result = @[ @(note), @(note + 4), @(note + 7), @(note + 11), @(note + 14)];
    }
    return result;
}

- (int)getNextRandomTune
{
    int result;
    do {
        result = arc4random()%16 + self.currentHighMusicIndex - 8;
    } while ((result < 14 || result > 29 ));
    self.currentHighMusicIndex = result;
    return result;
}

#pragma mark - IB actions


- (IBAction)highValueChanged:(UISlider *)sender {
    self.foregroundVolumn = sender.value;
    
}
- (IBAction)lowValueChanged:(UISlider *)sender {
    self.backgroundVolumn = sender.value;
}
- (IBAction)paceChanged:(UISlider *)sender {
    self.timePerNote = sender.value;
}

- (IBAction)startPlay:(id)sender
{
    if (self.mainTimer == nil) {
        self.currentHighMusicIndex = arc4random()%14 + 14;
        NSTimer *timer = [NSTimer timerWithTimeInterval:self.timePerNote target:self selector:@selector(play:) userInfo:self repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        self.mainTimer = timer;
        [timer fire];
    }
}
- (IBAction)stop:(id)sender
{
    [self.mainTimer invalidate];
    self.mainTimer = nil;
    [self.backgroundTimer invalidate];
    self.backgroundTimer = nil;
    //[self.player stopAllSound];
    //self.player = nil;
    
}
- (IBAction)restart:(id)sender
{
    [self stop:sender];
    [self startPlay:sender];
}

@end
