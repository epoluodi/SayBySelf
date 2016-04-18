//
//  BackPagerViewController.m
//  DyingWish
//
//  Created by xiaoguang yang on 15/5/24.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "BackPagerViewController.h"

@interface BackPagerViewController ()
{
    int selectimage;
   
    UIButton *selectbtn;
}
@end

@implementation BackPagerViewController
@synthesize navbar;
@synthesize backimg;
@synthesize mview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    app = [[UIApplication sharedApplication] delegate];
    
    
    NSUserDefaults *userinfo = [NSUserDefaults standardUserDefaults];
    selectimage = app.nickbackimg -1;
    
    
    leftButton=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(leftbtn)];
    rightButton=[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(rightbtn)];
    
    rightButton.tintColor = [UIColor blackColor];

    leftButton.tintColor = [UIColor blackColor];
    
    navtitle = [[UINavigationItem alloc] initWithTitle:@"背景选择"];
    
    [navtitle setLeftBarButtonItem:leftButton];
    [navtitle setRightBarButtonItem:rightButton];
    navtitle.hidesBackButton=YES;
    
    [navbar pushNavigationItem:navtitle animated:YES];
    
   
    
    
    scrollview = [[UIScrollView alloc] init];
    
    CGRect newframe  = CGRectMake(0, 0,
                                  self.view.frame.size.width ,
                                  self.view.frame.size.height);
    scrollview.frame=   newframe;
    
    
    scrollview.pagingEnabled=NO;
    scrollview.bounces=YES;
    scrollview.scrollEnabled=YES;
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.alwaysBounceHorizontal=NO;
    backimg.userInteractionEnabled=YES;
    
    [backimg addSubview:scrollview];

    for (int i = 0; i<6; i++) {
        [self LoadBackPng:i];
    }

    
}


-(CGRect)getRectimage:(CGFloat)_y
{
    CGFloat x= [PublicCommon GetALLScreen].size.width/2 /2-20;
    CGFloat y = 30 +_y ;
    
    CGFloat width =[PublicCommon GetALLScreen].size.width/2  +40;
    CGFloat height = imageheight; //width *1.3;
    
    CGRect rect = CGRectMake(x, y, width, height);
    
    return rect;
}


-(void)LoadBackPng:(int)index
{
    UIImageView * imageviwe = [[UIImageView alloc] init];
    imageviwe.frame =[self getRectimage:(index * imageheight + (index > 0 ? index * 30 : 0) )];
    NSString *imagename = [NSString stringWithFormat:@"setting_head_%d",index+1];
    imageviwe.image = [UIImage imageNamed:imagename];
    imageviwe.userInteractionEnabled=YES;
    imageviwe.layer.shadowOffset = CGSizeMake(8, 6);
    imageviwe.layer.shadowColor =[[UIColor grayColor]CGColor];
    imageviwe.layer.shadowRadius =5;
    imageviwe.layer.shadowOpacity =0.8f;
    

    UIButton *btn = [[UIButton  alloc] init];
    btn.frame =CGRectMake(0, 0, imageviwe.frame.size.width-1, imageviwe.frame.size.height-1);
    btn.layer.borderWidth=3;
    if (selectimage ==index){
        btn.layer.borderColor = [[UIColor blueColor]CGColor];
        selectbtn = btn;
    }
    else
        btn.layer.borderColor = [[UIColor clearColor]CGColor];
    [imageviwe addSubview:btn];
    btn.tag = index;
    [btn addTarget:self action:@selector(imageselect:) forControlEvents:UIControlEventTouchUpInside];
  
    scrollview.contentSize = CGSizeMake(0, (index+1) * imageheight + (index > 0 ? index * 30 : 0)  + imageheight);
    [scrollview addSubview:imageviwe];
    

    
}


-(void)animationbtn:(CALayer *)layer
{
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:.5];
    opacityAnimation.toValue = [NSNumber numberWithFloat:1];
    
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.05];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 0.5f;

    [animationGroup setAnimations:[NSArray arrayWithObjects:scaleAnimation, opacityAnimation, nil]];
    animationGroup.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
   
    [layer addAnimation:animationGroup forKey:nil];

}


-(void)imageselect:(UIButton *)sender
{
    
    selectbtn.layer.borderColor = [[UIColor clearColor]CGColor];
    selectimage = (int)sender.tag;
    NSLog(@"%d",(int)sender.tag);
    sender.layer.borderColor = [[UIColor blueColor] CGColor];
    selectbtn = sender;
    [self animationbtn:sender.layer];
    
    
}


-(void)rightbtn
{
    NSUserDefaults *userinfo = [NSUserDefaults standardUserDefaults];
    [userinfo setInteger:selectimage+1 forKey:@"nickbackimg"];
    
    [mview changeheadbackimg:selectimage+1];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)leftbtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
