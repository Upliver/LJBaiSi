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
        [self addSubview:btn];
        self.centerBtn = btn;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.centerBtn.bounds = CGRectMake(0, 0, self.centerBtn.currentBackgroundImage.size.width, self.centerBtn.currentBackgroundImage.size.height);
    self.centerBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    

}

@end
