//
//  LYTSortVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/26.
//  Copyright © 2017年 神廷. All rights reserved.
//

#define TableWidth              80                              //tableView的宽
#define TableCellHight          30                              //tableViewCell的高

#define HeaderViewHight         150                             //顶部子视图高度
#define FooterViewHight         50                              //顶部子视图高度
#define ChildVCHight_Top        667-64-FooterViewHight          //有顶部子视图高度
#define ChildVCHight_Foot       667-150-FooterViewHight         //没有顶部子视图高度




#import "LYTSortVC.h"
#import "LYTSortChildVC.h"
#import "LYTPrivatelyToors.h"



@interface LYTSortTableCell : UITableViewCell
@property(nonatomic,retain)UILabel *label;
@end
@implementation LYTSortTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.label];
    }
    return self;
}
-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:WDH_CGRectMake(0, 0, TableWidth, TableCellHight)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
    }
    return _label;
}
@end


@interface LYTSortVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView *LYTSortTable;

@property(nonatomic,retain)NSArray          *sortArr;           //控制器分类项目
@property(nonatomic,retain)UIViewController *currentVC;         //当前显示的子视图

@property(nonatomic,retain)UIView           *statusBarView;     //隐藏导航条和状态栏

@property(nonatomic,retain)NSMutableArray   *BtnArr;            //存储动画按钮的数组
@end
static BOOL isUp = YES;
@implementation LYTSortVC
//创建列表控制
-(UITableView *)LYTSortTable{
    if (!_LYTSortTable) {
        _LYTSortTable = [[UITableView alloc]initWithFrame:WDH_CGRectMake(0, HeaderViewHight , TableWidth, 667 - HeaderViewHight - FooterViewHight) style:UITableViewStylePlain];
        _LYTSortTable.delegate = self;
        _LYTSortTable.dataSource = self;
        [_LYTSortTable registerClass:[LYTSortTableCell class] forCellReuseIdentifier:@"cell"];
        _LYTSortTable.tableFooterView = [UIView new];
    }
    return _LYTSortTable;
}
-(NSMutableArray *)BtnArr{
    if (!_BtnArr) {
        _BtnArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _BtnArr;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //导航条的透明值
    [self.navigationController.navigationBar setValue:@(0)forKeyPath:@"backgroundView.alpha"];
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    _statusBarView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:self.LYTSortTable.contentOffset.y/(105+64)];
    
    
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.LYTSortTable selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setValue:@(1)forKeyPath:@"backgroundView.alpha"];
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sortArr = @[@"推荐",@"套餐1",@"套餐2",@"套餐3",@"套餐4"];
    //添加顶部视图
    [self configHeaderView];
    
    [self.view addSubview:self.LYTSortTable];
    
    //添加子视图
    [self configChildVC];
    
    //添加底部是图
    [self configFootView];
    //状态栏
    _statusBarView = [[UIView alloc] initWithFrame:WDH_CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    _statusBarView.backgroundColor=[UIColor colorWithRed:33/255.0 green:35/255.0 blue:33/255.0 alpha:0];
    [self.navigationController.navigationBar addSubview:_statusBarView];
    
    
}
-(void)configChildVC{
    //添加子视图
    for (int i = 0; i < _sortArr.count; i ++) {
        LYTSortChildVC *vc = [[LYTSortChildVC alloc]init];
        [vc.view setFrame:WDH_CGRectMake(TableWidth, HeaderViewHight, 375 - TableWidth, ChildVCHight_Foot)];
        [self addChildViewController:vc];
        
        //上下滑动画
        vc.tableOffset = ^(double offset){
//            NSLog(@"tableOffset---%.2f",offset);
            //判断上划还是下划
            if (offset > 0) {
                isUp = NO;
            }
            if (offset < 0) {
                isUp = YES;
            }
            if (isUp == YES) {
                [UIView animateWithDuration:0.5 animations:^{
                    [vc.view setFrame:WDH_CGRectMake(TableWidth, HeaderViewHight, 375 - TableWidth, ChildVCHight_Foot)];
                    _LYTSortTable.frame = WDH_CGRectMake(0, HeaderViewHight, TableWidth, 667 - HeaderViewHight);
                    [self.navigationController.navigationBar setValue:@(0)forKeyPath:@"backgroundView.alpha"];
                    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
                    _statusBarView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:self.LYTSortTable.contentOffset.y/(105+64)];
                } completion:^(BOOL finished) {
                    
                }];
            }else{
                [UIView animateWithDuration:0.5 animations:^{
                    [vc.view setFrame:WDH_CGRectMake(TableWidth, 64, 375 - TableWidth, ChildVCHight_Top)];
                    _LYTSortTable.frame = WDH_CGRectMake(0, 64, TableWidth, 667 -64);
                    [self.navigationController.navigationBar setValue:@(1)forKeyPath:@"backgroundView.alpha"];
                    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
                    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
                } completion:^(BOOL finished) {
                    
                }];
                
            }
            
            //回弹后判断上走还是下走
            if (offset == 0) {
                if (isUp == YES) {
                    [UIView animateWithDuration:0.5 animations:^{
                        [vc.view setFrame:WDH_CGRectMake(TableWidth, HeaderViewHight, 375 - TableWidth, ChildVCHight_Foot)];
                        _LYTSortTable.frame = WDH_CGRectMake(0, HeaderViewHight, TableWidth, 667 - HeaderViewHight);
                        [self.navigationController.navigationBar setValue:@(0)forKeyPath:@"backgroundView.alpha"];
                        self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
                        _statusBarView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:self.LYTSortTable.contentOffset.y/(105+64)];
                    } completion:^(BOOL finished) {
                        
                    }];
                }else{
                    [UIView animateWithDuration:0.5 animations:^{
                        [vc.view setFrame:WDH_CGRectMake(TableWidth, 64, 375 - TableWidth, ChildVCHight_Top)];
                        _LYTSortTable.frame = WDH_CGRectMake(0, 64, TableWidth, 667 -64);
                        [self.navigationController.navigationBar setValue:@(1)forKeyPath:@"backgroundView.alpha"];
                        self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
                        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
                    } completion:^(BOOL finished) {
                        
                    }];
                    
                }
            }
        };
        
        //加入购物车动画
        vc.addBtnClick = ^(CGRect rect,UIButton *sender){
            
            if (isUp == YES){
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = WDH_CGRectMake(TableWidth + rect.origin.x, HeaderViewHight + rect.origin.y, 30, 30);
                btn.backgroundColor = [UIColor redColor];
                [self.view addSubview:btn];
                [self.BtnArr addObject:btn];
                //                [sender sendSubviewToBack:btn];
                [UIView animateWithDuration:1 animations:^{
                    [LYTPrivatelyToors animationWithView:btn startCenter:CGPointMake(TableWidth + rect.origin.x + 15, HeaderViewHight + rect.origin.y + 15) finishCenter:CGPointMake(40, 617)];
                } completion:^(BOOL finished) {
                    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0f];
                }];
                
            }else{
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = WDH_CGRectMake(TableWidth + rect.origin.x, 64 + rect.origin.y, 30, 30);
                btn.backgroundColor = [UIColor redColor];
                [self.view addSubview:btn];
                [self.BtnArr addObject:btn];
                //                [sender sendSubviewToBack:btn];
                [UIView animateWithDuration:1 animations:^{
                    [LYTPrivatelyToors animationWithView:btn startCenter:CGPointMake(TableWidth + rect.origin.x + 15, 64 + rect.origin.y + 15) finishCenter:CGPointMake(40, 617)];
                } completion:^(BOOL finished) {
                    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0f];
                }];
                
            }
            
        };
        
        vc.index = i;
        if (i == 0) {
            _currentVC = vc;
            [self.view addSubview:vc.view];
        }
        
    }
}
-(void)delayMethod{
    for (UIView *view in self.BtnArr) {
        [view removeFromSuperview];
    }
}
-(void)configHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 0, 375, HeaderViewHight)];
    headerView.backgroundColor = [UIColor redColor];
    [self.view sendSubviewToBack:headerView];
    [self.view addSubview:headerView];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(30, 40, 60, 60)];
    headImg.backgroundColor = [UIColor whiteColor];
    headImg.layer.cornerRadius = 30;
    headImg.layer.masksToBounds = YES;
    [headerView addSubview:headImg];
    
    
    UILabel *shopNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 40, 245, 30)];
    shopNameLabel.font = [UIFont systemFontOfSize:20];
    shopNameLabel.text = @"尚集镇小面之缘";
    [headerView addSubview:shopNameLabel];
    
    UILabel *shopContentLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 245, 30)];
    shopContentLabel.font = [UIFont systemFontOfSize:16];
    shopContentLabel.text = @"尚集镇小面之缘";
    [headerView addSubview:shopContentLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110, 375, 1)];
    lineLabel.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:lineLabel];
    
    UILabel *adLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 120, 255, 20)];
    adLabel.font = [UIFont systemFontOfSize:14];
    adLabel.text = @"sasasdasd奥术大师大所奥术大师";
    [headerView addSubview:adLabel];
    
}
-(void)configFootView{
    UIView *footView = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 667 - FooterViewHight, 375, FooterViewHight)];
    footView.backgroundColor = [UIColor redColor];
    [self.view bringSubviewToFront:footView];
    [self.view addSubview:footView];
    
    //购物车按钮
    UIButton *shopCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopCartBtn.frame = WDH_CGRectMake(20, -20, 40,  40);
    shopCartBtn.backgroundColor = [UIColor greenColor];
    shopCartBtn.layer.cornerRadius = 20;
    shopCartBtn.layer.masksToBounds = YES;
    [footView addSubview:shopCartBtn];
    [shopCartBtn addTarget:self action:@selector(shopCartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //金额
    UILabel *moneyLabel = [[UILabel alloc]initWithFrame:WDH_CGRectMake(60, 10, 200, 30)];
    moneyLabel.text = @"¥ 98.00";
    moneyLabel.font = [UIFont systemFontOfSize:25];
    [footView addSubview:moneyLabel];
    
    
    //结算
    UIButton *settlementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settlementBtn.frame = WDH_CGRectMake(275, 0, 100,  50);
    settlementBtn.backgroundColor = [UIColor greenColor];
    [footView addSubview:settlementBtn];
    [settlementBtn addTarget:self action:@selector(settlementBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TableCellHight;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _sortArr.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYTSortTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.label.text = _sortArr[indexPath.row];
    if (indexPath.row == 0) {
        cell.selected = YES;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LYTSortChildVC *vc = self.childViewControllers[indexPath.row];
    if (isUp == YES) {
        [vc.view setFrame:WDH_CGRectMake(TableWidth, HeaderViewHight, 375 - TableWidth, ChildVCHight_Foot)];
    }else{
        [vc.view setFrame:WDH_CGRectMake(TableWidth, 64, 375 - TableWidth, ChildVCHight_Top)];
    }
    switch (indexPath.row) {
        case 0:
            [self replaceController:self.currentVC newController:vc];
            break;
        case 1:
            [self replaceController:self.currentVC newController:vc];
            break;
        case 2:
            [self replaceController:self.currentVC newController:vc];
            break;
        case 3:
            [self replaceController:self.currentVC newController:vc];
            break;
        case 4:
            [self replaceController:self.currentVC newController:vc];
            break;
            
        default:
            break;
    }
}
//加入购物车
-(void)shopCartBtnClick:(UIButton *)sender{
    NSLog(@"shopCartBtnClick");
}
//结算
-(void)settlementBtnBtnClick:(UIButton *)sender{
    NSLog(@"settlementBtnBtnClick");
}

#pragma mark - 切换viewController
//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
{
    /**
     *            着重介绍一下它
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    
//    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
//            [oldController removeFromParentViewController];
            self.currentVC = newController;
            
        }else{
            
            self.currentVC = oldController;
            
        }
    }];
}




@end
