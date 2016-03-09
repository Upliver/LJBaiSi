//
//  LJTabBar.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJTabBar.h"

@interface LJTabBar ()
@property(nonatomic, weak) UIButton  *centerBtn;

@end


@implementation LJTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(centeClick) forControlEvents:UIControlEventTouchUpInside];
        self.centerBtn = btn;
        self.centerBtn.bounds = CGRectMake(0, 0, self.centerBtn.currentBackgroundImage.size.width, self.centerBtn.currentBackgroundImage.size.height);
        [self addSubview:btn];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.centerBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    CGFloat buttonY = 0;
    CGFloat buttonW = self.width / 5;
    CGFloat buttonH = self.height;
    NSInteger index = 0;
    
    for (UIView *button in self.subviews) {
        
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")])continue;
        CGFloat buttonX = (index > 1 ? (index+1):index) * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        index++;
    }

}

- (void)centeClick
{

    LJLogFunc;
}

@end
