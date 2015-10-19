//
//  NoteIDAudioFilenameConversion.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "NoteIDAudioFilenameConversion.h"

@implementation NoteIDAudioFilenameConversion

+ (instancetype)sharedInstance
{
    static NoteIDAudioFilenameConversion *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NoteIDAudioFilenameConversion alloc] init];
    });
    return instance;
}

+ (NSString *)stringForID:(int)identifier;
{
    return [[NoteIDAudioFilenameConversion sharedInstance] stringForID:identifier];
}
+ (int)idForString:(NSString *)string;
{
    return [[NoteIDAudioFilenameConversion sharedInstance] idForString:string];
}


#pragma mark - id string conversion

- (NSString *)stringForID:(int)identifier
{
    int indexOctave = floor(identifier / 12);
    int indexNotename = identifier % 12;
    ;
    return [NSString stringWithFormat:@"%d%@", indexOctave, [self noteNames][indexNotename]];
}

- (int)idForString:(NSString *)string
{
    int indexOctave = [[string substringToIndex:1] intValue];
    NSString * notename = [string substringFromIndex:1];
    if ([self containsName:notename]) {
        int indexNotename =  [self indexOfNotewithName:notename];
        return indexOctave * 12 + indexNotename;
    } else {
        return - 1;
    }
    
}

- (NSArray<NSString *> *)noteNames
{
    return @[@"A", @"As", @"B", @"C", @"Cs", @"D", @"Ds", @"E", @"F", @"Fs", @"G", @"Gs"];
}

- (int)indexOfNotewithName:(NSString *)name
{
    __block int result = 0;
    [[self noteNames] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:name]) {
            result = (int)idx;
        }
    }];
    return result;
}

- (BOOL)containsName:(NSString *)name
{
    __block BOOL result = NO;
    [[self noteNames] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:name]) {
            result = YES;
        }
    }];
    return result;
}
@end
