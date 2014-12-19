//
//  MainWindowController.h
//  Boxcar
//
//  Created by Gavin M. Roy on 12/3/14.
//  Copyright (c) 2014 AWeber Communications. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Vagrant;

@interface MainWindow : NSWindowController

@property (strong) Vagrant *vagrant;

@end
