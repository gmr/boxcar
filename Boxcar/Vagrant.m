//
//  VagrantInterface.m
//  Boxcar
//
//  Created by Gavin M. Roy on 12/3/14.
//  Copyright (c) 2014 AWeber Communications. All rights reserved.
//

#import "Vagrant.h"

@interface Vagrant()

- (NSString *)runCommand:(NSString *)commandToRun;
- (NSString *)runVagrantCommand:(NSString *)commandToRun;
- (void)getVersionInformation;

@end

@implementation Vagrant

- (id)init {
    self = [super init];
    if (self) {
        [self getVersionInformation];
    }
    return self;
}

- (void) getVersionInformation
{
    NSArray *parts;
    NSArray *lines = [[self runVagrantCommand:@"version"] componentsSeparatedByString:@"\n"];
    for (id line in lines)
    {
        parts = [line componentsSeparatedByString:@","];
        if ([parts count] == 4)
        {
            if ([[parts objectAtIndex:2] isEqualToString: @"version-installed"]) {
                self.versionInstalled = [parts objectAtIndex:3];
            } else  if ([[parts objectAtIndex:2] isEqualToString: @"version-latest"]) {
                self.versionLatest = [parts objectAtIndex:3];
            }
        }
    }
}

- (NSString *) runCommand:(NSString *) commandToRun
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
    
    NSArray *arguments = [NSArray arrayWithObjects:
                          @"-c" ,
                          [NSString stringWithFormat:@"%@", commandToRun],
                          nil];
    NSLog(@"run command: %@",commandToRun);
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *output;
    output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    return output;
}

- (NSString *) runVagrantCommand:(NSString *) commandToRun
{
    NSArray *commandParts = [[NSArray alloc] initWithObjects:@"vagrant", commandToRun, @"--machine-readable", nil];
    NSString *vagrantCommand = [commandParts componentsJoinedByString:@" "];
    return [self runCommand:vagrantCommand];
}

@end
