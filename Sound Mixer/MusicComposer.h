//
//  MusicComposer.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SheetMusic;

@interface MusicComposer : NSObject

- (SheetMusic *)composeMusicForBaseNotename:(NSString *)notename withNumberOfMainChapters:(int)number;

@end
