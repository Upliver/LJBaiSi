//
//  LJFriendTrendsViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJFriendTrendsViewController.h"

@interface LJFriendTrendsViewController ()

@end

@implementation LJFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = titleImage;
    
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem itemWithImage:@"friendsRecommentIcon"
                         seleImage:@"friendsRecommentIcon-click"
                            target:self
                            action:@selector(friendsRecommentIconClick)];
}

- (void)friendsRecommentIconClick {
    LJLogFunc;
}
@end
