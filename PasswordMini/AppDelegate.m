//
//  AppDelegate.m
//  PasswordMini
//
//  Created by zll on 2016/12/21.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "AppDelegate.h"
#import "PMNavigationController.h"
#import "PMMainViewController.h"
#import "THPinViewController.h"

@interface AppDelegate ()<THPinViewControllerDelegate>
@property(nonatomic, strong) THPinViewController *pinViewController;
@property(nonatomic, strong) NSString *correctPin;
@property(nonatomic, assign) NSInteger remainingPinEntries;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    
    self.remainingPinEntries = 0;
    
    PMMainViewController *rootVC = [[PMMainViewController alloc] init];
    PMNavigationController *nav = [[PMNavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self showPswdVC];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showPswdVC
{
    _pinViewController = [[THPinViewController alloc] initWithDelegate:self];
    _pinViewController.promptTitle = @"请输入密码";
    _pinViewController.promptColor = [UIColor darkTextColor];
    _pinViewController.view.tintColor = [UIColor darkTextColor];
    _pinViewController.hideLetters = NO;
    _pinViewController.disableCancel = YES;
    _pinViewController.backgroundColor = [UIColor whiteColor];
    self.window.tag = THPinViewControllerContentViewTag;
    [self.window.rootViewController presentViewController:_pinViewController animated:NO completion:nil];
}

#pragma mark -
#pragma mark THPinViewControllerDelegate Methods
- (NSUInteger)pinLengthForPinViewController:(THPinViewController *)pinViewController
{
    return 4;
}

- (BOOL)pinViewController:(THPinViewController *)pinViewController isPinValid:(NSString *)pin
{
    if ([pin isEqualToString:self.correctPin]) {
        return YES;
    } else {
        self.remainingPinEntries--;
        return NO;
    }
}

- (BOOL)userCanRetryInPinViewController:(THPinViewController *)pinViewController
{
    return (self.remainingPinEntries > 0);
}

// optional delegate methods

- (void)incorrectPinEnteredInPinViewController:(THPinViewController *)pinViewController
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)pinViewControllerWillDismissAfterPinEntryWasSuccessful:(THPinViewController *)pinViewController
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)pinViewControllerDidDismissAfterPinEntryWasSuccessful:(THPinViewController *)pinViewController
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)pinViewControllerWillDismissAfterPinEntryWasUnsuccessful:(THPinViewController *)pinViewController
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)pinViewControllerDidDismissAfterPinEntryWasUnsuccessful:(THPinViewController *)pinViewController
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)pinViewControllerWillDismissAfterPinEntryWasCancelled:(THPinViewController *)pinViewController
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)pinViewControllerDidDismissAfterPinEntryWasCancelled:(THPinViewController *)pinViewController
{
    NSLog(@"%s",__FUNCTION__);
}

@end
