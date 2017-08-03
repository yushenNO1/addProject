//
//  LYTGoodsDetailVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/31.
//  Copyright © 2017年 神廷. All rights reserved.
//

#define FooterHight                 50              //tableView尾部高度
#define ScrollContentOffSet         30              //Scroll偏移量的比率




#import "LYTGoodsDetailVC.h"
#import "LYTGoodsDetailCell.h"

static NSString *DefaultCell        = @"DefaultCell";
static NSString *GoodsDetailCell    = @"LYTGoodsDetailCell";

@interface LYTGoodsDetailVC ()<UITableViewDelegate,UITableViewDataSource,LYTBackViewDelegate>
@property(nonatomic,retain)UIView           *statusBarView;     //隐藏导航条和状态栏
@property(nonatomic,retain)UIView           *navigationView;    //隐藏导航条
@property(nonatomic,retain)UILabel          *navigationLabel;   //隐藏导航条标题
@property(nonatomic,retain)UIButton         *backBtn;           //返回按钮
@property(nonatomic,retain)UIView           *popView;           //弹出视图
@property(nonatomic,retain)UITableView *LYTGoodsDetailTable;


@end

@implementation LYTGoodsDetailVC

-(UITableView *)LYTGoodsDetailTable{
    if (!_LYTGoodsDetailTable) {
        _LYTGoodsDetailTable = [[UITableView alloc]initWithFrame:WDH_CGRectMake(0, 0, kScreenWidth, kScreenHeight ) style:UITableViewStylePlain];
        _LYTGoodsDetailTable.delegate = self;
        _LYTGoodsDetailTable.dataSource = self;
        [_LYTGoodsDetailTable registerClass:[UITableViewCell class] forCellReuseIdentifier:DefaultCell];
        [_LYTGoodsDetailTable registerClass:[LYTGoodsDetailCell class] forCellReuseIdentifier:GoodsDetailCell];
    }
    return _LYTGoodsDetailTable;
}

