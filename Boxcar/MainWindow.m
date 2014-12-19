//
//  MainWindowController.m
//  Boxcar
//
//  Created by Gavin M. Roy on 12/3/14.
//  Copyright (c) 2014 AWeber Communications. All rights reserved.
//

#import "MainWindow.h"
#import "Vagrant.h"

@interface MainWindow ()

@property (assign) IBOutlet NSWindow *window;

@end

@implementation MainWindow

- (void)windowDidLoad {
    [super windowDidLoad];
    [self.window setTitleVisibility: NSWindowTitleHidden];
    
    // Create the vagrant object
    self.vagrant = [[Vagrant alloc] init];
    NSLog(@"Vagrant Version: %@", self.vagrant.versionInstalled);
}

@end
