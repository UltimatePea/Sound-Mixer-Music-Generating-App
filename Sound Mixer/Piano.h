//
//  Piano.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SheetMusic;
@interface Piano : NSObject

@property (strong, nonatomic) SheetMusic *sheetMusic;
- (void)stop;
- (void)play;
@property (nonatomic) BOOL isplaying;
@property (nonatomic) float duration;
@end
