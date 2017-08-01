//
//  LYTMerchantShopCell2.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//



#import "LYTMerchantShopCell2.h"

@implementation LYTMerchantShopCell2
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.img];          //图片
        [self addSubview:self.titleLabel];   //商品名称
        [self addSubview:self.contentLabel];    //商品编号
        [self addSubview:self.priceLabel];   //商品价格
        [self addSubview:self.buyBtn];      //买家秀

    }
    return self;
}

-(UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc]initWithFrame:WDH_CGRectMake(0, 0, 180, 180)];
        _img.backgroundColor = [UIColor blueColor];
    }
    return _img;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:WDH_CGRectMake(10,  183, 163, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"奥术大师多阿斯蒂芬斯蒂芬";
    }
    return _titleLabel;
}


-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:WDH_CGRectMake(10 ,203, 163, 20)];
        _contentLabel.font = [UIFont systemFontOfSize:12];
//        _codeLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor colorWithRed:39 / 255.0 green:39 / 255.0 blue:39 / 255.0 alpha:1];
        _contentLabel.text = @"奥术大师多阿斯蒂芬斯蒂芬";
    }
    return _contentLabel;
}

-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:WDH_CGRectMake(11 ,223, 100, 30)];
        _priceLabel.font = [UIFont systemFontOfSize:16];
        _priceLabel.text = @"¥98";
    }
    return _priceLabel;
}

-(UIButton *)buyBtn{
    if (!_buyBtn) {
        _buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyBtn.frame = WDH_CGRectMake(140, 223 , 30, 30);
        [_buyBtn setBackgroundImage:[UIImage imageNamed:@"收藏icon@3x"] forState:UIControlStateNormal];
        _buyBtn.backgroundColor = [UIColor redColor];
    }
    return _buyBtn;
}



@end
