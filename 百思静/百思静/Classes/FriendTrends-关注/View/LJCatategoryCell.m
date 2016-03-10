//
//  LJCatategoryCell.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJCatategoryCell.h"
#import "LJRecommandCategory.h"


@interface LJCatategoryCell ()
//
@property (weak, nonatomic) IBOutlet UIView *leftLine;


@end

@implementation LJCatategoryCell

- (void)awakeFromNib {
    
    self.backgroundColor = LJRGBColor(244, 244, 244);
    
    UIView *bj = [[UIView alloc] init];
    bj.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = bj;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.leftLine.hidden = !selected;
    self.textLabel.textColor = selected ? LJRGBColor(219, 21, 26):LJRGBColor(78, 78, 78);
}

- (void)setCategory:(LJRecommandCategory *)category
{
    _category = category;
    
    self.textLabel.text = category.name;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.height -= 2;
    

}



@end