- (UIView *)popView {
    if (!_popView) {
        _popView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight/2.0f)];
        _popView.backgroundColor = [UIColor colorWithRed:1.000 green:0.988 blue:0.960 alpha:1.000];
    }
    return _popView;
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
    _navigationView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0];
    _navigationLabel.alpha = 0;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setValue:@(1)forKeyPath:@"backgroundView.alpha"];
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [_statusBarView removeFromSuperview];
    [_navigationView removeFromSuperview];
    [_navigationLabel removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.LYTGoodsDetailTable];
    
    //自定义Nav
    [self customNavigation];
    //添加头部视图
    [self configHeaderView];
    //添加尾部视图
    [self configFooterView];
    //添加隐藏的Scroll
    [self configHiddenScroll];
    //添加尾部购买按钮
    [self configFooter];
    
    
    LYTBackView *backView = [LYTBackView shareSingle];
    backView.delegate = self;
    
}
-(void)customNavigation{
    
    self.navigationItem.hidesBackButton = YES;
    
    //状态栏
    _statusBarView = [[UIView alloc] initWithFrame:WDH_CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    _statusBarView.backgroundColor=[UIColor colorWithRed:33/255.0 green:35/255.0 blue:33/255.0 alpha:0];
    [self.navigationController.navigationBar addSubview:_statusBarView];
    
    //导航栏
    _navigationView = [[UIView alloc] initWithFrame:WDH_CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    _navigationView.backgroundColor=[UIColor colorWithRed:33/255.0 green:35/255.0 blue:33/255.0 alpha:0];
    [self.navigationController.navigationBar addSubview:_navigationView];
    
    //标题
    _navigationLabel = [[UILabel alloc]initWithFrame:WDH_CGRectMake(100, 12, 175, 20)];
    _navigationLabel.text = @"商品详情";
    _navigationLabel.textAlignment = NSTextAlignmentCenter;
    [_navigationView addSubview: _navigationLabel];
    
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = WDH_CGRectMake(15, 7, 30, 30);
    [_backBtn setTitle:@"<" forState:UIControlStateNormal];
    _backBtn.backgroundColor = [UIColor grayColor];
    [_backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _backBtn.layer.cornerRadius = 15;
    _backBtn.layer.masksToBounds = YES;
    [_navigationView addSubview:_backBtn];
}
//头部视图
-(void)configHeaderView{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:WDH_CGRectMake(0, 0, kScreenWidth, kScreenWidth)];
    scroll.contentSize = CGSizeMake(kScreenWidth * 3, kScreenWidth);
    scroll.pagingEnabled = YES;
    scroll.backgroundColor = [UIColor redColor];
    for (int i = 0; i < 3; i ++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:WDH_CGRectMake(375 * i, 0, 375, 375)];
        [img sd_setImageWithURL:[NSURL URLWithString:@"http://img002.21cnimg.com/photos/album/20150702/m600/2D79154370E073A2BA3CD4D07868861D.jpeg"]];
        [scroll addSubview:img];
    }
    
    self.LYTGoodsDetailTable.tableHeaderView = scroll;
}
//尾部视图
-(void)configFooterView{
    UIView *footerView = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 0, kScreenWidth, FooterHight)];
    footerView.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc]initWithFrame:footerView.frame];
    label.text = @"上拉查看商品详情";
    label.textAlignment = NSTextAlignmentCenter;
    [footerView addSubview:label];
    self.LYTGoodsDetailTable.tableFooterView = footerView;
}
//加载更多时切换Scroll
-(void)configHiddenScroll{
    UIScrollView *hiddenScroll = [[UIScrollView alloc]initWithFrame:WDH_CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight - 50)];
    hiddenScroll.backgroundColor = [UIColor redColor];
    hiddenScroll.tag = 8888;
    hiddenScroll.delegate = self;
    UILabel *label = [[UILabel alloc]initWithFrame:WDH_CGRectMake(0, 0 , kScreenWidth, 64)];
    label.text = @"下拉返回商品";
    label.textAlignment = NSTextAlignmentCenter;
    [hiddenScroll addSubview:label];
    hiddenScroll.contentSize = CGSizeMake(kScreenWidth, kScreenHeight*2);
    [self.view addSubview:hiddenScroll];
}

