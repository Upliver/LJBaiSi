
//
//  LJRecommandCategory.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJRecommandCategory.h"



@implementation LJRecommandCategory


- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}
@end
