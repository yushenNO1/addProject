//
//  LYTGoodsDetailVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/31.
//  Copyright © 2017年 神廷. All rights reserved.
//

#define FooterHight                 50                              //tableView尾部高度
#define ScrollContentOffSet         10                              //Scroll偏移量的比率
#define SpecScrollHight             kScreenHeight/2.0f - 100         //规格上ScrollView高度



#import "LYTGoodsDetailVC.h"
#import "LYTGoodsDetailCell.h"
#import "LYTSudokuView.h"                           //规格


static NSString *DefaultCell        = @"DefaultCell";
static NSString *GoodsDetailCell    = @"LYTGoodsDetailCell";

@interface LYTGoodsDetailVC ()<UITableViewDelegate,UITableViewDataSource,LYTBackViewDelegate,LYTSudokuDelegate>
{
    UIButton * jianBtn;
    UILabel * countLabel;
}
@property(nonatomic,retain)UIView               *statusBarView;     //隐藏导航条和状态栏
@property(nonatomic,retain)UIView               *navigationView;    //隐藏导航条
@property(nonatomic,retain)UILabel              *navigationLabel;   //隐藏导航条标题
@property(nonatomic,retain)UIButton             *backBtn;           //返回按钮
@property(nonatomic,retain)UIView               *popView;           //弹出视图
@property(nonatomic,retain)UITableView          *LYTGoodsDetailTable;

@property(nonatomic,retain)NSMutableDictionary  *selectSpecTypeDic; //选择规格属性-外部显示
@property(nonatomic,retain)NSMutableArray       *defaultSelectArr; //选择规格属性-重新出现时默认选择
@end

