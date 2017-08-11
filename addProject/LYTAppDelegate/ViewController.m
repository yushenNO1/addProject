//
//  ViewController.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/24.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "ViewController.h"
#import "LYTMerchantShop.h"                         //商家店铺
#import "LYTLifeTableVC.h"                          //首页
#import <LocalAuthentication/LocalAuthentication.h> //指纹识别
#import "ShowVC.h"                                  //3DTouch
#import "LYTSortVC.h"                               //子视图控制器
#import "LYTSearchVC.h"                             //搜索框
#import "LYTGoodsDetailVC.h"                        //商品详情页面
#import "LYTLocalGoodsDetailVC.h"                   //本地商品详情页面
#import "LYTLocalOrderList.h"                       //订单列表

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(10, 70, 100, 20);
    [btn1 setTitle:@"商家店铺" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(10, 100, 100, 20);
    [btn2 setTitle:@"首页" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(10, 130, 100, 20);
    btn3.backgroundColor = [UIColor redColor];
    [btn3 setTitle:@"指纹识别" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    btn3.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(10, 160, 100, 20);
    btn4.backgroundColor = [UIColor redColor];
    [btn4 setTitle:@"3DTouch" forState:UIControlStateNormal];
//    [btn4 addTarget:self action:@selector(btn4Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        NSLog(@"3D Touch  可用!");
        //给cell注册3DTouch的peek（预览）和pop功能
        [self registerForPreviewingWithDelegate:self sourceView:btn4];
    } else {
        NSLog(@"3D Touch 无效");
    }
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(10, 190, 100, 20);
    btn5.backgroundColor = [UIColor redColor];
    [btn5 setTitle:@"子视图控制器" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(btn5Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.frame = CGRectMake(10, 220, 100, 20);
    btn6.backgroundColor = [UIColor redColor];
    [btn6 setTitle:@"搜索框" forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(btn6Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn7.frame = CGRectMake(10, 250, 100, 20);
    btn7.backgroundColor = [UIColor redColor];
    [btn7 setTitle:@"商品详情" forState:UIControlStateNormal];
    [btn7 addTarget:self action:@selector(btn7Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn7];
    
    
    
    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn8.frame = CGRectMake(10, 280, 100, 20);
    btn8.backgroundColor = [UIColor redColor];
    [btn8 setTitle:@"本地商品详情" forState:UIControlStateNormal];
    [btn8 addTarget:self action:@selector(btn8Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn8];
    
    
    UIButton *btn9 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn9.frame = CGRectMake(10, 310, 100, 20);
    btn9.backgroundColor = [UIColor redColor];
    [btn9 setTitle:@"订单列表" forState:UIControlStateNormal];
    [btn9 addTarget:self action:@selector(btn9Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn9];
    
}
-(void)btn1Click{
    LYTMerchantShop *vc = [[LYTMerchantShop alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btn2Click{
    LYTLifeTableVC *vc = [[LYTLifeTableVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btn3Click:(UIButton *)sender{
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        NSLog(@"不支持指纹识别");
        return;
    }else{
        LAContext *ctx = [[LAContext alloc] init];
        if ([ctx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil]) {
            NSLog(@"支持");
            [ctx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹识别" reply:^(BOOL success, NSError * error) {
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"系统取消授权，如其他APP切入");
                        break;
                    }
                    case LAErrorUserCancel:
                    {
                        NSLog(@"用户取消验证Touch ID");
                        break;
                    }
                    case LAErrorAuthenticationFailed:
                    {
                        NSLog(@"授权失败");
                        break;
                    }
                    case LAErrorPasscodeNotSet:
                    {
                        NSLog(@"系统未设置密码");
                        break;
                    }
                    case LAErrorTouchIDNotAvailable:
                    {
                        NSLog(@"设备Touch ID不可用，例如未打开");
                        break;
                    }
                    case LAErrorTouchIDNotEnrolled:
                    {
                        NSLog(@"设备Touch ID不可用，用户未录入");
                        break;
                    }
                    case LAErrorUserFallback:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"用户选择输入密码，切换主线程处理");
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"其他情况，切换主线程处理");
                        }];
                        break;
                    }
                }
            }];
        }
    }
}
//peek(预览)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //获取按压的cell所在行，[previewingContext sourceView]就是按压的那个视图
    //    NSIndexPath *indexPath = [_firstTableView indexPathForCell:(UITableViewCell* )[previewingContext sourceView]];
    
    //设定预览的界面
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //    SearchViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"searchController"];
    //    childVC.preferredContentSize = CGSizeMake(0.0f,500.0f);
    //    childVC.str = [NSString stringWithFormat:@"我是%@,用力按一下进来",_myArray[indexPath.row]];
    
    ShowVC *childVC = [[ShowVC alloc]init];
    childVC.preferredContentSize = CGSizeMake(0.0f,500.0f);
    childVC.Str = [NSString stringWithFormat:@"我是%@,用力按一下进来",@"通过按钮"];
    //调整不被虚化的范围，按压的那个cell不被虚化（轻轻按压时周边会被虚化，再少用力展示预览，再加力跳页至设定界面）
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width,40);
    previewingContext.sourceRect = rect;
    
    //返回预览界面
    return childVC;
}
//pop（按用点力进入）
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    NSLog(@"woshenme我什么时候执行");
    [self showViewController:viewControllerToCommit sender:self];
}



-(void)btn5Click{
    LYTSortVC *vc = [[LYTSortVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)btn6Click{
    LYTSearchVC *vc = [[LYTSearchVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)btn7Click{
    LYTGoodsDetailVC *vc = [[LYTGoodsDetailVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)btn8Click{
    LYTLocalGoodsDetailVC *vc = [[LYTLocalGoodsDetailVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)btn9Click{
    LYTLocalOrderList *vc = [[LYTLocalOrderList alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
