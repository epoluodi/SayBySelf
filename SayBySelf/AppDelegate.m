//
//  AppDelegate.m
//  SayBySelf
//
//  Created by 程嘉雯 on 15/9/27.
//  Copyright © 2015年 com.epoluodi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSUserDefaults *userinfo;
}
@end

@implementation AppDelegate
@synthesize nickbackimg;
@synthesize nickimg;
@synthesize nickname;
@synthesize setenum;
@synthesize phone;
@synthesize IsOpen;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    userinfo=[NSUserDefaults standardUserDefaults];
    [self initApp];
    // Override point for customization after application launch.
    
    bmkmapmanger = [[BMKMapManager alloc] init];
    BOOL ret = [bmkmapmanger start:@"WynAu7Ffb1rB0bFh8NYniBV0" generalDelegate:self];
    if (!ret)
        NSLog(@"失败百度");
    return YES;
}

-(void)initApp
{
    if ([userinfo integerForKey:@"Isinit"]==0)
    {
        NSLog(@"第一次运行");
        [userinfo setInteger:1 forKey:@"Isinit"];
        [userinfo setInteger:1 forKey:@"nickbackimg"];
        [userinfo setInteger:Secret forKey:@"setenum"];
        [userinfo setBool:NO forKey:@"IsOpen"];
        [userinfo setObject:@"" forKey:@"phone"];
        [userinfo setObject:@"" forKey:@"nickname"];
        
    }
 
        nickbackimg = [userinfo integerForKey:@"nickbackimg"];
        setenum = (enum Sex)[userinfo integerForKey:@"setenum"];
        IsOpen = [userinfo boolForKey:@"IsOpen"];
        phone = [userinfo objectForKey:@"phone"];
        nickname = [userinfo objectForKey:@"nickname"];
    NSFileManager *filemanger = [NSFileManager defaultManager];
    NSString *path = [[FileCommon getCacheDirectory] stringByAppendingString:@"/nickimg.jpg"];
    if ([filemanger fileExistsAtPath:path])
        nickimg = [UIImage imageWithData:[[NSData alloc] initWithContentsOfFile:path]];
    else
        nickimg = [UIImage imageNamed:@"nick"];

}



- (void)applicationWillResignActive:(UIApplication *)application {
    
    [BMKMapView willBackGround];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [BMKMapView didForeGround];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)onGetNetworkState:(int)iError
{
    if (iError == 0)
        NSLog(@"联网成功---baidu");
}
-(void)onGetPermissionState:(int)iError
{
    if (iError == 0)
        NSLog(@"授权成功---baidu");
}
@end
