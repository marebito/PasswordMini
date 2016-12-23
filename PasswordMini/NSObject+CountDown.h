//
//  NSObject+CountDown.h
//  PasswordMini
//
//  Created by zll on 16/12/23.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  处理倒计时停止的回调
 */
typedef void(^HandleStopCountdownBlock)(NSString *stopTime);

/**
 *  处理倒计时改变的回调
 */
typedef void(^HandleChangeCountdownBlock)(NSString *changeTime);

@interface NSObject (CountDown)

/**
 *  GCD定时器（倒计时）
 *
 *  param   Timeout                         倒计时开始时间
 *  param   handleChangeCountdownBlock      倒计时时间改变回调
 *  param   handleStopCountdownBlock        倒计时时间停止回调
 */
+ (dispatch_source_t)queryGCDWithTimeout:(NSInteger)Timeout
              handleChangeCountdownBlock:(HandleChangeCountdownBlock)handleChangeCountdownBlock
                handleStopCountdownBlock:(HandleStopCountdownBlock)handleStopCountdownBlock;


@end
