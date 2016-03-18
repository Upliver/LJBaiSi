//
//  LJVerticalButton.m
//  百思静
//
//  Created by 李学林 on 16/3/11.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJVerticalButton.h"

@implementation LJVerticalButton

- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.height;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}

@end
