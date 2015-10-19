//
//  SheetMusic.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "SheetMusic.h"

@implementation SheetMusic

- (NSMutableArray<Score *> *)scores
{
    if (!_scores) {
        _scores = [[NSMutableArray alloc] init];
    }
    return _scores;
}

@end
