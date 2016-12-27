//
//  PMWebUploader.m
//  PasswordMini
//
//  Created by zll on 16/12/26.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "PMWebUploader.h"

@interface PMWebUploader ()<GCDWebUploaderDelegate>
{
    GCDWebUploader *_webUploader;
}
@end

@implementation PMWebUploader

- (instancetype)init
{
    if (self == [super init]) {
        [self setupUploader];
    }
    return self;
}

- (void)setupUploader
{
    NSString *webRootPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Web"];
    _webUploader = [[GCDWebUploader alloc] initWithUploadDirectory:webRootPath];
//    _webUploader.delegate = self;
    [_webUploader start];
    NSLog(@"Visit %@ in your web browser", _webUploader.serverURL);
}

/**
 *  This method is called whenever a file has been downloaded.
 */
- (void)webUploader:(GCDWebUploader*)uploader didDownloadFileAtPath:(NSString*)path
{
    NSLog(@"uploader-->%@, didDownloadFileAtPath-->%@", uploader, path);
}

/**
 *  This method is called whenever a file has been uploaded.
 */
- (void)webUploader:(GCDWebUploader*)uploader didUploadFileAtPath:(NSString*)path
{
    NSLog(@"didUploadFileAtPath-->%@", path);
}

/**
 *  This method is called whenever a file or directory has been moved.
 */
- (void)webUploader:(GCDWebUploader*)uploader didMoveItemFromPath:(NSString*)fromPath toPath:(NSString*)toPath
{
    NSLog(@"didMoveItemFromPath-->%@\t toPath-->%@", fromPath, toPath);
}

/**
 *  This method is called whenever a file or directory has been deleted.
 */
- (void)webUploader:(GCDWebUploader*)uploader didDeleteItemAtPath:(NSString*)path
{
    NSLog(@"didDeleteItemAtPath-->%@", path);
}

/**
 *  This method is called whenever a directory has been created.
 */
- (void)webUploader:(GCDWebUploader*)uploader didCreateDirectoryAtPath:(NSString*)path
{
    NSLog(@"didCreateDirectoryAtPath-->%@", path);
}

@end
