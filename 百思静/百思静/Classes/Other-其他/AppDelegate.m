//
//  AppDelegate.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "AppDelegate.h"
#import "LJTabBarController.h"
#import "LJPushGuideView.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    LJTabBarController *tabBarController = [[LJTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    // 显示推送引导页,业务逻辑已经封装到控件里面了!
    [LJPushGuideView show];
    
    return YES;
}



@end
