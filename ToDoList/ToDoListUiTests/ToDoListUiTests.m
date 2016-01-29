//
//  ToDoListUiTests.m
//  ToDoListUiTests
//
//  Created by Hengjie.chj on 28/1/2016.
//  Copyright © 2016 chen hengjie. All rights reserved.
//

#import "ToDoListUiTests.h"

@implementation ToDoListUiTests

- (void)setUp {
    [super setUp];
    // make sure first item is incomplete
    UITableView *toDoTableView = [self getTableViewIns];
    UITableViewCell *firstCell = [toDoTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertEqual(firstCell.accessoryType, UITableViewCellAccessoryNone);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddItem {
    NSString* testItemContent = @"test Add Item";
    UITableView *toDoTableView = [self getTableViewIns];
    NSInteger defaultCount = [toDoTableView numberOfRowsInSection:0];

    [self addItem:testItemContent];

    // make sure item is saved

    // find the table view again to update instance
    toDoTableView = [self getTableViewIns];
    NSInteger newCount = [toDoTableView numberOfRowsInSection:0];

    // make sure the new item is saved
    XCTAssertEqual(defaultCount+1, newCount);
    
    // make sure the new item is incompleted
    UITableViewCell *lastCell = [toDoTableView cellForRowAtIndexPath:[[toDoTableView indexPathsForVisibleRows] lastObject]];
    XCTAssertEqual(lastCell.accessoryType, UITableViewCellAccessoryNone);
//    // capture screenshot
//    KIFSystemTestActor *testActor = [KIFSystemTestActor new];
//    [testActor captureScreenshotWithDescription:@"test"];
    
}

- (void)testSwitchItemCompleteStatus {
    
    [tester waitForTimeInterval:1];
    // tap on first item
    [tester tapRowInTableViewWithAccessibilityLabel:@"ToDoTableView" atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    // check if it would be complete
    UITableView *toDoTableView = [self getTableViewIns];
    UITableViewCell *firstCell = [toDoTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertEqual(firstCell.accessoryType, UITableViewCellAccessoryCheckmark);
    
    // tap again
    [tester tapRowInTableViewWithAccessibilityLabel:@"ToDoTableView" atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    // check if it would be incomplete
    toDoTableView = [self getTableViewIns];
    firstCell = [toDoTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertEqual(firstCell.accessoryType, UITableViewCellAccessoryNone);
}

- (UITableView *) getTableViewIns {
    UITableView *toDoTableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"ToDoTableView"];
    return toDoTableView;
}


- (void)addItem:(NSString *)itemContent{
    // click add item button
    [tester tapViewWithAccessibilityLabel:@"Add"];
    
    // make sure current view is add item view
    [tester waitForViewWithAccessibilityLabel:@"ItemContent"];
    
    // enter text into item content TextField
    // Warning: make sure the Auto-Correction is turned OFF on iOS: http://osxdaily.com/2015/01/06/disable-auto-correct-ios/
    [tester enterText:itemContent intoViewWithAccessibilityLabel:@"ItemContent"];
    
    // click "Done" to save it
    [tester tapViewWithAccessibilityLabel:@"Done"];
}



@end
