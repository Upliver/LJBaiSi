

//
//  LJMeViewController.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJMeViewController.h"

@interface LJMeViewController ()

@end

@implementation LJMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highlightImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];

    
    self.navigationItem.rightBarButtonItems = @[
                                                settingItem,
                                                moonItem
                                                ];
    
    self.view.backgroundColor = LJBJColor;
}

- (void)settingClick
{
    LJLogFunc;
}

- (void)moonClick
{
    LJLogFunc;
}
@end
