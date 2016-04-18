//
//  AppDelegate.h
//  SayBySelf
//
//  Created by 程嘉雯 on 15/9/27.
//  Copyright © 2015年 com.epoluodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "publicinfo.h"
#import <Common/FileCommon.h>
#import "baidusdk.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>

{
    BMKMapManager *bmkmapmanger;
}

@property (strong, nonatomic) UIWindow *window;



@property (strong,nonatomic) NSString *phone;
@property (assign) enum Sex setenum;
@property (strong,nonatomic) UIImage *nickimg;
@property (assign) int nickbackimg;
@property (strong,nonatomic) NSString *nickname;
@property (assign) BOOL IsOpen;




@end

