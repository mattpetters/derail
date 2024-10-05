#import "AppDelegate.h"
#import "macos/WindowTracker.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    WindowTracker *tracker = [[WindowTracker alloc] init];
    std::string currentWindowTitle = [tracker getCurrentWindowTitle];
    NSLog(@"Current window title: %s", currentWindowTitle.c_str());
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end