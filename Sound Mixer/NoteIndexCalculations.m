
//
//  NoteIndexCalculations.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "NoteIndexCalculations.h"

@implementation NoteIndexCalculations

//chording diff: 0, 3, 7
+ (BOOL)index:(int)index isChordWithIndex:(int)index2;
{
    int difference = abs(index - index2)%12;
    
    if (difference == 3 || difference == 7 || difference == 0) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (int)randomChordForIndex:(int)index baseIndex:(int)baseIndex;
{

    int base = index - (index - baseIndex ) %12;
    return arc4random()%3==0?base + 3:(arc4random()%2==0?base + 7: base);
}

@end
