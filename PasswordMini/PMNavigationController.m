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
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x000000)];
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor]
                           };
    [navigationBar setTitleTextAttributes:dict];
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
