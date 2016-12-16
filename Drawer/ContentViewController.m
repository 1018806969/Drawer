//
//  ContentViewController.m
//  Drawer
//
//  Created by txx on 16/12/16.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"content";
    self.view.backgroundColor = [UIColor redColor];

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"< drawer" style:UIBarButtonItemStylePlain target:self action:@selector(drawer)];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.navigationController.view addGestureRecognizer:tapGesture];
}
-(void)drawer
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (self.navigationController.view.frame.origin.x == 0) {
        [UIView animateWithDuration:.5 animations:^{
            self.navigationController.view.frame = CGRectMake(width/2, height*.2, width/2, height*0.6);
        }];
    }else
    {
        [UIView animateWithDuration:.5 animations:^{
            self.navigationController.view.frame = CGRectMake(0, 0, width, height);
        }];
    }
}
-(void)tapClick
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:.5 animations:^{
        self.navigationController.view.frame = CGRectMake(0, 0, width, height);
    }];
}
-(void)setClickIndex:(NSInteger)clickIndex
{
    if (clickIndex ==_clickIndex)return;
    _clickIndex = clickIndex;
    NSLog(@"-----------------%ld",(long)_clickIndex);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
