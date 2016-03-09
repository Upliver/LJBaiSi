//
//  UIBarButtonItem+LJExtension.h
//  百思不得静
//
//  Created by 李学林 on 16/3/9.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LJExtension)

+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

@end
