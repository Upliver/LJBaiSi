//
//  LJRecommandViewController.m
//  百思静
//
//  Created by 李学林 on 16/3/10.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJCatategoryCell.h"
#import "LJRecommandViewController.h"
#import "SVProgressHUD.h"
#import <AFNetworking.h>

#import <MJExtension.h>
#import <MJRefresh.h>
// 模型
#import "LJRecommandCategory.h"
#import "LJRecommandUser.h"
#import "LJRecommandUserCell.h"

#define LJSelectedCategory self.categories[[self.categoryTableView indexPathForSelectedRow].row]

@interface LJRecommandViewController () <UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic, strong) NSArray *categories;

@property(weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property(weak, nonatomic) IBOutlet UITableView *userTableView;

@property(nonatomic, strong) NSMutableDictionary *paras;
/**
 *  AFN管理类
 */
@property(nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation LJRecommandViewController

static NSString *const categoryID = @"category";
static NSString *const userID = @"user";

#pragma mark -懒加载
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    // 集成刷新控件
    
    [self setupRefresh];
}
/**
 *  tableView初始化
 */
- (void)setupTableView {
    // 注册cell
    [self.categoryTableView registerNib:[UINib nibWithNibName:@"LJCatategoryCell"
                                                       bundle:nil]
                 forCellReuseIdentifier:categoryID];
    [self.userTableView
     registerNib:[UINib
                  nibWithNibName:NSStringFromClass(
                                                   [LJRecommandUserCell class])
                  bundle:nil]
     forCellReuseIdentifier:userID];
    
    // 设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.rowHeight = 70;
    
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = LJBJColor;
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [self loadCategory];
}


/**
 *  加载左侧'类别'的数据
 */
- (void)loadCategory
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php"
           parameters:params
             progress:^(NSProgress *_Nonnull downloadProgress) {
                 //
             }
              success:^(NSURLSessionDataTask *_Nonnull task,
                        id _Nullable responseObject) {
                  // 将字典数组转成模型数组
                  self.categories = [LJRecommandCategory
                                     mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
                  
                  [self.categoryTableView reloadData];
                  
                  [SVProgressHUD dismiss];
                  // 设置默认选中第一行
                  [self.categoryTableView
                   selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                   animated:NO
                   scrollPosition:UITableViewScrollPositionTop];
                  
                  // 默认选中第一行后,自动进入下拉刷新状态
                  [self.userTableView.mj_header beginRefreshing];
              }
              failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                  //
                  [SVProgressHUD showErrorWithStatus:@"加载失败~"];
              }];
}

/**
 *  集成刷新控件的方法
 */
- (void)setupRefresh
{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
}

#pragma mark -加载新的数据(下拉刷新)
- (void)loadNewUsers
{
    LJRecommandCategory *rc = LJSelectedCategory;
    
    rc.currentPage = 1;
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    paras[@"a"] = @"list";
    paras[@"c"] = @"subscribe";
    paras[@"category_id"] = @(rc.id);
    paras[@"page"] = @(rc.currentPage);
    self.paras = paras;
    [self.manager
     GET:@"http://api.budejie.com/api/api_open.php"
     parameters:paras
     progress:^(NSProgress *_Nonnull downloadProgress) {
         //
         if (self.paras != paras) return ;
     }
     success:^(NSURLSessionDataTask *_Nonnull task,
               id _Nullable responseObject) {
         if (self.paras != paras) return ;
        
         // 字典数组转成模型数组
         NSArray *users = [LJRecommandUser
                           mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         
         // 下拉刷新要清楚所有的内存中的数据,获得新的数据
         [rc.users removeAllObjects];
         // 将数据保存到内存中
         [rc.users addObjectsFromArray:users];
         
         // 保存总数
         rc.total = [responseObject[@"total"] integerValue];
         
         [self.userTableView reloadData];
         
         // 结束刷新
         [self.userTableView.mj_header endRefreshing];
         
         // 结束footer
         [self checkFooterState];
         
     }
     failure:^(NSURLSessionDataTask *_Nullable task,
               NSError *_Nonnull error) {
         if (self.paras != paras) return ;
         
         [SVProgressHUD showErrorWithStatus:@"----"];
         // 结束刷新
         [self.userTableView.mj_header endRefreshing];
     }];
}

#pragma mark -加载更多数据(上拉加载)
- (void)loadMoreUsers
{
    LJRecommandCategory *category = LJSelectedCategory;
    
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    paras[@"a"] = @"list";
    paras[@"c"] = @"subscribe";
    paras[@"category_id"] = @(category.id);
    paras[@"page"] = @(++category.currentPage);
    self.paras = paras;

    [self.manager GET:@"http://api.budejie.com/api/api_open.php"
        parameters:paras
        progress:^(NSProgress *_Nonnull downloadProgress) {
            // 判断如果不是同一次请求 就直接返回
            if (self.paras != paras)
                return;
        }
        success:^(NSURLSessionDataTask *_Nonnull task,
                  id _Nullable responseObject) {
          // 判断如果不是同一次请求 就直接返回
          if (self.paras != paras)
            return;

          // 字典数组转成模型数组
          NSArray *users = [LJRecommandUser
              mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
          // 将请求回来的数据存放到数组中
          [category.users addObjectsFromArray:users];

          [self.userTableView reloadData];

          // 让底部控件结束刷新
          [self checkFooterState];
        }
        failure:^(NSURLSessionDataTask *_Nullable task,
                  NSError *_Nonnull error) {
          // 判断如果不是同一次请求 就直接返回
          if (self.paras != paras)
            return;

          [self.userTableView.mj_footer endRefreshing];
        }];
}

/**
 *  时刻检测footer状态
 */
- (void)checkFooterState
{
    LJRecommandCategory *rc = LJSelectedCategory;
    // 每次刷新右边数据时,都控制footer显示或者隐藏
    self.userTableView.mj_footer.hidden = (rc.users.count == 0);
    // 让底部控件结束刷新
    if (rc.users.count == rc.total) { // 加载完毕了
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else{// 还有没哟加载完毕
        [self.userTableView.mj_footer endRefreshing];
    }
}


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.categoryTableView) {
        return self.categories.count;
    } else {
        LJRecommandCategory *rc = LJSelectedCategory;
        NSInteger count = rc.users.count;
        // 时刻检测footer状态
        [self checkFooterState];
        return count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryTableView) { //左边
        
        LJCatategoryCell *cell =
        [tableView dequeueReusableCellWithIdentifier:categoryID];
        
        cell.category = self.categories[indexPath.row];
        
        return cell;
    } else { // 右边
        LJRecommandUserCell *cell =
        [tableView dequeueReusableCellWithIdentifier:userID];
        cell.user = [LJSelectedCategory users][indexPath.row];
        
        return cell;
    }
}

#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    
    LJRecommandCategory *rc = self.categories[indexPath.row];
    if (rc.users.count) {
        // 加载储存的数据
        [self.userTableView reloadData];
    } else {
        // 这句话是为了解决当网速慢的时候,防止用户看到上一category数据,所以要通过赶紧reloaddata解决这个问题;
        [self.userTableView reloadData];
        
        // 进入下拉刷新状态
        [self.userTableView.mj_header beginRefreshing];
    }
}


#pragma mark -控制器销毁
- (void)dealloc
{
    // 停止所有操作
    [self.manager.operationQueue cancelAllOperations];

}

@end
