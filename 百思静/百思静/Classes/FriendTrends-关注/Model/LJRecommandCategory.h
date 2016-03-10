//
//  LJRecommandCategory.h
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRecommandCategory : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger id;
@property(nonatomic, assign) NSInteger count;

/**
 *  存储每一类别对应的数据
 */
@property(nonatomic, strong) NSMutableArray *users;
/**
 *  总数
 */
@property(nonatomic, assign) NSInteger total;
/**
 *  当前页
 */
@property(nonatomic, assign) NSInteger currentPage;

@end
