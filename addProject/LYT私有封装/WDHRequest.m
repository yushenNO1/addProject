//
//  WDHRequest.m
//  LSK
//
//  Created by 云盛科技 on 2017/3/1.
//  Copyright © 2017年 云盛科技. All rights reserved.
//

#import "WDHRequest.h"

@implementation WDHRequest
+(void)requestAllListWith:(NSString *)urlStr completeWithBlock:(void(^)(NSDictionary *responseObject))block WithError:(void(^)(NSString *errorStr))errorBlock{
    [SVProgressHUD showWithStatus:@"加载中..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    [manager.requestSerializer setValue:str forHTTPHeaderField:@"Authorization"];
    if ([urlStr rangeOfString:@"/App/"].location != NSNotFound) {
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
         NSString *errorStr = [NSString stringWithFormat:@"%@",error];
        errorBlock(errorStr);
    }];
}
+(void)requestTypePostWith:(NSString *)urlStr completeWithBlock:(void(^)(NSDictionary *responseObject))block WithError:(void(^)(NSString *errorStr))errorBlock{
    [SVProgressHUD showWithStatus:@"加载中..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:str forHTTPHeaderField:@"Authorization"];
    [manager POST:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSString *errorStr = [NSString stringWithFormat:@"%@",error];
        errorBlock(errorStr);
    }];
    
    
    
    
}

+(void)requestZFBOrderWith:(NSString *)urlStr completeWithBlock:(void(^)(NSDictionary *responseObject))block WithError:(void(^)(NSString *errorStr))errorBlock{
    [SVProgressHUD showWithStatus:@"加载中..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:str forHTTPHeaderField:@"Authorization"];
    [manager POST:urlStr parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"支付宝------成功-------%@",responseObject);
        block(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSString *errorStr = [NSString stringWithFormat:@"%@",error];
        
        errorBlock(errorStr);
        NSLog(@"支付宝------失败-------%@",error);
    }];

}

+(void)requestWXOrderWith:(NSString *)urlStr completeWithBlock:(void(^)(NSDictionary *responseObject))block{
    [SVProgressHUD showWithStatus:@"加载中..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:str forHTTPHeaderField:@"Authorization"];
    [manager POST:urlStr parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"微信------成功-------%@",responseObject);
        block(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSLog(@"微信------失败-------%@",error);
    }];
}





@end
