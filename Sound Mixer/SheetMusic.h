//
//  SheetMusic.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Score;
@interface SheetMusic : NSObject

@property (strong, nonatomic) NSMutableArray <Score* > *scores;

@end
