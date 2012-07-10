//
//  Copyright (c) 2012 Tim Arnold
//
//  https://github.com/timarnold/Sudoku
//

#import "TAAppDelegate.h"

@implementation TAAppDelegate

@synthesize window = _window;
@synthesize containerVC = _containerVC;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.containerVC = [[TAContainerViewController alloc] init];
    
    self.window.rootViewController = self.containerVC;    
    [self.window makeKeyAndVisible];
    return YES;
}

@end