//
//  LJRecommandTagViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/11.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJRecommandTagViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "LJRecommandTag.h"
#import "LJRecommandTagCell.h"


@interface LJRecommandTagViewController ()

@property(nonatomic, strong) NSArray *tags;

@end

static NSString  *const LJTagId = @"tag";

@implementation LJRecommandTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化tableView
    [self setupTableView];
    
    // 加载数据
    [self loadTags];
    
}


#pragma mark -setup

- (void)setupTableView
{
    self.navigationItem.title = @"推荐标签";
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LJRecommandTagCell class]) bundle:nil] forCellReuseIdentifier:LJTagId];
    self.tableView.rowHeight = 70;
    self.tableView.backgroundColor = LJBJColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)loadTags
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    // 发送请求
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    paras[@"a"] = @"tag_recommend";
    paras[@"action"] = @"sub";
    paras[@"c"] = @"topic";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.tags = [LJRecommandTag mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        
        [SVProgressHUD showErrorWithStatus:@"请求失败~"];
    }];

}

#pragma mark -datasorce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tags.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LJRecommandTagCell *cell = [tableView dequeueReusableCellWithIdentifier:LJTagId];
    
    cell.recommandTag = self.tags[indexPath.row];
    
    return cell;
}

@end
