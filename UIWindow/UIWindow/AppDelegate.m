//
//  AppDelegate.m
//  UIWindow
//
//  Created by bmob-LT on 16/5/30.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.


    
    [self keyWindowAndNormalWindow];
    

    return YES;
}

- (void)printWindowAndRootVC{
    NSLog(@"windows%@",self.window);
    NSLog(@"rootviewController%@",self.window.rootViewController);
}

- (void)setKeyWindow{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UIViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

- (void)printWindowsAndKeyWindow{
    NSLog(@"%@",[UIApplication sharedApplication].windows);
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);
}

- (void)keyWindowAndNormalWindow{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    self.w2 = [[UIWindow alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.w2.backgroundColor = [UIColor yellowColor];
    self.w2.rootViewController = [[UIViewController alloc] init];
    [self.w2 makeKeyAndVisible];
    
    UITextField *t1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    t1.borderStyle = UITextBorderStyleRoundedRect;
    [self.window addSubview:t1];
    
    UITextField *t2 = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 40)];
    t2.borderStyle = UITextBorderStyleRoundedRect;
    [self.w2 addSubview:t2];
    
    [self printWindowsAndKeyWindow];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
