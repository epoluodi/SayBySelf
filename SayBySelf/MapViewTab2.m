//
//  MapView.m
//  SayBySelf
//
//  Created by 程嘉雯 on 15/10/19.
//  Copyright © 2015年 com.epoluodi. All rights reserved.
//

#import "MapViewTab2.h"

@interface MapViewTab2 ()

@end

@implementation MapViewTab2
@synthesize _mapview;

-(void)viewWillAppear:(BOOL)animated
{
    [_mapview viewWillAppear];
    locservice.delegate = self;
    _mapview.delegate = self;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapview viewWillDisappear];
    locservice.delegate = nil;
    _mapview.delegate=nil;
}

-(void)willStartLocatingUser
{
    
}


-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [_mapview updateLocationData:userLocation];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    locservice = [[BMKLocationService alloc] init];
    [locservice startUserLocationService];
    _mapview.showsUserLocation= NO;
    _mapview.userTrackingMode = BMKUserTrackingModeFollow;
    _mapview.showsUserLocation=YES;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
