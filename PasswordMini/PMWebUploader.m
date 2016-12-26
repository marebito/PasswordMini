//
//  PMWebUploader.m
//  PasswordMini
//
//  Created by zll on 16/12/26.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "PMWebUploader.h"

@interface PMWebUploader ()
{
    GCDWebUploader *_webUploader;
}
@end

@implementation PMWebUploader

- (instancetype)init
{
    if (self == [super init]) {
        
    }
    return self;
}

- (void)setupUploader
{
    NSString *webRootPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Web"];
    _webUploader = [[GCDWebUploader alloc] initWithUploadDirectory:webRootPath];
    [_webUploader start];
    NSLog(@"Visit %@ in your web browser", _webUploader.serverURL);
}



@end
