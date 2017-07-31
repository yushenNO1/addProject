//
//  LYTSearchVC.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/27.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "LYTSearchVC.h"

@interface LYTSearchVC ()<UITextFieldDelegate>

@end

@implementation LYTSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configSeachVC];
    
}

-(void)configSeachVC{
    
    UIView *textBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,230, 30)];
    textBackView.backgroundColor = [UIColor blueColor];
    textBackView.layer.cornerRadius = 15;
    textBackView.layer.masksToBounds = YES;
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(30, 0, 170, 30)];
    textField.delegate = self;
    textField.backgroundColor = [UIColor redColor];
    textField.borderStyle = UITextBorderStyleNone;
    [textBackView addSubview:textField];
    self.navigationItem.titleView = textBackView;
    
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
//    view.backgroundColor = [UIColor redColor];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
//    self.navigationItem.leftBarButtonItem = item;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"点击确定键执行方法走不走---%@",textField.text);
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"是不是开始编辑就执行");
    //加个蒙板
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
