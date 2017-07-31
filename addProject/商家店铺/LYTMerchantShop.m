//
//  LYTMerchantShop.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTMerchantShop.h"
#import "LYTMerchantShopCell1.h"        //第一行商家信息cell
#import "LYTMerchantShopCell2.h"        //商家商品


#import "LYTBackView.h"

@interface LYTMerchantShop ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UILabel *countLabel;
    UILabel *hejiLabel;
    UIButton *jianBtn;
}
@end

@implementation LYTMerchantShop
static NSString * const MerchantShopCell1 = @"LYTMerchantShopCell1";
static NSString * const MerchantShopCell2 = @"LYTMerchantShopCell2";
static NSString * const reuseIdentifier = @"Cell";
-(id)init{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    if (self=[super initWithCollectionViewLayout:layout]) {
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc] init];
    [self.collectionView setCollectionViewLayout:Layout];
    self.collectionView.delegate =self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[LYTMerchantShopCell1 class] forCellWithReuseIdentifier:MerchantShopCell1];
    [self.collectionView registerClass:[LYTMerchantShopCell2 class] forCellWithReuseIdentifier:MerchantShopCell2];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else{
        return 4;
    }
    
}

//每个item的规格
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return CGSizeMake(375 , 150 );
        }else if (indexPath.row == 1){
            return CGSizeMake(375 , 150 );
        }else{
            return CGSizeMake(375 , 70);
        }
    } else  {
        return CGSizeMake(180 , 260 );
    }
}

