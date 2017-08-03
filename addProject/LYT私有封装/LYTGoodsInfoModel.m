//
//  LYTGoodsInfoModel.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/2.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTGoodsInfoModel.h"

@implementation LYTGoodsInfoModel
- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNumber class]]) {
        
    }
    if ([value isKindOfClass:[NSNull class]]) {
        
    }
    [super setValue:value forKey:key];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"goodId"]) {
        self.shopId = [value integerValue];
    }
    if ([key isEqualToString:@"price"]) {
        self.shopMoney = [value doubleValue];
    }
    if ([key isEqualToString:@"goodName"]) {
        self.shopName = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"goodId"]) {
        self.shopCount = [value integerValue];
    }
}

+ (id)LYTGoodsInfoWithDictionary:(NSDictionary *)dic
{
    return [[LYTGoodsInfoModel alloc] initWithDictionary:dic];
}

@end
