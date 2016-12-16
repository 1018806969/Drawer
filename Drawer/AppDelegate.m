//
//  AppDelegate.m
//  Drawer
//
//  Created by txx on 16/12/14.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "AppDelegate.h"

#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "CenterViewController.h"
#import "RightViewController.h"

#import "TXTabBarController.h"

#import "HomeViewController.h"

@interface AppDelegate ()

@property(nonatomic,strong)MMDrawerController *drawerController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1.测试MMDrawerController，展示一个根视图为drawerController的framwork
    
//    LeftViewController *leftVc = [[LeftViewController alloc]init];
//    RightViewController *rightVc = [[RightViewController alloc]init];
//    CenterViewController *centerVc = [[CenterViewController alloc]init];
//    
//    //初始化导航控制器
//    UINavigationController *centerNvaVC = [[UINavigationController alloc]initWithRootViewController:centerVc];
//    UINavigationController *leftNvaVC = [[UINavigationController alloc]initWithRootViewController:leftVc];
//    UINavigationController *rightNvaVC = [[UINavigationController alloc]initWithRootViewController:rightVc];
//    
//    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNvaVC leftDrawerViewController:leftNvaVC rightDrawerViewController:rightNvaVC];
//    
//    //设置打开/关闭drawer的手势
//    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
//    self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
//    //设置左右drawer显示多少
//    self.drawerController.maximumLeftDrawerWidth = 200 ;
//    self.drawerController.maximumRightDrawerWidth = 200;
//    
//    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    _window.backgroundColor = [UIColor whiteColor];
//    [_window makeKeyAndVisible];
//    _window.rootViewController = _drawerController ;

    //2.展示一个tabbar为根视图的framework
    
//    TXTabBarController *tabbarController = [[TXTabBarController alloc]init];
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    _window.backgroundColor = [UIColor whiteColor];
//    [_window makeKeyAndVisible];
//    _window.rootViewController = tabbarController ;

    //3.自己实现一个简单的drawer
    HomeViewController *homeVc = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVc];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    _window.rootViewController = homeNav ;

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
