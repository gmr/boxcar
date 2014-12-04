//
//  AppDelegate.m
//  Boxcar
//
//  Created by Gavin M. Roy on 12/3/14.
//  Copyright (c) 2014 AWeber Communications. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindow.h"

@interface AppDelegate ()

@property (strong) MainWindow *mainWindow;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _mainWindow = [[MainWindow alloc] initWithWindowNibName:@"MainWindow"];
    [self.mainWindow showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