//底部确定按钮
-(void)configFooter{
    UIView *footerView = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 667 - FooterHight, kScreenWidth, FooterHight)];
    footerView.backgroundColor = [UIColor greenColor];
    
    
    UIButton *shopsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopsBtn.frame = WDH_CGRectMake(0, 0, 80, FooterHight) ;
    shopsBtn.backgroundColor = [UIColor whiteColor];
    [shopsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shopsBtn setTitle:@"商铺" forState:UIControlStateNormal];
    [shopsBtn addTarget:self action:@selector(addCartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    shopsBtn.tag = 0;
    [footerView addSubview:shopsBtn];
    
    UIButton *addCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addCartBtn.frame = WDH_CGRectMake(80, 0, 120, FooterHight) ;
    addCartBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:149/255.0 blue:169/255.0 alpha:1];
    [addCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addCartBtn addTarget:self action:@selector(addCartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    addCartBtn.tag = 1;
    [footerView addSubview:addCartBtn];
    
    UIButton *buyCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyCartBtn.frame = WDH_CGRectMake(200, 0, 175, FooterHight) ;
    buyCartBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:81/255.0 blue:113/255.0 alpha:1];
    [buyCartBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    buyCartBtn.tag = 2;
    [buyCartBtn addTarget:self action:@selector(addCartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:buyCartBtn];
    
    
    [self.view addSubview:footerView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll--%f",scrollView.contentOffset.y);
    if (scrollView == self.LYTGoodsDetailTable) {
        _statusBarView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:scrollView.contentOffset.y/(ScrollContentOffSet)];
        _navigationView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:scrollView.contentOffset.y/(ScrollContentOffSet)];
        _navigationLabel.alpha = scrollView.contentOffset.y/(ScrollContentOffSet);
        
        
        CGFloat colorF_up = scrollView.contentOffset.y * 3 + 153 - ScrollContentOffSet ;
        CGFloat colorF_down = 255 - scrollView.contentOffset.y * 3 ;
        _backBtn.backgroundColor = [UIColor colorWithRed:colorF_up/255.0 green:colorF_up/255.0 blue:colorF_up/255.0 alpha:1];
        [_backBtn setTitleColor:[UIColor colorWithRed:colorF_down/255.0 green:colorF_down/255.0 blue:colorF_down/255.0 alpha:1] forState:UIControlStateNormal];
//        NSLog(@"----tableView的内容高度------%@",NSStringFromCGSize(_LYTGoodsDetailTable.contentSize) );
    } else {
        
    }
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"----scrollViewWillBeginDecelerating------%f",scrollView.contentOffset.y   );
    if (scrollView.contentOffset.y + _LYTGoodsDetailTable.frame.size.height - scrollView.contentSize.height   > 50.f){
        //滑到底部加载更多
        NSLog(@"滑到底部加载图片");
        UIScrollView *scroll = [self.view viewWithTag:8888];
        if (scrollView == _LYTGoodsDetailTable) {
            [UIView animateWithDuration:1 animations:^{
                scrollView.frame = WDH_CGRectMake(0, -kScreenHeight, kScreenWidth, kScreenHeight);
                scroll.frame = WDH_CGRectMake(0, 0, kScreenWidth, kScreenHeight - 50 ) ;
            }];
        }
    }
    
    if (scrollView.contentOffset.y <= -64) {
        //滑到顶部更新
        NSLog(@"滑到顶部更新");
        if (scrollView.tag == 8888){
            [UIView animateWithDuration:1 animations:^{
                _LYTGoodsDetailTable.frame = WDH_CGRectMake(0, 0, kScreenWidth, kScreenHeight);
                scrollView.frame = WDH_CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight - 50 - 64) ;
            }];
        }
    }
}
#pragma mark -------tableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 110;
    }else{
        return 44;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LYTGoodsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:GoodsDetailCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

-(void)addCartBtnClick:(UIButton *)sender{
//    NSLog(@"addCartBtnClick");
    if (sender.tag == 0) {
        NSLog(@"商铺");
    }else if (sender.tag == 1) {
        NSLog(@"加入购物车");
    }else{
        NSLog(@"立即购买");
    }
}
-(void)backBtnClick:(UIButton *)sender{
    NSLog(@"backBtnClick");
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        //点击选择商品属性
        [self open];
    }else{
//        [self close];
    }
}

#pragma mark      ------------弹出视图------------
-(void)open{
    [UIView animateWithDuration:0.2 animations:^{
        self.view.layer.transform = [self firstStepTransform];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.layer.transform = [self secondStepTransform];
            [LYTBackView showWithView:self.popView];
            self.popView.transform = CGAffineTransformTranslate(self.popView.transform, 0, -kScreenHeight / 2.0f);
            
        }];
    }];
}
-(void)close{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.layer.transform = [self firstStepTransform];
        self.popView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            self.popView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight/2.0f);
        }];
    }];
}
// 动画1
- (CATransform3D)firstStepTransform {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -500.0;
    transform = CATransform3DScale(transform, 0.98, 0.98, 1.0);
    transform = CATransform3DRotate(transform, 5.0 * M_PI / 180.0, 1, 0, 0);
    transform = CATransform3DTranslate(transform, 0, 0, -30.0);
    return transform;
}


// 动画2
- (CATransform3D)secondStepTransform {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = [self firstStepTransform].m34;
    transform = CATransform3DTranslate(transform, 0, kScreenHeight * -0.08, 0);
    transform = CATransform3DScale(transform, 0.8, 0.8, 1.0);
    return transform;
}

-(void)touchBackView{
    NSLog(@"zoubuzou ");
    [self close];
}

@end
