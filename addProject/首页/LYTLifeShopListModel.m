//
//  LYTLifeShopListModel.m
//  addProject
//
//  Created by 云盛科技 on 2017/8/9.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTLifeShopListModel.h"

@implementation LYTLifeShopListModel
- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (id)ListWithDictionary:(NSDictionary *)dic {
    return [[LYTLifeShopListModel alloc]initWithDictionary:dic];
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"address"]) {
        self.address = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"areaName"]) {
        self.areaName = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"cover"]) {
        self.cover = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"distanceString"]) {
        self.distanceString = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"keyWord"]) {
        self.keyWord = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"shopName"]) {
        self.shopName = [NSString stringWithFormat:@"%@", value];
    }
    
    
    if ([key isEqualToString:@"areaId"]) {
        self.areaId = [value integerValue];
    }
    if ([key isEqualToString:@"hot"]) {
        self.hot = [value integerValue];
    }
    if ([key isEqualToString:@"saleCount"]) {
        self.saleCount = [value integerValue];
    }
    if ([key isEqualToString:@"shopId"]) {
        self.shopId = [value integerValue];
    }
    
    
}
@end
