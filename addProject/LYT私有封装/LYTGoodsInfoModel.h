//
//  LYTGoodsInfoModel.h
//  addProject
//
//  Created by 云盛科技 on 2017/8/2.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYTGoodsInfoModel : NSObject
/**
 shopId      商品Id     主键
 shopName    商品名称
 shopMoney   商品价格
 shopCount   商品数量
 **/

@property (nonatomic, assign) NSInteger         shopId;
@property (nonatomic, copy) NSString            *shopName;
@property (nonatomic, assign) double            shopMoney;
@property (nonatomic, assign) NSInteger         shopCount;

- (id)initWithDictionary:(NSDictionary *)dic;
+ (id)GoodsInfoWithDictionary:(NSDictionary *)dic;
@end
