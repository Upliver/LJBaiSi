//
//  LJEssenceViewController.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJEssenceViewController.h"
#import "LJRecommandTagViewController.h"

@interface LJEssenceViewController ()

@end

@implementation LJEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.view.backgroundColor = LJBJColor;
}

- (void)tagClick
{
    LJRecommandTagViewController *vc = [[LJRecommandTagViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
