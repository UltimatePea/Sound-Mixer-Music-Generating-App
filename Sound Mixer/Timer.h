//
//  Timer.h
//  CockroachIsland
//
//  Created by Chen Zhibo on 9/19/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Timer : NSObject

+ (void)timerWithFireDuration:(NSTimeInterval)timeDuration invoking:(BOOL (^)())block recursive:(BOOL)recur;//return no to stop

@end
