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
    NSPasteboard*  pasteboard  = [NSPasteboard generalPasteboard];
    [pasteboard declareTypes:@[NSPasteboardTypeString] owner:self];

    [self registerHotKeys];
    
    _statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    _statusBar.title = @"カ";
    
    //_statusBar.image = [NSImage imageNamed:@"menuImage"];
    
    _statusBar.menu = _statusMenu;
    _statusBar.highlightMode = YES;
}

-(BOOL)registerHotKeys{
	DDHotKeyCenter *c = [DDHotKeyCenter sharedHotKeyCenter];
    __weak typeof(self) weakSelf=self;
	if (![c registerHotKeyWithKeyCode:kVK_ANSI_V modifierFlags:(NSControlKeyMask) task:^(NSEvent *hkEvent) {
        NSLog(@"hot key pressed!");
        [weakSelf convertText];
	}]) {
        NSLog(@"Unable to register hotkeys");
        return FALSE;
	}else{
        NSLog(@"Registered hotkeys");
        NSLog(@"Registered: %@", [c registeredHotKeys]);
	}
    return TRUE;
}
-(void)commandC{
    [self pressKey:8 flags:kCGEventFlagMaskCommand];
}
-(void)commandV{
    [self pressKey:9 flags:kCGEventFlagMaskCommand];
}
-(void)pressKey:(CGKeyCode)keyCode flags:(CGEventFlags) flags{
    CGEventRef ev;
    CGEventSourceRef source = CGEventSourceCreate (kCGEventSourceStateCombinedSessionState);
    
    //press down
    ev = CGEventCreateKeyboardEvent (source, keyCode, true);
    CGEventSetFlags(ev,flags); //combine flags
    CGEventPost(kCGHIDEventTap,ev);
    CFRelease(ev);
    
    //press up
    ev = CGEventCreateKeyboardEvent (source, keyCode, false);
    CGEventSetFlags(ev,flags); //combine flags
    CGEventPost(kCGHIDEventTap,ev);
    CFRelease(ev);
    
    CFRelease(source);
}

-(void)convertText{
    NSPasteboard*  pasteboard  = [NSPasteboard generalPasteboard];
    [pasteboard clearContents];
    
    [self commandC];
    double delayInSeconds = .01f;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSString* original = [pasteboard  stringForType:NSPasteboardTypeString];
        //bailing f pasteboard doesn't have anything
        if (!original){
            NSLog(@"no input!");
            return;
        }
        NSLog(@"original: %@",original);
        NSString * converted=[mcbKanaTypeConverter convertABCToKana:original];
        NSLog(@"converted: %@",converted);
        
        [pasteboard clearContents];
        [pasteboard setString:converted forType:NSPasteboardTypeString];
        
        [self commandV];
    });
}
@end
