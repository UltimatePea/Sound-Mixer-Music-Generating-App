//
//  Note.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "Note.h"
#import "NoteIDAudioFilenameConversion.h"

@implementation Note

- (instancetype)initWithUniqueIdentifier:(int)uniqueIdentifier
{
    self = [super init];
    if (self) {
        self.uniqueIdentifier = uniqueIdentifier;
    }
    return self;
}

- (NSString *)audioFilename
{
    return [NoteIDAudioFilenameConversion stringForID:self.uniqueIdentifier];
}

- (instancetype)initWithFilename:(NSString *)filename
{
    int index = [NoteIDAudioFilenameConversion idForString:filename];
    if (index == -1) {
        return nil;
    }
    self = [super init];
    if (self) {
        self.uniqueIdentifier = index;
    }
    return self;
}


#pragma mark - meta
+ (int)maximumAvailableIdentifier;
{
    return 87;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"Symbol: %@, Index: %d", self.audioFilename, self.uniqueIdentifier];
}

@end
