
//
//  LJPictureViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/25.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJPictureViewController.h"

@interface LJPictureViewController ()

@end

@implementation LJPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@---%zd",[self class],indexPath.row];
    
    return cell;
}

@end
