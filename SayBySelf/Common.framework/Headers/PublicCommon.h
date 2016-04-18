//
//  PublicCommon.h
//  Common
//
//  Created by 程嘉雯 on 15/8/8.
//  Copyright (c) 2015年 com.epoluodi.Common. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

///定义不同机型
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

struct Deviceinfo 
{
    __unsafe_unretained NSString * dname;
    __unsafe_unretained NSString * dmodel;
    
} ;



@interface PublicCommon : NSObject


+(CGRect)GetScreen;
+(CGRect)GetALLScreen;

+(struct Deviceinfo )DeviceName;

+(UIToolbar *)getInputToolbar:(id)sender sel:(SEL)sel;
+(UIImage *)imageFromView: (UIView *) theView atFrame:(CGRect)r;
+(UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

+(NSString *)getNow;
+(NSString *)getDateStringWithDT:(NSString *)strDT;
@end
