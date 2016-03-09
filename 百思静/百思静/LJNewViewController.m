//
//  LJNewViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJNewViewController.h"

@interface LJNewViewController ()

@end

@implementation LJNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新帖";
    
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem itemWithImage:@"MainTagSubIcon"
                         seleImage:@"MainTagSubIconClick"
                            target:self
                            action:@selector(tagClick)];
}

- (void)tagClick {
    LJLogFunc;
}
@end
