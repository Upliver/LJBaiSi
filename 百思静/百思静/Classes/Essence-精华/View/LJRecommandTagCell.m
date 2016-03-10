//
//  LJRecommandTagCell.m
//  百思静
//
//  Created by 李学林 on 16/3/11.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJRecommandTagCell.h"
#import "LJRecommandTag.h"
#import <UIImageView+WebCache.h>
@interface LJRecommandTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

@implementation LJRecommandTagCell

- (void)awakeFromNib {
    
}

- (void)setRecommandTag:(LJRecommandTag *)recommandTag
{
    _recommandTag = recommandTag;
    
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:recommandTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.nameLabel.text = recommandTag.theme_name;
    
    NSString *subNumber = nil;
    if (recommandTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅",recommandTag.sub_number];
    }else{
        
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅",recommandTag.sub_number/10000.0];
    }
    
    self.subLabel.text = subNumber;
    
}


- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 7;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 3;

    [super setFrame:frame];
}

@end
