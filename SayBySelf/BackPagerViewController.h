//
//  BackPagerViewController.h
//  DyingWish
//
//  Created by xiaoguang yang on 15/5/24.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Common/PublicCommon.h>
#import "AppDelegate.h"
#import "meView.h"
#define imageheight 120

@class meView;
@interface BackPagerViewController : UIViewController
{
    UINavigationItem *navtitle;
    UIBarButtonItem *leftButton;
    UIBarButtonItem *rightButton;
    UIImageView *uiimageview;
    UIScrollView * scrollview;
    AppDelegate *app;
}

@property (weak,nonatomic) meView *mview;
@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;
@property (weak, nonatomic) IBOutlet UIImageView *backimg;


@end
