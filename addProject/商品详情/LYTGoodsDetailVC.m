//
//  LYTGoodsDetailVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/31.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTGoodsDetailVC.h"


static NSString *DefaultCell = @"DefaultCell";

@interface LYTGoodsDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UITableView *LYTGoodsDetailTable;


@end

@implementation LYTGoodsDetailVC

-(UITableView *)LYTGoodsDetailTable{
    if (!_LYTGoodsDetailTable) {
        _LYTGoodsDetailTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _LYTGoodsDetailTable.delegate = self;
        _LYTGoodsDetailTable.dataSource = self;
        [_LYTGoodsDetailTable registerClass:[UITableViewCell class] forCellReuseIdentifier:DefaultCell];
    }
    return _LYTGoodsDetailTable;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.LYTGoodsDetailTable];
}
-(void)configHeaderView{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 375)];
    scroll.contentSize = CGSizeMake(375 * 3, 375);
    scroll.pagingEnabled = YES;
    self.LYTGoodsDetailTable.tableHeaderView = scroll;
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
