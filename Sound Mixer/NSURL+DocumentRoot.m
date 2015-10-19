//
//  NSURL+DocumentRoot.m
//  Recording Fun
//
//  Created by Chen Zhibo on 10/7/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "NSURL+DocumentRoot.h"

@implementation NSURL (DocumentRoot)

+ (NSURL *)documentRootWithFolderName:(NSString *)folderName
{
    NSURL *root = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    if (folderName) {
        return [root URLByAppendingPathComponent:[NSString stringWithFormat:@"%@/", folderName ]];
    }
    return root;
}

@end
