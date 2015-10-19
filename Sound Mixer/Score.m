//
//  Score.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "Score.h"
#import "Note.h"
@import AVFoundation;

@interface Score ()

@property (nonatomic) SystemSoundID systemSoundID;

@end

@implementation Score

- (void)play
{
    AudioServicesPlayAlertSound(self.systemSoundID);
   
}

+ (instancetype)scoreWithNotename:(NSString *)notename playtime:(int)playtime;
{
    return [[Score alloc] initWithNotename:notename playtime:playtime];
}

+ (instancetype)scoreWithNoteID:(int)noteID playtime:(int)playtime;
{
    return [[Score alloc] initWithNoteID:noteID playtime:playtime];
}

- (instancetype)initWithNoteID:(int)noteID playtime:(int)playtime;
{
    self = [self init];
    if (self) {
        self.note = [[Note alloc] initWithUniqueIdentifier:noteID];
        self.playTime = playtime;
    }
    return self;
}

- (instancetype)initWithNotename:(NSString *)notename playtime:(int)playtime;
{
    self = [self init];
    if (self) {
        self.note = [[Note alloc] initWithFilename:notename];
        self.playTime = playtime;
    }
    return self;
}

- (void)preplay;
{
    SystemSoundID soundID;
    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"gb%@", self.note.audioFilename] withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    self.systemSoundID = soundID;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"Note %@, Time %d", self.note.debugDescription, self.playTime];
}
@end
