//
//  main.m
//  ToDoList
//
//  Created by chen hengjie on 12/29/13.
//  Copyright (c) 2013 chen hengjie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYZAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([XYZAppDelegate class]));
    }
}

// Remote Plugin patch start //

#ifdef DEBUG
#define REMOTEPLUGIN_SERVERIPS "192.168.1.208 192.168.59.3 10.211.55.2 10.37.129.2"
#include "/Users/hengjiechen/Library/Application Support/Developer/Shared/Xcode/Plug-ins/Remote.xcplugin/Contents/Resources/RemoteCapture.h"
#endif

// Remote Plugin patch end //
