
//
//  LJTabBar.m
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJTabBar.h"

@interface LJTabBar()

@property(nonatomic, weak) UIButton *publishButton;


@end

@implementation LJTabBar

- (instancetype)initWithFrame:(CGRect)frame {

  if (self = [super initWithFrame:frame]) {

    UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [publishButton
        setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"]
                  forState:UIControlStateNormal];
    [publishButton
        setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"]
                  forState:UIControlStateSelected];
    publishButton.size = publishButton.currentBackgroundImage.size;
    [self addSubview:publishButton];
    self.publishButton = publishButton;
  }
  return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.publishButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
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
@end
