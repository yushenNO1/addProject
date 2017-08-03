//
//  LYTSortChildVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/26.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTSortChildVC.h"
#import "LYTSortChildCell.h"
#import "LYTPrivatelyToors.h"
@interface LYTSortChildVC ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation LYTSortChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[LYTSortChildCell class] forCellReuseIdentifier:@"LYTSortChildCell"];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _index + 3;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYTSortChildCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LYTSortChildCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.addBtn.tag = indexPath.row;
    [cell.addBtn addTarget:self action:@selector(cellAddBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.BtnClick = ^(UIButton *sender){
        
        CGRect rect = [tableView rectForRowAtIndexPath:indexPath];
        //获取当前cell 相对于self.view 当前的坐标
        rect.origin.y = rect.origin.y - [tableView contentOffset].y;
        CGRect btnRect = sender.frame;
        btnRect.origin.y = rect.origin.y+btnRect.origin.y;
//        NSLog(@"btnRect---%@",NSStringFromCGRect(btnRect));
        _addBtnClick(btnRect,sender);
    };
    return cell;
}
-(void)cellAddBtnClick:(UIButton *)sender{
    NSLog(@"cellAddBtnClick*******%ld",sender.tag);
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _tableOffset(scrollView.contentOffset.y);
}
@end
