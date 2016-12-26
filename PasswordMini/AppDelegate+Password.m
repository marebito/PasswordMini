//
//  AppDelegate+Password.m
//  PasswordMini
//
//  Created by zll on 16/12/23.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "AppDelegate+Password.h"
#import "PasswordMini-Swift.h"

@implementation AppDelegate (Password)

- (void)updateLastErrorTimeStamp
{
    UDS(LAST_PSWD_ERROR_TIMESTAMP, PM_TIMESTAMP);
}

- (void)startTimer:(int)seconds handleChangeCountdownBlock:(HandleChangeCountdownBlock)handleChangeCountdownBlock handleStopCountdownBlock:(HandleStopCountdownBlock)handleStopCountdownBlock
{
    [NSObject queryGCDWithTimeout:seconds handleChangeCountdownBlock:handleChangeCountdownBlock handleStopCountdownBlock:handleStopCountdownBlock];
}

- (void)saveUserMainPswd:(NSString *)pswd
{
    NSData *data = [pswd dataUsingEncoding:NSUTF8StringEncoding];
    // 此处密钥需要打入.a静态库以防止被破解
    NSString *password = @"Secret password";
    
    NSData *cipherData = [RNCryptorHelper encryptWithData:data withPassword:password];
//
//    // Decryption
//    NSError *error = nil;
//    NSData *plaintext = [RNCryptor decryptData:ciphertext password:password error:&error];
//    if (error != nil) {
//        NSLog(@"ERROR:%@", error);
//        return
//    }
//    [SAMKeychain setPassword:<#(nonnull NSString *)#> forService:<#(nonnull NSString *)#> account:<#(nonnull NSString *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>];
}

- (void)getUserMainPswd:(NSString *)pswd
{
//    [SAMKeychain passwordForService:<#(nonnull NSString *)#> account:<#(nonnull NSString *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>];
}

- (void)updateUserMainPswd:(NSString *)pswd
{
//    [SAMKeychain setPasswordData:<#(nonnull NSData *)#> forService:<#(nonnull NSString *)#> account:<#(nonnull NSString *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>];
}

@end
