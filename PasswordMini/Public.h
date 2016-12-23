//
//  Public.h
//  PasswordMini
//
//  Created by zll on 2016/12/22.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#ifndef Public_h
#define Public_h

// 颜色宏定义

#define RGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBA(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

// NSUserDefaults对象
#define USERDEFAULTS [NSUserDefaults standardUserDefaults]

/**
 向NSUserDefaults中存值

 @param k 键
 @param v 值
 @return 执行结果
 */
#define UDS(k, v) {[USERDEFAULTS setObject:v forKey:k]; [USERDEFAULTS synchronize];}

/**
 从NSUserDefaults中取值

 @param k 键
 @return 执行结果
 */
#define UDG(k) [USERDEFAULTS objectForKey:k]

// 文件管理器
#define FILEMANAGER [NSFileManager defaultManager]

/**
 文件是否存在

 @param path 文件路径
 @return 执行结果
 */
#define FEXIST(path) [FILEMANAGER fileExistsAtPath:path]

/**
 将文件从src移动到dst

 @param src 源路径
 @param dst 目标路径
 @param err 错误
 @return 执行结果
 */
#define FMOVE(src, dst, err) [FILEMANAGER moveItemAtPath:src toPath:dst error:err]

/**
 将文件从src拷贝到dst

 @param src 源路径
 @param dst 目标路径
 @param err 错误
 @return 执行结果
 */
#define FCOPY(src, dst, err) [FILEMANAGER copyItemAtPath:src toPath:dst error:err]

/**
 删除path路径的文件

 @param path 路径
 @param err 错误
 @return 执行结果
 */
#define FREMOVE(path, err) [FILEMANAGER removeItemAtPath:path error:err]

// mainbundle
#define MB [NSBundle mainBundle]

/**
 返回mainbundle文件路径

 @param name 名称
 @param type 类型
 @return 返回文件路径
 */
#define MBF(name, type) [MB pathForResource:name ofType:type]

#define DOCPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#define PM_TIMESTAMP @((long long)[[NSDate date] timeIntervalSince1970])

#endif /* Public_h */
