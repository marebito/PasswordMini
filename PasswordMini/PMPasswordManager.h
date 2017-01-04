//
//  PMPasswordManager.h
//  PasswordMini
//
//  Created by zll on 2016/12/23.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 加密方式

 - PMEncryptStyleAES: AES加密
 - PMEncryptStyleBASE64: Base64加密
 - PMEncryptStyleMD5: MD5加密
 - PMEncryptStyleRSA: RSA加密
 */
typedef NS_ENUM(NSUInteger, PMEncryptStyle) {
    PMEncryptStyleAES,
    PMEncryptStyleBASE64,
    PMEncryptStyleMD5,
    PMEncryptStyleRSA
};

@interface PMPasswordManager : NSObject

+ (instancetype)sharedInstance;

- (void)encryptString:(NSString *)string style:(PMEncryptStyle)style;

- (void)encryptData:(NSData *)data style:(PMEncryptStyle)style;

- (void)decryptString:(NSString *)string style:(PMEncryptStyle)style;

- (void)decryptData:(NSData *)data style:(PMEncryptStyle)style;

@end
