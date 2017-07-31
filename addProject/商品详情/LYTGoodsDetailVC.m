//
//  LYTGoodsDetailVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/31.
//  Copyright © 2017年 神廷. All rights reserved.
//

#define FooterHight             50              //tableView尾部高度





#import "LYTGoodsDetailVC.h"


static NSString *DefaultCell = @"DefaultCell";

@interface LYTGoodsDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UIView           *statusBarView;     //隐藏导航条和状态栏
@property(nonatomic,retain)UITableView *LYTGoodsDetailTable;


@end

@implementation LYTGoodsDetailVC

-(UITableView *)LYTGoodsDetailTable{
    if (!_LYTGoodsDetailTable) {
        _LYTGoodsDetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight + FooterHight) style:UITableViewStylePlain];
        _LYTGoodsDetailTable.delegate = self;
        _LYTGoodsDetailTable.dataSource = self;
        [_LYTGoodsDetailTable registerClass:[UITableViewCell class] forCellReuseIdentifier:DefaultCell];
    }
    return _LYTGoodsDetailTable;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _LYTGoodsDetailTable.contentInset = UIEdgeInsetsZero;
    _LYTGoodsDetailTable.scrollIndicatorInsets = UIEdgeInsetsZero;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //导航条的透明值
    [self.navigationController.navigationBar setValue:@(0)forKeyPath:@"backgroundView.alpha"];
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    _statusBarView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setValue:@(1)forKeyPath:@"backgroundView.alpha"];
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [_statusBarView removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //状态栏
    _statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    _statusBarView.backgroundColor=[UIColor colorWithRed:33/255.0 green:35/255.0 blue:33/255.0 alpha:0];
    [self.navigationController.navigationBar addSubview:_statusBarView];
    
    //添加头部视图
    [self configHeaderView];
    //添加尾部视图
    [self configFooterView];
    [self.view addSubview:self.LYTGoodsDetailTable];
}
-(void)configHeaderView{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth)];
    scroll.contentSize = CGSizeMake(kScreenWidth * 3, kScreenWidth);
    scroll.pagingEnabled = YES;
    scroll.backgroundColor = [UIColor redColor];
//    for (int i = 0; i < 3; i ++) {
//        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(375 * i, 0, 375, 375)];
//        [img sd_setImageWithURL:[NSURL URLWithString:@"http://img002.21cnimg.com/photos/album/20150702/m600/2D79154370E073A2BA3CD4D07868861D.jpeg"]];
//        [scroll addSubview:img];
//    }
    
    self.LYTGoodsDetailTable.tableHeaderView = scroll;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.LYTGoodsDetailTable) {
        [self.navigationController.navigationBar setValue:@(scrollView.contentOffset.y/100)forKeyPath:@"backgroundView.alpha"];
        self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        _statusBarView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:scrollView.contentOffset.y/(100)];
    } else {
        
    }
}

-(void)configFooterView{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, FooterHight)];
    footerView.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc]initWithFrame:footerView.frame];
    label.text = @"上拉查看商品详情";
    label.textAlignment = NSTextAlignmentCenter;
    [footerView addSubview:label];
    self.LYTGoodsDetailTable.tableFooterView = footerView;
}


#pragma mark -------tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
