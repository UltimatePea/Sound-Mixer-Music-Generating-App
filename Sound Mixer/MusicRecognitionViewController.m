//
//  MusicRecognitionViewController.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/7/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "MusicRecognitionViewController.h"
#import "NSURL+DocumentRoot.h"
#import "Note.h"
#import "ShiftModel.h"
@import AVFoundation;

@interface MusicRecognitionViewController ()

@property (strong, nonatomic) AVAudioRecorder *recorder;

@end

@implementation MusicRecognitionViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    NSError *error;
    AVAudioRecorder *recorder = [[AVAudioRecorder alloc] initWithURL:[[NSURL documentRootWithFolderName:nil] URLByAppendingPathComponent:@"recording.aiff"] settings:recordSetting error:&error];
    if (error) {
        NSLog(@"error");
    }
    self.recorder = recorder;
}
- (IBAction)touchDown:(UIButton *)sender {
    NSLog(@"Touch Down");
//    []
    [self.recorder record];
}

- (IBAction)touchUp:(UIButton *)sender {
    NSLog(@"Touch Up");
    [self.recorder stop];
    
    [self compare];
}

- (void)compare
{
    double high = 0;
    int highI = 0;
    for (int i = 0; i < 88; i ++) {
        Note *note = [[Note alloc] initWithUniqueIdentifier:i];
        NSURL *sampleURL = [[NSBundle mainBundle]URLForResource:[NSString stringWithFormat:@"gb%@", note.audioFilename] withExtension:@"mp3"];
        NSURL *recording = [[NSURL documentRootWithFolderName:nil] URLByAppendingPathComponent:@"recording.aiff"];
        double matchIndex = [ShiftModel getMathingIndexFirstAudioURL:sampleURL  secondAudio:recording];
        
        if (matchIndex > high) {
            high = matchIndex;
            highI = i;
        }
        NSLog(@"===============I: %d==============", i);
    }
    NSLog(@"High: %f, HighI: %d", high, highI);
    NSLog(@"Note: %@", [[Note alloc] initWithUniqueIdentifier:highI].audioFilename);
}


@end
