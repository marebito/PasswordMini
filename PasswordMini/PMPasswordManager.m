//
//  PMPasswordManager.m
//  PasswordMini
//
//  Created by zll on 2016/12/23.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "PMPasswordManager.h"

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

@end
