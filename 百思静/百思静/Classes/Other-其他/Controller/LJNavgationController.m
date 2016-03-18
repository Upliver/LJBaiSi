//
//  LJNavgationController.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJNavgationController.h"

@interface LJNavgationController ()

@end

@implementation LJNavgationController
+ (void)initialize
{
    UINavigationBar *nav = [UINavigationBar appearance];
    [nav setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        [backBtn sizeToFit];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        backBtn.backgroundColor = [UIColor greenColor];
        backBtn.size = CGSizeMake(60, 30);
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)back
{
    [self popViewControllerAnimated:YES];
}
@end
