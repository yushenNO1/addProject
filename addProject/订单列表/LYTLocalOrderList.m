//
//  LYTLocalOrderList.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/10.
//  Copyright © 2017年 神廷. All rights reserved.
//

static NSString *DefaultCell            = @"DefaultCell";


#import "LYTLocalOrderList.h"

@interface LYTLocalOrderList ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UITableView *LYTOrderListTable;

@end

@implementation LYTLocalOrderList

-(UITableView *)LYTOrderListTable{
    if (!_LYTOrderListTable) {
        _LYTOrderListTable = [[UITableView alloc]initWithFrame:WDH_CGRectMake(0, 0, kScreenWidth, kScreenHeight ) style:UITableViewStylePlain];
        _LYTOrderListTable.delegate = self;
        _LYTOrderListTable.dataSource = self;
        [_LYTOrderListTable registerClass:[UITableViewCell class] forCellReuseIdentifier:DefaultCell];

    }
    return _LYTOrderListTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



#pragma mark--------tableViewDataSource--------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
    return cell;
}


@end
