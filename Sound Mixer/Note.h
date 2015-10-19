//
//  Note.h
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (nonatomic) int uniqueIdentifier;
@property (strong, nonatomic, readonly) NSString *audioFilename;//excluding extension
+ (int)maximumAvailableIdentifier;
- (instancetype)initWithUniqueIdentifier:(int)uniqueIdentifier;
- (instancetype)initWithFilename:(NSString *)filename;
@end