//每个item横向之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        return 9.0f ;
    } else if (section == 1) {
        return 5.0f ;
    } else {
        return 0.0f;
    }
}
//每个item纵向之间的间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return 0.0f ;
    } else if (section == 1) {
        return 5.0f;
    } else {
        return 9.0f ;
    }
}
//设置边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0) ;
    } else if (section == 1) {
        return UIEdgeInsetsMake(5, 5, 5, 5) ;
    } else {
        return UIEdgeInsetsMake(5, 5, 5, 5) ;
    }
}
////头尾
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return CGSizeMake(375 , 0 );;
//    } else  {
//        return CGSizeMake(375 , 10);
//    }
//}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LYTMerchantShopCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MerchantShopCell1 forIndexPath:indexPath];
            cell.backgroundColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:234 / 255.0 alpha:1];
            return cell;
        }else if (indexPath.row == 1){
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 355, 130)];
            view.backgroundColor = [UIColor redColor];
            [cell addSubview:view];
            cell.backgroundColor = [UIColor whiteColor];
        }else{
            cell.backgroundColor = [UIColor blueColor];
        }
    }else{
        LYTMerchantShopCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MerchantShopCell2 forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:234 / 255.0 alpha:1];
        cell.buyBtn.tag = indexPath.row ;

        [cell.buyBtn addTarget:self action:@selector(CellBuyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
    return cell;
}

-(void)CellBuyBtnClick:(UIButton *)sender{
    NSLog(@"CellBuyBtnClick---%ld",sender.tag);
    [self tanchuView];
    
//    if (i % 2 == 0) {
//        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(100 , 100, 100, 200)];
//        img.backgroundColor = [UIColor redColor];
//        [LYTBackView showWithView:img];
//    }else{
//        [LYTBackView dissMiss];
//    }
//    i ++;
}
-(void)tanchuView{
    UIView *tanchuView = [[UIView alloc]initWithFrame:CGRectMake(20, 70, 335, 480)];
    tanchuView.backgroundColor = [UIColor whiteColor];
    tanchuView.layer.cornerRadius = 10;
    tanchuView.layer.masksToBounds = YES;
    [LYTBackView showWithView:tanchuView];
    
    
    //图片
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(30, 15, 275, 275)];
    img.backgroundColor = [UIColor redColor];
    [tanchuView addSubview:img];
    
    //标题
    UILabel *titleLabel= [[UILabel alloc]initWithFrame:CGRectMake(30, 290, 275, 25)];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.text = @"衣服标题--奥术大师多";
    [tanchuView addSubview:titleLabel];
    
    //内容
    UILabel *contentLabel= [[UILabel alloc]initWithFrame:CGRectMake(30, 315, 275, 20)];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = [UIColor colorWithRed:188/255.0 green:190/255.0 blue:195/255.0 alpha:1];
    contentLabel.text = @"2017衣服标题";
    [tanchuView addSubview:contentLabel];
    
    //金额
    UILabel *moneyLabel= [[UILabel alloc]initWithFrame:CGRectMake(30, 335, 275, 25)];
    moneyLabel.text = @"¥ 98";
    moneyLabel.textColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
    moneyLabel.font = [UIFont systemFontOfSize:18];
    [tanchuView addSubview:moneyLabel];
    
    // 加减+中间label
    jianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jianBtn.frame = CGRectMake(120, 360, 30, 30);
    jianBtn.layer.cornerRadius = 15;
    jianBtn.layer.masksToBounds = YES;
    jianBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [jianBtn setTitle:@"-" forState:UIControlStateNormal];
    [tanchuView addSubview:jianBtn];
    jianBtn.tag = 1094;
    [jianBtn addTarget:self action:@selector(jiaJianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    countLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 360, 35, 30)];
    countLabel.text = @"2";
    countLabel.font = [UIFont systemFontOfSize:18];
    countLabel.textAlignment = NSTextAlignmentCenter;
    [tanchuView addSubview:countLabel];
    
    //判断减号颜色
    if ([countLabel.text intValue] > 1) {
        jianBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
    }else{
        jianBtn.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1];
    }
    
    
    
    
    UIButton *jiaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jiaBtn.frame = CGRectMake(185, 360, 30, 30);
    jiaBtn.layer.cornerRadius = 15;
    jiaBtn.layer.masksToBounds = YES;
    jiaBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    jiaBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
    [jiaBtn setTitle:@"+" forState:UIControlStateNormal];
    [tanchuView addSubview:jiaBtn];
    jiaBtn.tag = 2;
    [jiaBtn addTarget:self action:@selector(jiaJianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //合计
    UILabel *hejiTitle = [[UILabel alloc]initWithFrame:CGRectMake(120, 400, 20, 25)];
    hejiTitle.text = @"共:";
    hejiTitle.textColor = [UIColor colorWithRed:197/255.0 green:198/255.0 blue:203/255.0 alpha:1];
    hejiTitle.font = [UIFont systemFontOfSize:12];
    hejiTitle.textAlignment = NSTextAlignmentCenter;
    [tanchuView addSubview:hejiTitle];
    
    hejiLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 400, 80, 25)];
    hejiLabel.text = @"¥999";
    hejiLabel.textColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
    hejiLabel.font = [UIFont systemFontOfSize:18];
    hejiLabel.textAlignment = NSTextAlignmentCenter;
    [tanchuView addSubview:hejiLabel];
    
    
    UIButton *OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    OKBtn.frame = CGRectMake(120, 440, 95, 30);
    OKBtn.layer.cornerRadius = 15;
    OKBtn.layer.masksToBounds = YES;
    OKBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:89/255.0 blue:119/255.0 alpha:1];
    OKBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [OKBtn setTitle:@"确定" forState:UIControlStateNormal];
    [tanchuView addSubview:OKBtn];
    [OKBtn addTarget:self action:@selector(tanChuOKBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)jiaJianBtnClick:(UIButton *)sender{
    NSLog(@"jiaJianBtnClick----%ld",sender.tag);
    
    int count = [countLabel.text intValue];
    double heji = [hejiLabel.text doubleValue];
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
    //修改单价
    heji = 98 * count;
//    NSLog(@"合计---%@----数量----%@",hejiLabel.text,countLabel.text);
    countLabel.text = [NSString stringWithFormat:@"%d",count];
    hejiLabel.text = [NSString stringWithFormat:@"¥%.2f",heji];
    
//    NSLog(@"合计---%@----数量----%@",hejiLabel.text,countLabel.text);
}
-(void)tanChuOKBtnClick{
    NSLog(@"tanChuOKBtnClick");
    [LYTBackView dissMiss];
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
