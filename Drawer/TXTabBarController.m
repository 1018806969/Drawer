//
//  TXTabBarController.m
//  Drawer
//
//  Created by txx on 16/12/15.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TXTabBarController.h"
#import "TXNavController.h"

#import "MessageViewController.h"
#import "PersonalViewController.h"


#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "CenterViewController.h"
#import "RightViewController.h"



@interface TXTabBarController ()

@property(nonatomic,strong)MMDrawerController *drawerController;

@end

@implementation TXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllerOfDrawerController];
    
    MessageViewController *messageVc = [MessageViewController new];
    [self addChildViewController:messageVc title:@"message" imageName:@"message"];
    
    PersonalViewController *personalVc = [PersonalViewController new];
    [self addChildViewController:personalVc title:@"personal" imageName:@"personal"];
    

}
/**
 添加drawerController到tabbar
 */
-(void)addChildViewControllerOfDrawerController
{
    LeftViewController *leftVc = [[LeftViewController alloc]init];
    RightViewController *rightVc = [[RightViewController alloc]init];
    CenterViewController *centerVc = [[CenterViewController alloc]init];
    
    
    //初始化导航控制器
    UINavigationController *centerNvaVC = [[UINavigationController alloc]initWithRootViewController:centerVc];
    UINavigationController *leftNvaVC = [[UINavigationController alloc]initWithRootViewController:leftVc];
    UINavigationController *rightNvaVC = [[UINavigationController alloc]initWithRootViewController:rightVc];
    
    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNvaVC leftDrawerViewController:leftNvaVC rightDrawerViewController:rightNvaVC];
    
    //设置打开/关闭drawer的手势
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    //设置左右drawer显示多少
    self.drawerController.maximumLeftDrawerWidth = 200 ;
    self.drawerController.maximumRightDrawerWidth = 200;
    
    self.drawerController.tabBarItem.image = [UIImage imageNamed:@"home"];
    self.drawerController.tabBarItem.title = @"home";
    [self addChildViewController:self.drawerController];
}
-(void)addChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)name
{
    TXNavController *nav = [[TXNavController alloc]initWithRootViewController:vc];
    vc.title = title ;
    vc.tabBarItem.image = [UIImage imageNamed:name];
    [self addChildViewController:nav];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
