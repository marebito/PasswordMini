//
//  PMPasswordManager.m
//  PasswordMini
//
//  Created by zll on 2016/12/23.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "PMPasswordManager.h"
#import "PasswordMini-Swift.h"
#import "RSA.h"

@interface PMPasswordManager ()
{
    FMDatabase *_fmdb; // 数据库操作对象
}
@end

@implementation PMPasswordManager

+ (instancetype)sharedInstance
{
    static PMPasswordManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PMPasswordManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    if (self == [super init]) {
        // 打开数据库
        _fmdb = [[FMDatabase alloc] initWithPath:[self dbFilePath]];
    }
    return self;
}

- (NSString *)dbFilePath
{
    NSString *filePath = [DOCPATH stringByAppendingString:@"/PasswordMini.sqlite3"];
    if(!FEXIST(filePath))
    {
        NSError *err;
        FCOPY(MBF(@"PasswordMini", @"sqlite3"), filePath, &err);
        if (err) {
            NSLog(@"拷贝数据库文件出错");
        }
    }
    return filePath;
}

- (NSString *)publicKey
{
    return @"";
}

- (NSString *)privateKey
{
    return @"";
}

- (void)encryptString:(NSString *)string style:(PMEncryptStyle)style
{
    switch (style) {
        case PMEncryptStyleAES:
        {
            [RNCryptorHelper encryptWithData:[string dataUsingEncoding:NSUTF8StringEncoding] withPassword:@""];
        }
            break;
        case PMEncryptStyleBASE64:
        {
            
        }
            break;
        case PMEncryptStyleMD5:
        {
            
        }
            break;
        case PMEncryptStyleRSA:
        {
            NSString *encrypted = [RSA encryptString:@"hello world!" publicKey:[self publicKey]];
            NSLog(@"encrypted: %@", encrypted);
            NSString *decrypted = [RSA decryptString:encrypted privateKey:[self privateKey]];
            NSLog(@"decrypted: %@", decrypted);
        }
            break;
        default:
            break;
    }
}

- (void)encryptData:(NSData *)data style:(PMEncryptStyle)style
{
    
}

- (void)decryptString:(NSString *)string style:(PMEncryptStyle)style
{
    
}

- (void)decryptData:(NSData *)data style:(PMEncryptStyle)style
{
    
}

@end
