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
        _clickBtn.frame = WDH_CGRectMake(0, 0, 63, 80);
    }
    return _clickBtn;
}
-(UIImageView *)btnImg{
    if (!_btnImg) {
        _btnImg = [[UIImageView alloc]initWithFrame:WDH_CGRectMake(5, 5, 53, 53)];
        [LYTPrivatelyToors addMarqueeAnimationWithView:_btnImg];
    }
    return _btnImg;
}
-(UILabel *)btnTitle{
    if (!_btnTitle) {
        _btnTitle = [[UILabel alloc]initWithFrame:WDH_CGRectMake(5, 60, 53, 20)];
        _btnTitle.textAlignment = NSTextAlignmentCenter;
        _btnTitle.font = [UIFont systemFontOfSize:12];
    }
    return _btnTitle;
}
@end




@interface LYTLifeTableVC ()
@property(nonatomic,retain)UIView           *statusBarView;     //隐藏导航条和状态栏
@end

@implementation LYTLifeTableVC
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.tableView.contentInset = UIEdgeInsetsZero;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
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
    _statusBarView = [[UIView alloc] initWithFrame:WDH_CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    _statusBarView.backgroundColor=[UIColor colorWithRed:33/255.0 green:35/255.0 blue:33/255.0 alpha:0];
    [self.navigationController.navigationBar addSubview:_statusBarView];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[LYTLifeTableCell1 class] forCellReuseIdentifier:@"LYTLifeTableCell1"];
    [self.tableView registerClass:[LYTLifeTableCell2 class] forCellReuseIdentifier:@"LYTLifeTableCell2"];
    
    [self configHeaderView];
    
    [self configSeachVC];
}
-(void)configHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 0, 375, 250 + 64 )];
    self.tableView.tableHeaderView = headerView;
    
    UIScrollView *headerScroll = [[UIScrollView alloc]initWithFrame:WDH_CGRectMake(0, 0, 375, 250 + 64 )];
    headerScroll.contentSize = CGSizeMake(kScreenWidth * 5, 250 + 64);
    headerScroll.pagingEnabled = YES;
    [headerView addSubview:headerScroll];
    
    for (int i = 0; i < 5; i ++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:WDH_CGRectMake(kScreenWidth * i, 0, kScreenWidth, 250 + 64)];
        [headerScroll addSubview:img];
        CGFloat colorF = arc4random()%255;
        img.backgroundColor = [UIColor colorWithRed:colorF/255.0 green:colorF/255.0 blue:colorF/255.0 alpha:1];
    }
    
    
    for (int i = 0; i < 5; i ++) {
        btnView *btn = [[btnView alloc]initWithFrame:WDH_CGRectMake(10 + 73 * i, 160 + 64, 63, 80)];
        btn.btnTitle.text = @"asd";
        btn.btnImg.backgroundColor = [UIColor greenColor];
        [btn.clickBtn addTarget:self action:@selector(fiveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.clickBtn.tag = i;
        
        [headerView addSubview:btn];
    }
}
-(void)configSeachVC{
    
    UIView *textBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,230, 30)];
    textBackView.backgroundColor = [UIColor blueColor];
    textBackView.layer.cornerRadius = 15;
    textBackView.layer.masksToBounds = YES;
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(30, 0, 170, 30)];
    textField.delegate = self;
    textField.backgroundColor = [UIColor redColor];
    textField.borderStyle = UITextBorderStyleNone;
    [textBackView addSubview:textField];
    self.navigationItem.titleView = textBackView;
    
    
    //    UIView *view = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 0, 100, 20)];
    //    view.backgroundColor = [UIColor redColor];
    //    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
    //    self.navigationItem.leftBarButtonItem = item;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"点击确定键执行方法走不走---%@",textField.text);
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"是不是开始编辑就执行");
    //加个蒙板
    return YES;
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
            UILabel *label = [[UILabel alloc]initWithFrame:WDH_CGRectMake(0, 0, 375, 40)];
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
