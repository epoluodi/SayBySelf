//
//  MapView.h
//  SayBySelf
//
//  Created by 程嘉雯 on 15/10/19.
//  Copyright © 2015年 com.epoluodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baidusdk.h"

@interface MapViewTab2 : UIViewController<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKLocationService *locservice;
}

@property (weak, nonatomic) IBOutlet BMKMapView *_mapview;

@end
