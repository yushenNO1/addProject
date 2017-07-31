//
//  LYTLifeTableVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLifeTableVC.h"
#import "LYTLifeTableCell1.h"
#import "LYTLifeTableCell2.h"
#import "LYTPrivatelyToors.h"


@interface btnView : UIView
@property(nonatomic,retain)UIButton     *clickBtn;
@property(nonatomic,retain)UIImageView  *btnImg;
@property(nonatomic,retain)UILabel      *btnTitle;
@end

@implementation btnView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.btnTitle];
        [self addSubview:self.btnImg];
        [self addSubview:self.clickBtn];
    }
    return self;
}
-(UIButton *)clickBtn{
    if (!_clickBtn) {
        _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _clickBtn.frame = CGRectMake(0, 0, 63, 80);
    }
    return _clickBtn;
}
-(UIImageView *)btnImg{
    if (!_btnImg) {
        _btnImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 53, 53)];
        [LYTPrivatelyToors addMarqueeAnimationWithView:_btnImg];
    }
    return _btnImg;
}
-(UILabel *)btnTitle{
    if (!_btnTitle) {
        _btnTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, 60, 53, 20)];
        _btnTitle.textAlignment = NSTextAlignmentCenter;
        _btnTitle.font = [UIFont systemFontOfSize:12];
    }
    return _btnTitle;
}
@end




@interface LYTLifeTableVC ()

@end

@implementation LYTLifeTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[LYTLifeTableCell1 class] forCellReuseIdentifier:@"LYTLifeTableCell1"];
    [self.tableView registerClass:[LYTLifeTableCell2 class] forCellReuseIdentifier:@"LYTLifeTableCell2"];
    
    [self configHeaderView];
}
-(void)configHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 250)];
    self.tableView.tableHeaderView = headerView;
    UIImageView *img = [[UIImageView alloc]initWithFrame:headerView.frame];
    [headerView addSubview:img];
    img.backgroundColor = [UIColor redColor];
    
    for (int i = 0; i < 5; i ++) {
        btnView *btn = [[btnView alloc]initWithFrame:CGRectMake(10 + 73 * i, 160, 63, 80)];
        btn.btnTitle.text = @"asd";
        btn.btnImg.backgroundColor = [UIColor greenColor];
        [btn.clickBtn addTarget:self action:@selector(fiveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.clickBtn.tag = i;
        
        [headerView addSubview:btn];
    }
}
-(void)fiveBtnClick:(UIButton *)sender{
    NSLog(@"点击按钮---%ld",sender.tag);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 4;
    }else{
        return 4;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 150;
        }else{
            return 209;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            return 40;
        }else{
            return 100;
        }
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Configure the cell...
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            LYTLifeTableCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"LYTLifeTableCell1" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.btn1.tag = 1;
            cell.btn2.tag = 2;
            cell.btn3.tag = 3;
            cell.btn4.tag = 4;
            [cell.btn1 addTarget:self action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn2 addTarget:self action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn3 addTarget:self action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn4 addTarget:self action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            return cell;
        }
    }else{
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
            label.text = @"--- 附近商家 ---";
            label.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:label];
            return cell;
        }else{
            LYTLifeTableCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"LYTLifeTableCell2" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }

    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            NSLog(@"点击了第一区第一行");
        }
    }else{
        if (indexPath.row == 0) {
            NSLog(@"点击了第二区第一行--啥都不干");
        }else{
            NSLog(@"点击了第二区第%ld行",indexPath.row);
        }
    }
}

-(void)cellBtnClick:(UIButton *)sender{
    NSLog(@"cellBtn点击按钮---%ld",sender.tag);
}

@end
