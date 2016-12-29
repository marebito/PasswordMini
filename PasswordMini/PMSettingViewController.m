//
//  PMSettingViewController.m
//  PasswordMini
//
//  Created by zll on 2016/12/22.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "PMSettingViewController.h"

@interface PMSettingViewController ()

@end

@implementation PMSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:btn];
        btn.sd_layout.leftSpaceToView(self.view, 20.f).rightSpaceToView(self.view, 20.f).yIs((20.f + 44.f)*i).heightIs(44.f);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
