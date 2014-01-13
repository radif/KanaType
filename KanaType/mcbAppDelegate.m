//
//  mcbAppDelegate.m
//  KanaType
//
//  Created by Radif Sharafullin on 1/12/14.
//  Copyright (c) 2014 Radif Sharafullin. All rights reserved.
//

#import "mcbAppDelegate.h"
#import "mcbKanaTypeConverter.h"

@implementation mcbAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"%@",[mcbKanaTypeConverter convertABCToKana:@"Hello guys hello 123, this is Radif"]);
}

@end
