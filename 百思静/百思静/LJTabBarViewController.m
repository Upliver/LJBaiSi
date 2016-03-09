//
//  LJTabBarViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJTabBarViewController.h"
#import "LJEssenceViewController.h"
#import "LJFriendTrendsViewController.h"
#import "LJNewViewController.h"
#import "LJMeViewController.h"
#import "LJTabBar.h"

@interface LJTabBarViewController ()

@end

@implementation LJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *attrsSele = [NSMutableDictionary dictionary];
    attrsSele[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    attrsSele[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:attrsSele forState:UIControlStateSelected];
    
    [self addChildViewController:[[LJEssenceViewController alloc]init] title:@"精华" image:@"tabBar_essence_icon" seleImage:@"tabBar_essence_click_icon"];
    
    [self addChildViewController:[[LJNewViewController alloc]init] title:@"新帖" image:@"tabBar_new_icon" seleImage:@"tabBar_new_click_icon"];
    
    [self addChildViewController:[[LJFriendTrendsViewController alloc]init] title:@"关注" image:@"tabBar_friendTrends_icon" seleImage:@"tabBar_friendTrends_click_icon"];
    
    [self addChildViewController:[[LJMeViewController alloc] init] title:@"我的" image:@"tabBar_me_icon" seleImage:@"tabBar_me_click_icon"];

    [self setValue:[[LJTabBar alloc] init] forKey:@"tabBar"];
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image seleImage:(NSString *)seleImage
{
    childController.navigationItem.title = title;
    childController.tabBarItem.title = title;
    childController.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1];
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:seleImage];
    
    
    UINavigationController *nav = [[UINavigationController alloc] init];
    [nav addChildViewController:childController];
    
    [self addChildViewController: nav];

}

@end
