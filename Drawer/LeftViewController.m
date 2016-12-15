//
//  LeftViewController.m
//  Drawer
//
//  Created by txx on 16/12/15.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "LeftViewController.h"
#import "OtherViewController.h"
#import "CenterViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    self.title = @"left view";
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self ;
    self.tableView.dataSource = self ;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld -- %ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.从侧边栏跳转其他页面
    /*
    OtherViewController *otherVc = [[OtherViewController alloc]init];
    otherVc.title = [NSString stringWithFormat:@"Left-Demo%ld",indexPath.row];
    
    //拿到我们的LitterLCenterViewController，让它去push
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    [nav pushViewController:otherVc animated:YES];
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //关闭完成之后再关闭drawer的手势，如果不关闭，从其他页面侧滑不能回到centervc，而是滑出leftvc
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
        //然后需要在centervc中Viewwillappear中再次打开drawer的手势，如果不打开回到centervc之后就不能手势划开leftvc；
    }];
    */
    
    
    //2.从侧边栏回到centervc
    
    //先关闭drawer
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //关闭完成之后再打开手势，如果不打开就会造成回到centervc之后手势失效
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    }];
    //传值，可以给centervc添加一个属性，然后重写他的set方法。
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    CenterViewController *centervc = nav.viewControllers.firstObject;
    centervc.title = [NSString stringWithFormat:@"Left-Demo%ld",indexPath.row];
    centervc.string = [NSString stringWithFormat:@"Left-Demo%ld",indexPath.row];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
