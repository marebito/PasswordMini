//
//  PMNavigationController.m
//  PasswordMini
//
//  Created by zll on 2016/12/22.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "PMNavigationController.h"

@interface PMNavigationController ()

@end

@implementation PMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navigationBar = self.navigationBar;
    [navigationBar setShadowImage:[UIImage new]];
    self.navigationBar.barStyle = UIBarStyleBlack;
    [[UINavigationBar appearance] setBarTintColor:RGB(0x000000)];
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor]
                           };
    [navigationBar setTitleTextAttributes:dict];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
