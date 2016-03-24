//
//  LJAllViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/25.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJAllViewController.h"

@interface LJAllViewController ()

@end

@implementation LJAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
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
