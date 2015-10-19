//
//  MusicComposer.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "MusicComposer.h"
#import "Note.h"
#import "Score.h"
#import "SheetMusic.h"
#import "Note+MusicComposer.h"
#import "NoteIDAudioFilenameConversion.h"
#import "NoteIndexCalculations.h"

@interface MusicComposer ()

@property (nonatomic) int baseIndex;
@property (strong, nonatomic) NSArray<NSNumber *> *domain;
@property (strong, nonatomic) SheetMusic *sheetMusic;
@end

@implementation MusicComposer

- (SheetMusic *)composeMusicForBaseNotename:(NSString *)notename;
{
    Note *note = [[Note alloc] initWithFilename:notename];
    if (note == nil) {
        return nil;
    }
    self.baseIndex = note.uniqueIdentifier;
    return [self startMusicProductionProcess];
}

- (SheetMusic *)startMusicProductionProcess
{
    [self defineNoteDomain];
    [self generateMainMelody];//creates sheet music
    return self.sheetMusic;
}

- (void)defineNoteDomain
{
    /* 0 ~ 87 */
    
//    NSArray *increments =  @[@0, @3, @7];////chord
//    NSArray *increments = @[@0, @2, @3, @5, @7, @8, @11];//steps
    NSArray *increments = @[@0, @2, @3, @5, @7, @8, @10];//steps
    NSMutableArray *finalResult = [[NSMutableArray alloc] init];
    int minimum  = self.baseIndex % 12;
    [finalResult addObject:[NSNumber numberWithInt:minimum]];
    for (int i = 0; i < 9; i ++) {
        int base = 12 * i + minimum;
        for (int j = 0; j < increments.count; j ++) {
            int intendedNoteIdx = base + [increments[j] intValue];
            if (intendedNoteIdx <= 87) {
                [finalResult addObject:[NSNumber numberWithInt:intendedNoteIdx]];
            }
        }
    }
    self.domain = finalResult;
    
}

- (void)generateMainMelody
{
    //get first score and initial position
    __block int firstScore, position;
    for (NSNumber *number in self.domain.reverseObjectEnumerator) {
        if (number.intValue < [NoteIDAudioFilenameConversion idForString:@"4G"] && [NoteIndexCalculations index:number.intValue isChordWithIndex:self.baseIndex]) {
            firstScore = [NoteIndexCalculations randomChordForIndex:number.intValue baseIndex:self.baseIndex];
            break;
        }
        
    }
    [self.domain enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.intValue == firstScore) {
            position = (int)idx;
        }
    }];
    
    
    //get subsequent position
    NSMutableArray<NSNumber *> *firstMelody = [NSMutableArray array];
    [firstMelody addObject:[NSNumber numberWithInt:position]];
    for (int i = 0;
         i < 10
         ||
         (self.domain[position].intValue - self.baseIndex )%12 != 0;
         i ++)  {
        
        NSArray  *increments = @[@(-1), @(-2), @(-2), @(-1), @(1), @(2), @(2), @(1)];
        position = position + [increments[arc4random_uniform((int)increments.count)] intValue];
        NSLog(@"COunt ; %d",(self.domain[position].intValue - self.baseIndex)%12);
        [firstMelody addObject:[NSNumber numberWithInt:position]];
    }
//    if ((self.domain[position].intValue - self.baseIndex)%12 != 0) {
//        [firstMelody addObject:[NSNumber numberWithInt:position-(self.domain[position].intValue - self.baseIndex)%12]];
//    }
    //get multiplier (length of a score)
    NSMutableArray<NSNumber *> *noteDurationMultiplier = [NSMutableArray array];
    for (int i = 0; i < firstMelody.count; i += 2) {
        if (arc4random()%2 == 0 && firstMelody.count - i > 3) {
            for (int j = 0; j < 2; j ++) {
                [noteDurationMultiplier addObject:[NSNumber numberWithInt:1]];
            }
        } else {
            for (int j = 0; j < 2; j ++) {
                [noteDurationMultiplier addObject:[NSNumber numberWithInt:2]];
            }
        }
    }
    /////DONE CREATING FIRST MELODY////////
    
    /////GENERATE SUBSEQUENT BACKGROUND FOR FIRST MELODY/////////
    
    NSMutableArray *firstBackground = [NSMutableArray array];
    
    
    
    //create sheet music
    SheetMusic *sm = [[SheetMusic alloc] init];
    
    __block int currentDuration = 0;
    
    for (int i = 0; i < 2; i ++)
        
    [firstMelody enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        int index = self.domain[obj.intValue].intValue;
        int multiplier = noteDurationMultiplier[idx].intValue;
        currentDuration += multiplier;
        
        //create background melody
        if (([firstMelody count] - idx - 1 )%4 ==0) {
            int baseIdx =  index - 2 * 12;
            [sm.scores addObject:[Score scoreWithNoteID:baseIdx playtime:currentDuration]];
            [sm.scores addObject:[Score scoreWithNoteID:baseIdx+7 playtime:currentDuration+1]];
            [sm.scores addObject:[Score scoreWithNoteID:baseIdx+15 playtime:currentDuration+2]];
        }
        
        
        
        [sm.scores addObject:[Score scoreWithNoteID:index playtime:currentDuration]];
    }];
    self.sheetMusic = sm;
}


- (void)addMelodyToSheetMusic
{
    
}


@end
