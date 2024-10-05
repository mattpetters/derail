#import <Cocoa/Cocoa.h>
#include <string>

@interface WindowTracker : NSObject

- (std::string)getCurrentWindowTitle;

@end