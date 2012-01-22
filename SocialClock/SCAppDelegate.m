//
//  SCAppDelegate.m
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import "SCAppDelegate.h"

@implementation SCAppDelegate

@synthesize window = _window;
@synthesize facebook;
@synthesize viewController;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Facebookインスタンス生成
    facebook = [[Facebook alloc] initWithAppId:@"293502244030802" andDelegate:self];
    
    // すでにFB用アクセストークンとその期限をUserDefaultsに設定している場合は
    // facebookインスタンスに設定（ログイン済状態）
    NSUserDefaults  *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] &&
        [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    
    if (![facebook isSessionValid]) {
        // トークンの期限切れ
        NSArray *permissions = [[NSArray alloc] initWithObjects:
                                @"user_likes",
                                @"read_stream",nil];
        // 認証処理を行う
        [facebook authorize:permissions];
        [permissions release];
    }    
    return YES;
}

// Pre 4.2 support
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [facebook handleOpenURL:url];
}

// For 4.2+ support
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [facebook handleOpenURL:url];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark -
#pragma mark FBSession Delegate
-(void)fbDidLogin
{
    NSUserDefaults  *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

-(void)fbDidNotLogin:(BOOL)cancelled
{
    
}

-(void)fbDidExtendToken:(NSString *)accessToken expiresAt:(NSDate *)expiresAt
{
    
}

-(void)fbDidLogout
{
    // Remove saved authorizatino information if it exists
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]) {
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        [defaults synchronize];
    }   
}

-(void)fbSessionInvalidated
{
    
}

@end
