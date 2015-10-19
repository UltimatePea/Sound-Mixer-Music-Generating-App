//
//  NoteIDAudioFilenameConversion.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteIDAudioFilenameConversion : NSObject
+ (NSString *)stringForID:(int)identifier;
+ (int)idForString:(NSString *)string;
@end
