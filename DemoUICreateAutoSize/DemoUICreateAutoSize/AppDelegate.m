//
//  AppDelegate.m
//  DemoUICreateAutoSize
//
//  Created by zhangshaoyu on 2019/6/14.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SYAutoSizeCGRect.h"

@interface AppDelegate () 

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //
    SYUIAutoSizeModel *model = [SYUIAutoSizeModel new];
    model.typeName = @"iPhoneXsMax";
    model.typeSize = CGSizeMake(414,896);
    model.typeInch = 6.5;
    UIAutoSize.defaultLayout = model;
    //
//    SYUIAutoSizeModel *model = [SYUIAutoSizeModel new];
//    model.typeName = @"iPhone5";
//    model.typeSize = CGSizeMake(320,568);
//    model.typeInch = 4.0;
//    UIAutoSize.defaultLayout = model;
    //
    UIAutoSize.layoutType = UIAutoLayoutTypeiPhone4;
//    UIAutoSize.layoutType = UIAutoLayoutTypeiPhoneXR;
    //
    UIAutoSize.isAuto = YES;
    NSLog(@"size %@, layoutSize %@", NSStringFromCGSize(UIScreen.mainScreen.bounds.size), NSStringFromCGSize(UIAutoSize.layoutSize));
    
    //
    ViewController *rootVC = [[ViewController alloc] init];
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = rootNav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
