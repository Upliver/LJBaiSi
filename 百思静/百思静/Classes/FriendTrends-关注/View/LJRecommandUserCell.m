//
//  LJRecommandUserCell.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJRecommandUserCell.h"
#import "LJRecommandUser.h"
#import <UIImageView+WebCache.h>
@interface LJRecommandUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *fansCount;

@end

@implementation LJRecommandUserCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)setUser:(LJRecommandUser *)user
{
    _user = user;
    
    self.screenName.text = user.screen_name;
    self.fansCount.text = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

@end
