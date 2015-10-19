//
//  NSURL+DocumentRoot.h
//  Recording Fun
//
//  Created by Chen Zhibo on 10/7/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (DocumentRoot)
+ (NSURL *)documentRootWithFolderName:(NSString *)folderName;
@end
