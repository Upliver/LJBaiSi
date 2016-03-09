
//
//  LJMeViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJMeViewController.h"

@interface LJMeViewController ()

@end

@implementation LJMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:@"mine-setting-icon"
                         seleImage:@"mine-setting-icon-click"
                            target:self
                            action:@selector(settingClick)];
    UIBarButtonItem *item2 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" seleImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[
                                               item1,
                                               item2
                                               ];
    
}

- (void)settingClick {
    LJLogFunc;
}

- (void)moonClick {
    LJLogFunc;
}
@end
