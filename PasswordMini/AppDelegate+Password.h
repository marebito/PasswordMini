//
//  AppDelegate+Password.h
//  PasswordMini
//
//  Created by zll on 16/12/23.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "AppDelegate.h"
#import "NSObject+CountDown.h"

@interface AppDelegate (Password)

/**
 更新最后出错时间戳
 */
- (void)updateLastErrorTimeStamp;

/**
 开启计时器

 @param seconds 秒数
 @param handleChangeCountdownBlock 倒计时改变回调
 @param handleStopCountdownBlock 倒计时停止回调
 */
- (void)startTimer:(int)seconds handleChangeCountdownBlock:(HandleChangeCountdownBlock)handleChangeCountdownBlock handleStopCountdownBlock:(HandleStopCountdownBlock)handleStopCountdownBlock;

/**
 存储用户主密码

 @param pswd 密码
 */
- (void)saveUserMainPswd:(NSString *)pswd;

/**
 获取用户主密码

 @param pswd 密码
 */
- (void)getUserMainPswd:(NSString *)pswd;

/**
 更新用户主密码

 @param pswd 密码
 */
- (void)updateUserMainPswd:(NSString *)pswd;

@end
