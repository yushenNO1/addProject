//
//  LYTLifeShopListModel.h
//  addProject
//
//  Created by 云盛科技 on 2017/8/9.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYTLifeShopListModel : NSObject
@property(nonatomic,copy)NSString *address;                 //详细地址
@property(nonatomic,copy)NSString *areaName;                //所在地区名称
@property(nonatomic,copy)NSString *cover;                   //商铺封面
@property(nonatomic,copy)NSString *distanceString;          //距离
@property(nonatomic,copy)NSString *shopName;                //商铺名称
@property(nonatomic,copy)NSString *keyWord;                 //关键词


@property(nonatomic,assign)NSInteger areaId;                //所在地区ID
@property(nonatomic,assign)NSInteger hot;                   //是否被热搜
@property(nonatomic,assign)NSInteger saleCount;             //销售数量
@property(nonatomic,assign)NSInteger shopId;                //商铺ID


- (id)initWithDictionary:(NSDictionary *)dic;
+ (id)ListWithDictionary:(NSDictionary *)dic;
@end
