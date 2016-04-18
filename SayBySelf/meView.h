//
//  meView.h
//  SayBySelf
//
//  Created by 程嘉雯 on 15/10/19.
//  Copyright © 2015年 com.epoluodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Common/FileCommon.h>
#import <Common/PublicCommon.h>
#import "publicinfo.h"
#import "AppDelegate.h"
#import "BackPagerViewController.h"

@interface meView : UIViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate>
{
    UIImagePickerController *pickerview;
    UISegmentedControl *segmented ;
    UISwitch * switchisenable;
    AppDelegate *app;

}

@property (weak, nonatomic) IBOutlet UIImageView *headimgview;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *nickimg;
@property (weak, nonatomic) IBOutlet UILabel *nickname;




-(void)changeheadbackimg:(int)headindex;



@end
