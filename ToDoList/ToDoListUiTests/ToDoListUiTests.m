//
//  ToDoListUiTests.m
//  ToDoListUiTests
//
//  Created by Hengjie.chj on 28/1/2016.
//  Copyright © 2016 chen hengjie. All rights reserved.
//

#import <KIF.h>

@interface ToDoListUiTests : XCTestCase

@end

@implementation ToDoListUiTests

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
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [tester tapViewWithAccessibilityLabel:@"Add"];
    [tester enterText:@"testAddItem" intoViewWithAccessibilityLabel:@"ItemContent"];
    [tester tapViewWithAccessibilityLabel:@"Done"];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
