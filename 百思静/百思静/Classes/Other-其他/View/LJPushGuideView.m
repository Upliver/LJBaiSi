//
//  LJPushGuideView.m
//  百思静
//
//  Created by 李学林 on 16/3/24.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJPushGuideView.h"

@implementation LJPushGuideView


+ (instancetype)guideView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

- (IBAction)close {
    
    [self removeFromSuperview];
}

+ (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    NSString *key = @"CFBundleShortVersionString";
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    NSString *sandBoxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sandBoxVersion]) {
        
        LJPushGuideView *guideView = [LJPushGuideView guideView];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
