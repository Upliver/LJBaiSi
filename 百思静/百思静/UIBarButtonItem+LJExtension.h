//
//  UIBarButtonItem+LJExtension.h
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LJExtension)

+ (instancetype)itemWithImage:(NSString *)image seleImage:(NSString *)seleImage target:(id)target action:(SEL)action;

@end
