//
//  AppDelegate.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/28/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "SideMenuViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
//                                      forBarPosition:UIBarPositionAny
//                                          barMetrics:UIBarMetricsDefault];
//    
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
//    [[UILabel appearanceWhenContainedIn:[UISegmentedControl class], nil] setNumberOfLines:0];
    
    //[application setStatusBarHidden:YES];
    UIStoryboard *storyboard =
    [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SideMenuViewController *leftVC = [storyboard
                                    instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
    UINavigationController *rootVC =
    [storyboard instantiateViewControllerWithIdentifier:@"RootVC"];
    _sideMenu =
    [[REFrostedViewController alloc] initWithContentViewController:rootVC
                                                menuViewController:leftVC];
    
    _sideMenu.backgroundFadeAmount = 0.8f;
    _sideMenu.panGestureEnabled = YES;
    self.window.rootViewController = _sideMenu;

    
    // TouchID Implement
    
//////////////////////////
//    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x363636)];
    // Override point for customization after application launch.
    return YES;
}


-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    if(self.restrictRotation)
    {
        return UIInterfaceOrientationMaskPortrait;
    }
    else
    {
        
        return UIInterfaceOrientationMaskAll;
    }
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
