//
//  HomeViewController.m
//  Drawer
//
//  Created by txx on 16/12/15.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "HomeViewController.h"
#import "ContentViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    //全局变量在视图控制器销毁之前不会被释放掉
    ContentViewController *contentVc;
    UINavigationController *contentNav;
}

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"home";
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.navigationBar.hidden = YES ;
    
    //先添加tableView 后添加ContentView，这样才能显示contentView的内容
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self ;
    self.tableView.dataSource = self ;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    contentVc = [[ContentViewController alloc]init];
    contentNav = [[UINavigationController alloc]initWithRootViewController:contentVc];
    [self.view addSubview:contentNav.view] ;

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
    [UIView animateWithDuration:.5 animations:^{
        contentNav.view.frame = [UIScreen mainScreen].bounds;
    }];
    contentVc.clickIndex = indexPath.row ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
