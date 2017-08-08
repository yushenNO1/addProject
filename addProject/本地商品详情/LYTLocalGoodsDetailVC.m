//
//  LYTLocalGoodsDetailVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/7.
//  Copyright © 2017年 神廷. All rights reserved.
//
#define TableHeaderHight      300           //table头部高度



#import "LYTLocalGoodsDetailVC.h"
#import "LYTLocalGoodsDetailCell1.h"
#import "LYTLocalGoodsDetailCell2.h"
#import "LYTLocalGoodsDetailCell3.h"
#import "LYTLocalGoodsDetailCell4.h"


static NSString *DefaultCell            = @"DefaultCell";
static NSString *LocalGoodsDetailCell1  = @"LocalGoodsDetailCell1";
static NSString *LocalGoodsDetailCell2  = @"LocalGoodsDetailCell2";
static NSString *LocalGoodsDetailCell3  = @"LocalGoodsDetailCell3";
static NSString *LocalGoodsDetailCell4  = @"LocalGoodsDetailCell4";

@interface LYTLocalGoodsDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView *LYTLocalTable;
@end

@implementation LYTLocalGoodsDetailVC

-(UITableView *)LYTLocalTable{
    if (!_LYTLocalTable) {
        _LYTLocalTable = [[UITableView alloc]initWithFrame:self.view.bounds];
        _LYTLocalTable.delegate = self;
        _LYTLocalTable.dataSource = self;
        [_LYTLocalTable registerClass:[UITableViewCell class] forCellReuseIdentifier:DefaultCell];
        [_LYTLocalTable registerClass:[LYTLocalGoodsDetailCell1 class] forCellReuseIdentifier:LocalGoodsDetailCell1];
        [_LYTLocalTable registerClass:[LYTLocalGoodsDetailCell2 class] forCellReuseIdentifier:LocalGoodsDetailCell2];
        [_LYTLocalTable registerClass:[LYTLocalGoodsDetailCell3 class] forCellReuseIdentifier:LocalGoodsDetailCell3];
        [_LYTLocalTable registerClass:[LYTLocalGoodsDetailCell4 class] forCellReuseIdentifier:LocalGoodsDetailCell4];
    }
    return  _LYTLocalTable;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.LYTLocalTable];
    [self configTableHeader];
}
-(void)configTableHeader{
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, TableHeaderHight)];
    tableHeaderView.backgroundColor = [UIColor redColor];
    
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, TableHeaderHight - 50, 375, 50)];
    backView.backgroundColor = [UIColor grayColor];
    backView.alpha = 0.3;
    [tableHeaderView addSubview:backView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, TableHeaderHight - 40, 200, 30)];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"本地生活-商品详情--标题";
    [tableHeaderView addSubview:titleLabel];
    
    self.LYTLocalTable.tableHeaderView = tableHeaderView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else {
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 50;
        }else{
            return 60;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            return 30;
        }else{
            return 60;
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            return 30;
        }else{
            return 300;
        }
    }else{
        return 30;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 3;
    }else {
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LYTLocalGoodsDetailCell1 *cell = [tableView dequeueReusableCellWithIdentifier:LocalGoodsDetailCell1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            LYTLocalGoodsDetailCell2 *cell = [tableView dequeueReusableCellWithIdentifier:LocalGoodsDetailCell2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
            cell.textLabel.text = @"商家信息";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            LYTLocalGoodsDetailCell3 *cell = [tableView dequeueReusableCellWithIdentifier:LocalGoodsDetailCell3];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
            cell.textLabel.text = @"套餐内容";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            LYTLocalGoodsDetailCell4 *cell = [tableView dequeueReusableCellWithIdentifier:LocalGoodsDetailCell4];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
            cell.textLabel.text = @"使用须知";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
