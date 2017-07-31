//
//  LYTMerchantShopCell1.h
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTMerchantShopCell1 : UICollectionViewCell
@property(nonatomic,strong)UIImageView *img;            //图片
@property(nonatomic,strong)UILabel *codeLabel;          //商家名称
@property(nonatomic,strong)UILabel *titleLabel;         //商品名称
@property(nonatomic,strong)UILabel *priceLabel;         //商品价格


@property(nonatomic,strong)UIView *topView;             //顶层视图
@property(nonatomic,strong)UILabel *lineLabel;          //灰线
@end
