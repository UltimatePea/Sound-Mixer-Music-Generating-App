//
//  Sound_MixerTests.m
//  Sound MixerTests
//
//  Created by Chen Zhibo on 2/5/15.
//  Copyright (c) 2015 Chen Zhibo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Note.h"

@interface Sound_MixerTests : XCTestCase

@end

@implementation Sound_MixerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
   BOOL res =  [ @[@"d"] containsObject:@"d"] ;
    XCTAssert(res);
}

- (void)testNoteClass
{
    Note *note = [[Note alloc] initWithUniqueIdentifier:87];
    XCTAssertEqual(note.uniqueIdentifier, [[Note alloc] initWithFilename:note.audioFilename].uniqueIdentifier);
    
    
}

- (void)testNoteClass2
{
    Note *note = [[Note alloc] initWithFilename:@"3G"];
    Note *octavelyHigher = [[Note alloc]  initWithFilename:@"4G"];
    XCTAssertEqual((note.uniqueIdentifier - octavelyHigher.uniqueIdentifier )% 12, 0);
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
