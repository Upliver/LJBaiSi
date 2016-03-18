//
//  LJFriendTrendsViewController.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJFriendTrendsViewController.h"
#import "LJRecommandViewController.h"
#import "LJRegistLoginController.h"

@interface LJFriendTrendsViewController ()

@end

@implementation LJFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightImage:@"friendsRecommentIcon-click" target:self action:@selector(friendeClick)];
    self.view.backgroundColor = LJBJColor;
}

- (void)friendeClick
{
    LJRecommandViewController *recommandVc = [[LJRecommandViewController alloc] init];
    
    [self.navigationController pushViewController:recommandVc animated:YES];
}

- (IBAction)LJLoginClick:(UIButton *)sender {
    
    
    LJRegistLoginController *loginVc = [[LJRegistLoginController alloc] init];
    
    [self presentViewController:loginVc animated:YES completion:nil];
    
    
    
}


@end
