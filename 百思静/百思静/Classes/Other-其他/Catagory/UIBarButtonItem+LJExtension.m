
//
//  UIBarButtonItem+LJExtension.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "UIBarButtonItem+LJExtension.h"

@implementation UIBarButtonItem (LJExtension)

+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)hightImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}
@end
