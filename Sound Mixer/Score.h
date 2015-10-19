//
//  Score.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Note;
@interface Score : NSObject


@property (strong, nonatomic) Note *note;
@property (nonatomic) int playTime;
+ (instancetype)scoreWithNotename:(NSString *)notename playtime:(int)playtime;
+ (instancetype)scoreWithNoteID:(int)noteID playtime:(int)playtime;
- (void)play;
- (void)preplay;
@end
