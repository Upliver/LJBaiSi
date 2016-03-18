//
//  LJTextField.m
//  百思静
//
//  Created by 李学林 on 16/3/11.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJTextField.h"

static NSString * const LJPlacerholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation LJTextField

- (void)awakeFromNib
{
    // 设置光标的颜色
    self.tintColor = self.textColor;
    
    // 想调用resignFirstResponder方法
    [self resignFirstResponder];
}


/**
 * 当前文本框变为焦点会调用这个方法
 */
- (BOOL)becomeFirstResponder
{
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder
{
    // 修改占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    return [super resignFirstResponder];
}

@end





