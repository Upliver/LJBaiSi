//
//  LJRecommandTag.h
//  百思静
//
//  Created by 李学林 on 16/3/11.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRecommandTag : NSObject
/**
 *  图片
 */
@property(nonatomic, copy) NSString *image_list;
/**
 *  名字
 */
@property(nonatomic, copy) NSString *theme_name;
/**
 *  订阅数
 */
@property(nonatomic, assign) NSInteger sub_number;
@end
