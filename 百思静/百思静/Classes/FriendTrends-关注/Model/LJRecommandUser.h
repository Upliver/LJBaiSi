//
//  LJRecommandUser.h
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRecommandUser : NSObject
/**
 *  头像
 */
@property(nonatomic, copy) NSString *header;
/**
 *  粉丝数
 */
@property(nonatomic, assign) NSInteger fans_count;
/**
 *  昵称
 */
@property(nonatomic, strong) NSString *screen_name;
@end
