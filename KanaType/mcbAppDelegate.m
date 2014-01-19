//
//  mcbAppDelegate.m
//  KanaType
//
//  Created by Radif Sharafullin on 1/12/14.
//  Copyright (c) 2014 Radif Sharafullin. All rights reserved.
//

#import "mcbAppDelegate.h"
#import "mcbKanaTypeConverter.h"

#import "DDHotKeyCenter.h"
#import <Carbon/Carbon.h>

@interface mcbAppDelegate ()
@property (weak) IBOutlet NSMenu *statusMenu;
@end

@implementation mcbAppDelegate{
    NSStatusItem *_statusBar;
    __weak NSMenu *_statusMenu;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self registerHotKeys];
    
    _statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    _statusBar.title = @"KanaType";
    
    //_statusBar.image =
    
    _statusBar.menu = _statusMenu;
    _statusBar.highlightMode = YES;
}

-(BOOL)registerHotKeys{
	DDHotKeyCenter *c = [DDHotKeyCenter sharedHotKeyCenter];
	if (![c registerHotKeyWithKeyCode:kVK_ANSI_V modifierFlags:(NSControlKeyMask) task:^(NSEvent *hkEvent) {
        NSLog(@"Firing block hotkey");
        NSLog(@"Hotkey event: %@", hkEvent);
	}]) {
        NSLog(@"Unable to register hotkeys");
        return FALSE;
	}else{
        NSLog(@"Registered hotkeys");
        NSLog(@"Registered: %@", [c registeredHotKeys]);
	}
    return TRUE;
}
-(void)convertText{
    
}
@end
