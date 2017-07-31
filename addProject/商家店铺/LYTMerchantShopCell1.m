//
//  LYTMerchantShopCell1.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTMerchantShopCell1.h"
#define kScreenWidth1       ([UIScreen mainScreen].bounds.size.width / 375)     //适配宽度
#define kScreenHeight1      ([UIScreen mainScreen].bounds.size.height / 667)    //适配高度

@implementation LYTMerchantShopCell1

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topView];
    }
    return self;
}
-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0 * kScreenWidth1, 10* kScreenHeight1, 375 * kScreenWidth1, 130* kScreenHeight1)];
        _topView.backgroundColor = [UIColor whiteColor];
        [_topView addSubview:self.img];
        [_topView addSubview:self.titleLabel];
        [_topView addSubview:self.priceLabel];
        [_topView addSubview:self.lineLabel];
        [_topView addSubview:self.codeLabel];
    }
    return _topView;
}
- (UIImageView *)img
{
    if (!_img) {
        CGRect frame = CGRectMake(10 * kScreenWidth1, 10* kScreenHeight1, 60 * kScreenWidth1, 60* kScreenHeight1);
        self.img = [[UIImageView alloc] init];
        _img.frame = frame;
        _img.backgroundColor = [UIColor blackColor];
    }
    return _img;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        CGRect frame = CGRectMake(80 * kScreenWidth1, 10* kScreenHeight1, 175 * kScreenWidth1, 20* kScreenHeight1);
        
        _titleLabel = [[UILabel alloc]initWithFrame:frame];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _titleLabel.text = @"小魔仙服装有限公司";
    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        CGRect frame = CGRectMake(80 * kScreenWidth1, 40* kScreenHeight1, 100 * kScreenWidth1, 20* kScreenHeight1);
        
        _priceLabel = [[UILabel alloc]initWithFrame:frame];
        _priceLabel.font = [UIFont systemFontOfSize:14];
        _priceLabel.text = @"已认证";
    }
    return _priceLabel;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        CGRect frame = CGRectMake(0 * kScreenWidth1, 80* kScreenHeight1, 375 * kScreenWidth1, 1* kScreenHeight1);
        _lineLabel = [[UILabel alloc]initWithFrame:frame];
        _lineLabel.backgroundColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:234 / 255.0 alpha:1];
    }
    return _lineLabel;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        CGRect frame = CGRectMake(10 * kScreenWidth1, 85* kScreenHeight1, 200 * kScreenWidth1, 35* kScreenHeight1);
        _codeLabel.textAlignment = NSTextAlignmentCenter;
        _codeLabel.textColor = [UIColor colorWithRed:195 / 255.0 green:198 / 255.0 blue:201 / 255.0 alpha:1];
        _codeLabel = [[UILabel alloc]initWithFrame:frame];
        _codeLabel.font = [UIFont systemFontOfSize:12];
        _codeLabel.numberOfLines = 0;
        _codeLabel.text = @"敖德萨大大所大阿萨德啊电位器为防守打法是否";
    }
    return _codeLabel;
}

@end
