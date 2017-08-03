//
//  LYTFMDB.m
//  LYTCoreDate
//
//  Created by shenTing on 2017/5/23.
//  Test Change This
//  博客:http://www.cnblogs.com/yuShen
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTFMDB.h"
@implementation LYTFMDB
- (id)init
{
    if (self = [super init]) {
        //初始化数据库对象 并打开
        _database = [FMDatabase databaseWithPath:[LYTFMDB getDataBasePath]];
        //如果数据库打开失败返回空值
        if (![_database open]) {
            return nil;
        }
    }
    
    
    
//    NSString *existsSql = [NSString stringWithFormat:@"select count(name) as countNum from sqlite_master where type = 'table' and name = '%@'", @"Member" ];
//    FMResultSet *rs = [_database executeQuery:existsSql];
//    
//    if ([rs next]) {
//        NSInteger count = [rs intForColumn:@"countNum"];
//        NSLog(@"The table count: %li", count);
//        if (count == 1) {
//            NSLog(@"存在");
//        }
//    }
    
    //如果数据库打开成功 创建表
    /** 创建本地生活商品购物表
        shopId      商品Id     主键
        shopName    商品名称
        shopMoney   商品价格
        shopCount   商品数量
     **/
    
    NSString *sql = @"create table if not exists local_goods(shopId integer primary key, shopCount integer,shopName text ,shopMoney integer)";
    
    BOOL is = [_database executeUpdate:sql];
    if (is) {
        NSLog(@"创建表成功！");
    }
    return self;
}
//获取数据库管理对象单例的方法
+ (LYTFMDB *)sharedDataBase
{
    static LYTFMDB *wydatase = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        wydatase = [[LYTFMDB alloc]init];
    });
    
    return wydatase;
}
//返回数据库的路径
+ (NSString *)getDataBasePath
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return [path stringByAppendingPathComponent:@"wdh.db"];
}
//查询数据库中是否包含当前搜索记录
- (BOOL)isExistSeachText:(NSString *)seachText
{
    NSString *sql = @"select * from local_goods";
    FMResultSet *results = [_database executeQuery:sql];
    
    while (results.next) {
        if ([seachText isEqualToString:[results stringForColumn:@"shopId"]]) {
            return YES;
        }
    }
    return NO;
}
//插入新纪录
- (BOOL)insertPdcToCarWithModel:(LYTGoodsInfoModel *)model
{
    if ([self isExistSeachText:[NSString stringWithFormat:@"%ld",model.shopId]]) {
        //        [self deletePdcInCarById:[model.car_id intValue]];
        return NO;
    }
    /***************如果该产品在购物车中不存在，加入购物车*******************/
    NSString *sql = @"insert into local_goods(shopId,shopName,shopMoney,shopCount) values (?,?,?,?)";
    NSLog(@"---%ld---",model.shopId);
    BOOL isInsertOK = [_database executeUpdate:sql,[NSNumber numberWithInteger:model.shopId], model.shopName,[NSNumber numberWithDouble:model.shopMoney], [NSNumber numberWithInteger:model.shopCount]];
    NSLog(@"---%ld---%d",model.shopId,isInsertOK);
    if (isInsertOK) {
        NSLog(@"%ld-->插入成功",model.shopId);
        return YES;
    }  
    return NO;  
}
//获取一个model比对
- (LYTGoodsInfoModel *)getNewsModelById:(NSString *)newId
{
    NSString *sql = @"select * from local_goods where shopId = ?";
    FMResultSet *results = [_database executeQuery:sql,newId];
    while (results.next) {
        LYTGoodsInfoModel *model = [[LYTGoodsInfoModel alloc]init];
        model.shopName  =   [results stringForColumn:@"shopName"];
        model.shopId    =   [results intForColumn:@"shopId"];
        model.shopCount =   [results intForColumn:@"shopCount"];
        model.shopMoney =   [results doubleForColumn:@"shopMoney"];
        return model;
    }
    return nil;
}

//获取所有的数据
- (NSArray *)getAllData
{
    NSString *sql = @"select * from local_goods order by shopId desc";
    FMResultSet *results = [_database executeQuery:sql];
    NSMutableArray *arr = [NSMutableArray array];
    while (results.next) {
        LYTGoodsInfoModel *model = [[LYTGoodsInfoModel alloc]init];
        model.shopName  =   [results stringForColumn:@"shopName"];
        model.shopId    =   [results intForColumn:@"shopId"];
        model.shopCount =   [results intForColumn:@"shopCount"];
        model.shopMoney =   [results doubleForColumn:@"shopMoney"];
        [arr addObject:model];
    }
    
    return arr;
}



//清空数据库
- (BOOL)deleteDatabase
{
    NSString *sql1 = @"delete from local_goods";

    BOOL isOK1 = [_database executeUpdate:sql1];

    if (isOK1) {
        return YES;
    }
    return NO;
}
//关闭数据库
- (void)closeDataBase
{
    if (_database) {
        [_database close];
    }
}
@end
