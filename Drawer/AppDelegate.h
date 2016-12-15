//
//  AppDelegate.h
//  Drawer
//
//  Created by txx on 16/12/14.
//  Copyright © 2016年 txx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/*
 
 1、首先创建三个控制器为center、left、right，创建完成之后，我们来到我们的AppDelegate，开始编写我们的代码了
 1.1、多话不说，先导入头文件，并且添加一个MMDrawerController的属性
 
 //为MMDrawerController框架中
 #import "MMDrawerController.h"
 #import "UIViewController+MMDrawerController.h"
 
 //为自己创建的三个控制器
 #import "LitterLCenterViewController.h"
 #import "LitterLLeftViewController.h"
 #import "LitterLRightViewController.h"
 
 @interface LitterLAppDelegate ()
 *  MMDrawerController属性
@property(nonatomic,strong) MMDrawerController * drawerController;
@end
1.2、上面的做完后，我们便要显示我们的窗口到设备上，接下来来到这里

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1、初始化控制器
    UIViewController *centerVC = [[LitterLCenterViewController alloc]init];
    UIViewController *leftVC = [[LitterLLeftViewController alloc]init];
    UIViewController *rightVC = [[LitterLRightViewController alloc]init];
    //2、初始化导航控制器
    UINavigationController *centerNvaVC = [[UINavigationController alloc]initWithRootViewController:centerVC];
    UINavigationController *leftNvaVC = [[UINavigationController alloc]initWithRootViewController:leftVC];
    UINavigationController *rightNvaVC = [[UINavigationController alloc]initWithRootViewController:rightVC];
    
    //3、使用MMDrawerController
    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNvaVC leftDrawerViewController:leftNvaVC rightDrawerViewController:rightNvaVC];
    
    //4、设置打开/关闭抽屉的手势
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    //5、设置左右两边抽屉显示的多少
    self.drawerController.maximumLeftDrawerWidth = 200.0;
    self.drawerController.maximumRightDrawerWidth = 200.0;
    
    //6、初始化窗口、设置根控制器、显示窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:self.drawerController];
    [self.window makeKeyAndVisible];
    return YES;
}
2、完成上面后基本的抽屉效果就已经实现了，在这里的话，我们将要实现导航栏上面的按钮，以及一些效果。
2.1、这里的话我们先实现导航栏的效果吧：

2.1.1、这里的话我用的是通过UIBarButtonItem的方法去实现的
self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtn)];
self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_friendattention"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
2.1.2、然而我们的作者给了我们一个类，里面有他通过QuartzCore绘制出来的按钮，你们想看的话可以去看看
//首先得导入头文件
#import "MMDrawerBarButtonItem.h"
//----------------------------
self.navigationItem.leftBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(leftBtn)];
self.navigationItem.rightBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(rightBtn)];
2.1.3、这里的话就是我们的方法，其实很简单(就一行代码)但是过程很迷茫
//首先得导入头文件
#import "UIViewController+MMDrawerController.h"
//----------------------------
-(void)leftBtn{
    //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(void)rightBtn{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
2.2、完成上面后，导航栏的点击就能切换，那么我们就来实现一个效果吧，所谓的弹簧效果，也就几句代码

//2、添加双击手势
UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
//2.1、双击
[doubleTap setNumberOfTapsRequired:2];
[self.view addGestureRecognizer:doubleTap];

//3、添加两个手指双击手势
UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
//3.1、双击
[twoFingerDoubleTap setNumberOfTapsRequired:2];
//3.2、两个手指  默认为一个
[twoFingerDoubleTap setNumberOfTouchesRequired:2];
[self.view addGestureRecognizer:twoFingerDoubleTap];

//----------------------------
 *  添加点击手势  一个手指双击
-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

 *  添加点击手势  两个个手指双击
-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}
3、到这里的话就是最后一步了，第一设置数据源，第二实现协议了。
3.1、数据源的编写，这里的话我用的都是静态数据，就不做解释了，右侧和左侧抽屉都为一样的，你们自行查看吧
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"Left-Demo%ld",indexPath.row];
    return cell;
}
3.2、这里就是我们的最后一步，点击Cell跳转控制器了,那么我们的有一个控制器取名去:LitterLShowViewController
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LitterLShowViewController *showVC = [[LitterLShowViewController alloc]init];
    showVC.title = [NSString stringWithFormat:@"Left-Demo%ld",indexPath.row];
    
    //拿到我们的LitterLCenterViewController，让它去push
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    [nav pushViewController:showVC animated:NO];
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}
4、差点忘了一个，就是当我们的LitterLShowViewController退出后，我们的把打开抽屉模式在切换过来,当然这个是在中间控制器里面去写，因为LitterLShowViewController退出后会呈现中间控制器
 
 *  加载控制器的时候设置打开抽屉模式  (因为在后面会关闭)
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置打开抽屉模式
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
}
 
 */
@end

