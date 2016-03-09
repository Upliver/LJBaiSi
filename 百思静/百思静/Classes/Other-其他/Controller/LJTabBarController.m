//
//  LJTabBarController.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJTabBarController.h"
#import "LJEssenceViewController.h"
#import "LJNewViewController.h"
#import "LJFriendTrendsViewController.h"
#import "LJMeViewController.h"
#import "LJTabBar.h"

@interface LJTabBarController ()

@end

@implementation LJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *attrsSele = [NSMutableDictionary dictionary];
    attrsSele[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    attrsSele[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    // 利用appearance对象
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:attrsSele forState:UIControlStateSelected];
    
    [self addChildViewController:[[LJEssenceViewController alloc]init] Title:@"精华" image:@"tabBar_essence_icon" seleImage:@"tabBar_essence_click_icon"];
    [self addChildViewController:[[LJNewViewController alloc]init] Title:@"新帖" image:@"tabBar_new_icon" seleImage:@"tabBar_new_click_icon"];
    [self addChildViewController:[[LJFriendTrendsViewController alloc] init] Title:@"关注" image:@"tabBar_friendTrends_icon" seleImage:@"tabBar_friendTrends_click_icon"];
    [self addChildViewController:[[LJMeViewController alloc] init] Title:@"我" image:@"tabBar_me_icon" seleImage:@"tabBar_me_click_icon"];
    ;
    

    
    [self setValue:[[LJTabBar alloc] init] forKey:@"tabBar"];

}


/**
 *  添加自控制器方法
 *
 *  @param title     名字
 *  @param image     图片
 *  @param seleImage 选中图片
 */
- (void)addChildViewController:(UIViewController *)vc Title:(NSString *)title image:(NSString *)image seleImage:(NSString *)seleImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:seleImage];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1];
    
    // 包装一层导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

@end
