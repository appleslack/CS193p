//
//  DBUnitTests.m
//  DBUnitTests
//
//  Created by Stuart Slack on 1/27/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MyDBConnection.h"

@interface DBUnitTests : XCTestCase

@end

@implementation DBUnitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExpandingThePool
{
    MyDBManager *sharedDBManager = [MyDBManager sharedDBManager];
    
    // 1.  Ensure we have two connections now
    XCTAssertTrue([sharedDBManager poolSize] == 2, @"The pool size should be default size");
    
    [sharedDBManager createPoolOfSize:10];
    XCTAssertTrue([sharedDBManager poolSize] == 10, @"The pool size should now be 10");

    [sharedDBManager createPoolOfSize:4];
    XCTAssertTrue([sharedDBManager poolSize] == 4, @"The pool size should now be 4");
    

    // Now test getting more than 4 connections.  But how?
    MyDBConnection *dbConn = nil;
    for( inx = 0; inx<5; inx++ ) {
        dbConn = [MyDBConnection getConnectionFromPool];
        dbConn ru
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
