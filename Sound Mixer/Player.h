//
//  Player.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 2/12/15.
//  Copyright (c) 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

- (void)playSoundFileAtIndex:(int)index withVolume:(float)volumn withDuration:(NSTimeInterval)duration;
- (void)stopAllSound;

@end