@implementation LYTGoodsDetailVC
-(NSMutableArray *)defaultSelectArr{
    if (!_defaultSelectArr) {
        _defaultSelectArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _defaultSelectArr;
}
-(NSMutableDictionary *)selectSpecTypeDic{
    if (!_selectSpecTypeDic) {
        _selectSpecTypeDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return _selectSpecTypeDic;
}
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
        _popView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth,  SpecScrollHight + 200)];
        _popView.backgroundColor = [UIColor colorWithRed:1.000 green:0.988 blue:0.960 alpha:1.000];
        UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
        [window addSubview:_popView];
        
        UIImageView *headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, -10, 60, 60)];
        headerImg.layer.cornerRadius = 5;
        headerImg.layer.masksToBounds = YES;
        headerImg.backgroundColor = [UIColor redColor];
        [_popView addSubview:headerImg];
        
        
        
        
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0 , 60, kScreenWidth,  SpecScrollHight + 100)];
        [_popView addSubview:scroll];
        
        NSArray * btnTitleArr = @[@"asdasdas",@"奥术大师",@"按时",@"打算额",@"按时若翁群请问",@"恶趣味奥所多",@"我去玩才多少",@"七位数多",@"请问",@"其实规范"];
        NSArray * btnIdArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
        __block float frameY = 0;
        
        for (int i = 0; i < 2; i ++ ) {
            LYTSudokuView *sudokuView = [[LYTSudokuView alloc]initWithFrame:CGRectMake(0, frameY, kScreenWidth, SpecScrollHight)];
            //        sudokuView.selectType = LYTSudokuBtnSelectMultiple;
            [sudokuView configViewWithDataArr:btnTitleArr DataIdArr:btnIdArr selectIndex:[self.defaultSelectArr[i] integerValue]];
            sudokuView.selectIndex = i;
            sudokuView.delegate = self;
            NSLog(@"sudokuView.viewHight----%ld",sudokuView.viewHight);
            sudokuView.frame = CGRectMake(0, frameY, kScreenWidth, sudokuView.viewHight);
            frameY = frameY + sudokuView.viewHight;

            [scroll addSubview:sudokuView];
        }
        scroll.contentSize = CGSizeMake(kScreenWidth, frameY + 10 + 40);
        
        UILabel *countTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, frameY + 10, 80, 20)];
        countTitleLabel.text = @"购买数量";
        countTitleLabel.font = [UIFont systemFontOfSize:14];
        [scroll addSubview:countTitleLabel];
        
        // 加减+中间label
        jianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        jianBtn.frame = WDH_CGRectMake(270, frameY + 5, 30, 30);
        jianBtn.layer.cornerRadius = 15;
        jianBtn.layer.masksToBounds = YES;
        jianBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [jianBtn setTitle:@"-" forState:UIControlStateNormal];
        [scroll addSubview:jianBtn];
        jianBtn.tag = 1094;
        [jianBtn addTarget:self action:@selector(jiaJianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        countLabel = [[UILabel alloc]initWithFrame:WDH_CGRectMake(300, frameY + 5, 35, 30)];
        countLabel.text = @"2";
        countLabel.font = [UIFont systemFontOfSize:18];
        countLabel.textAlignment = NSTextAlignmentCenter;
        [scroll addSubview:countLabel];
        
        //判断减号颜色
        if ([countLabel.text intValue] > 1) {
            jianBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
        }else{
            jianBtn.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1];
        }
        
        
        
        
        UIButton *jiaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        jiaBtn.frame = WDH_CGRectMake(335, frameY + 5, 30, 30);
        jiaBtn.layer.cornerRadius = 15;
        jiaBtn.layer.masksToBounds = YES;
        jiaBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        jiaBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
        [jiaBtn setTitle:@"+" forState:UIControlStateNormal];
        [scroll addSubview:jiaBtn];
        jiaBtn.tag = 2;
        [jiaBtn addTarget:self action:@selector(jiaJianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, SpecScrollHight + 160, kScreenWidth, 40);
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:253/255.0  green:70/255.0  blue:103/255.0 alpha:1];
    btn.tag = 1;
    [btn addTarget:self action:@selector(popViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_popView addSubview:btn];
    
    
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
    
    
    self.defaultSelectArr = [NSMutableArray arrayWithArray:@[@"1",@"5",@"2"]];
    
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
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:WDH_CGRectMake(0, 0, 375, 475)];
    scroll.contentSize = CGSizeMake(kScreenWidth * 3, kScreenWidth);
    scroll.pagingEnabled = YES;
    scroll.backgroundColor = [UIColor redColor];
    for (int i = 0; i < 3; i ++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:WDH_CGRectMake(375 * i, 0, 375, 475)];
        [img sd_setImageWithURL:[NSURL URLWithString:@"http://img002.21cnimg.com/photos/album/20150702/m600/2D79154370E073A2BA3CD4D07868861D.jpeg"]];
        [scroll addSubview:img];
    }
    
    self.LYTGoodsDetailTable.tableHeaderView = scroll;
}
//尾部视图
-(void)configFooterView{
    UIView *footerView = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 0, 375, FooterHight)];
    footerView.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc]initWithFrame:footerView.frame];
    label.text = @"上拉查看商品详情";
    label.textAlignment = NSTextAlignmentCenter;
    [footerView addSubview:label];
    self.LYTGoodsDetailTable.tableFooterView = footerView;
}
//加载更多时切换Scroll
-(void)configHiddenScroll{
    UIScrollView *hiddenScroll = [[UIScrollView alloc]initWithFrame:WDH_CGRectMake(0, 667, 375, 667 - 50)];
    hiddenScroll.backgroundColor = [UIColor redColor];
    hiddenScroll.tag = 8888;
    hiddenScroll.delegate = self;
    UILabel *label = [[UILabel alloc]initWithFrame:WDH_CGRectMake(0, 0 , 375, 64)];
    label.text = @"下拉返回商品";
    label.textAlignment = NSTextAlignmentCenter;
    [hiddenScroll addSubview:label];
    hiddenScroll.contentSize = CGSizeMake(kScreenWidth, kScreenHeight*2);
    [self.view addSubview:hiddenScroll];
}

