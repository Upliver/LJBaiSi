//
//  LJEssenceViewController.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJEssenceViewController.h"

@interface LJEssenceViewController ()

@end

@implementation LJEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
}

- (void)tagClick
{
    LJLog(@"%s",__func__);
}
@end
