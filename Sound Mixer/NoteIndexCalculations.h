//
//  NoteIndexCalculations.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteIndexCalculations : NSObject

+ (BOOL)index:(int)index isChordWithIndex:(int)index2;
+ (int)randomChordForIndex:(int)index baseIndex:(int)baseIndex;
@end