//底部确定按钮
-(void)configFooter{
    UIView *footerView = [[UIView alloc]initWithFrame:WDH_CGRectMake(0, 667 - FooterHight, 375, FooterHight)];
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
    NSLog(@"scrollViewDidScroll--%f",scrollView.contentOffset.y);
    if (scrollView == self.LYTGoodsDetailTable) {
        _statusBarView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:scrollView.contentOffset.y/(ScrollContentOffSet)];
        _navigationView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:scrollView.contentOffset.y/(ScrollContentOffSet)];
        _navigationLabel.alpha = scrollView.contentOffset.y/(ScrollContentOffSet);
        
        
        CGFloat colorF_up = scrollView.contentOffset.y * 10 + 153 - ScrollContentOffSet ;
        CGFloat colorF_down = 255 - scrollView.contentOffset.y * 10 ;
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
                scrollView.frame = WDH_CGRectMake(0, -667, 375, 667);
                scroll.frame = WDH_CGRectMake(0, 0, 375, 667 - 50 ) ;
            }];
        }
    }
    
    if (scrollView.contentOffset.y <= -64) {
        //滑到顶部更新
        NSLog(@"滑到顶部更新");
        if (scrollView.tag == 8888){
            [UIView animateWithDuration:1 animations:^{
                _LYTGoodsDetailTable.frame = WDH_CGRectMake(0, 0, 375, 667);
                scrollView.frame = WDH_CGRectMake(0, 667, 375, 667 - 50 - 64) ;
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
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LYTGoodsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:GoodsDetailCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultCell];
        cell.textLabel.text = @"请选择商品属性";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor grayColor];
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
        
    }
}

#pragma mark      ------------弹出视图------------
-(void)open{
    [UIView animateWithDuration:0.2 animations:^{
        self.view.layer.transform = [self firstStepTransform];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.layer.transform = [self secondStepTransform];
            [LYTBackView showWithView:[UIView new]];
            self.popView.frame = CGRectMake(0, SpecScrollHight, kScreenWidth, SpecScrollHight + 200);
//            self.popView.transform = CGAffineTransformTranslate(self.popView.transform, 0, -kScreenHeight / 2.0f);
            
        }];
    }];
}
-(void)close{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.layer.transform = [self firstStepTransform];
        self.popView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, SpecScrollHight  + 200 );
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            [self.popView removeFromSuperview];
            self.popView = nil;
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
//规格上规格按钮点击
-(void)clickBtnIndex:(NSInteger)index WithBtnInfo:(NSString *)info changeView:(LYTSudokuView *)sudokuView{
    NSLog(@"clickBtnIndex----%ld   WithBtnInfo----%@   changeView----%ld",index,info,sudokuView.selectId);
    [self.defaultSelectArr replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%ld",sudokuView.selectId]];
    NSArray *routeArr = @[@"1-5-3",
                          @"1-5-4",
                          @"1-5-5",
                          @"1-3-3",
                          @"1-2-3",
                          @"1-1-3",
                          @"1-3-6"];
    NSString *key = [NSString stringWithFormat:@"%ld",index];
    [self.selectSpecTypeDic setObject:info forKey:key];
    
}
//规格上加减按钮点击
-(void)jiaJianBtnClick:(UIButton *)sender{
    NSLog(@"jiaJianBtnClick----%ld",sender.tag);
    
    int count = [countLabel.text intValue];
    if (sender.tag == 1094) {
        count --;
        //处理减号事件
        if (count >= 2) {
            jianBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
        }else{
            jianBtn.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1];
            count = 1;
        }
    }else{
        jianBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
        count ++;
        //处理加号事件
    }
    countLabel.text = [NSString stringWithFormat:@"%d",count];
}
//规格上确定按钮点击
-(void)popViewBtnClick:(UIButton *)sender{
    NSLog(@"popViewBtnClick");
    [LYTBackView dissMiss];
    [self close];
    NSLog(@"self.selectSpecTypeDic-----%@",self.selectSpecTypeDic);
    NSIndexPath *index1 =  [NSIndexPath indexPathForItem:sender.tag inSection:0];
    UITableViewCell *cell =  [_LYTGoodsDetailTable cellForRowAtIndexPath:index1];
    cell.textLabel.textColor = [UIColor redColor];
    
    NSString *specStr = @"";
    for (int i = 0; i < self.selectSpecTypeDic.count; i ++ ) {
        NSString *key = [NSString stringWithFormat:@"%d",i];
        if (i <= 0) {
            specStr = [NSString stringWithFormat:@"规格:%@",self.selectSpecTypeDic[key]];
//            return;
        }else{
            specStr = [NSString stringWithFormat:@"%@-%@",specStr,self.selectSpecTypeDic[key]];
//            return;
        }
    }
    
    cell.textLabel.text = specStr;
}

@end
