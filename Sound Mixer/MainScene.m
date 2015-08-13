////
////  MainScene.m
////  Sound Mixer
////
////  Created by Chen Zhibo on 2/5/15.
////  Copyright (c) 2015 Chen Zhibo. All rights reserved.
////
//
//#import "MainScene.h"
//#import "Player.h"
//
//@interface MainScene ()
//
//@property (nonatomic) int currentHighMusicIndex, mainTune, highNoteCount, lowNoteCount;
//
//@property (nonatomic, strong) NSArray *delayInformation;
//@property (strong, nonatomic) Player *player;
//
//@end
//
//@implementation MainScene
//
//- (NSArray *)delayInformation
//{
//    if (!_delayInformation) {
//        NSURL *url  = [[NSBundle mainBundle] URLForResource:@"delay" withExtension:@".plist"];
//        _delayInformation = [NSArray arrayWithContentsOfURL:url];
//    }
//    return _delayInformation;
//}
//
//#define TIME_PER_NOTE 0.25
//
//- (instancetype)initWithSize:(CGSize)size
//{
//    self = [super initWithSize:size];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}
//
//- (void)setup
//{
//    self.currentHighMusicIndex = arc4random()%14 + 14;
//    self.mainTune = self.currentHighMusicIndex;
//    
//}
//
//- (void)didMoveToView:(SKView *)view
//{
//    NSLog(@"MOved to view");
//    SKNode *node = [SKNode node];
//    
//    [self addChild:node];
//    
//    NSTimer *timerh = [NSTimer timerWithTimeInterval:TIME_PER_NOTE target:self selector:@selector(timerh:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timerh forMode:NSDefaultRunLoopMode];
//    [timerh fire];
//   
//    NSTimer *timerl = [NSTimer timerWithTimeInterval:4 * TIME_PER_NOTE target:self selector:@selector(timerl:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timerl forMode:NSDefaultRunLoopMode];
//    [timerl fire];
//}
//
//- (NSString *)soundFileNameWithIndex:(NSInteger)index
//{
//    return [NSString stringWithFormat:@"%ld.mp3", (long)index];
//}
//
//- (void)playSoundWithSoundFileIndex:(NSInteger)index
//{
//    
//    [self runAction:[self playingSoundFileIndex:index]];
//}
//
//- (SKAction *)playingSoundFileIndex:(NSInteger)index
//{
//    double delay = [[self.delayInformation objectAtIndex:index - 1] doubleValue];
//    SKAction *delayAction = [SKAction waitForDuration:1 - delay];
//    SKAction *playAction = [SKAction playSoundFileNamed:[self soundFileNameWithIndex:index] waitForCompletion:NO];
//    return [SKAction sequence:@[delayAction, playAction]];
//}
//
//- (void)timerh:(NSTimer *)timer
//{
//    NSLog(@"Timerh fired");
//    
//    self.highNoteCount++;
//    if (self.highNoteCount==4) {
//        self.highNoteCount = 0;
//    }
//    if (arc4random() % 4 != 0) {
//        
//        [self playSoundWithSoundFileIndex:[self getNextRandomTune]];
//    }
//    
//    
//}
//
//- (void)timerl:(NSTimer *)timer
//{
//    NSArray *harmonics = [self generateHarmonicWithCurrentNote:self.currentHighMusicIndex - 7];
//    SKAction *harmonicOne = [SKAction group:@[
//                                              [self playingSoundFileIndex:[[harmonics objectAtIndex:0] integerValue]],
//                                              [SKAction waitForDuration:TIME_PER_NOTE],
//                                              ]];
//    SKAction *harmonicTwo = [SKAction group:@[
//                                              [self playingSoundFileIndex:[[harmonics objectAtIndex:1] integerValue]],
//                                              [SKAction waitForDuration:TIME_PER_NOTE],
//                                              ]];
//    SKAction *harmonicThree = [SKAction group:@[
//                                                [self playingSoundFileIndex:[[harmonics objectAtIndex:2] integerValue]],
//                                                [SKAction waitForDuration:TIME_PER_NOTE]
//                                                ]];
//    SKAction *action = [SKAction sequence:@[
//                                            harmonicOne,
//                                            harmonicTwo,
//                                            harmonicThree
//                                         ]];
//    [self runAction:action];
//}
//
///**
// @return array with length 5 or nil
// */
//
//- (NSArray *)generateHarmonicWithCurrentNote:(int)note
//{
//    NSArray *result;
//    if (note - 7 >=1 && note + 7 <= 29) {
//        result = @[ @(note - 7), @(note - 3), @(note), @(note + 4), @(note + 7)];
//    } else if (note - 7 < 1){
//        result = @[ @(note - 3), @(note), @(note + 4), @(note + 7)];
//    } else if (note + 7 >29)
//    {
//        result = @[ @(note - 7), @(note - 3), @(note), @(note + 4)];
//    }
//    return result;
//}
//
//
//
//- (int)getNextRandomTune
//{
//    int result;
//    do {
//        result = arc4random()%6 + self.currentHighMusicIndex - 3;
//    } while ((result < 14 || result > 29 ));
//    self.currentHighMusicIndex = result;
//    return result;
//}
//
//
//                          
//    
//@end
