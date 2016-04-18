//
//  meView.m
//  SayBySelf
//
//  Created by 程嘉雯 on 15/10/19.
//  Copyright © 2015年 com.epoluodi. All rights reserved.
//

#import "meView.h"

@interface meView ()
{
    UITextField *text;
}
@end

@implementation meView
@synthesize tableview;
@synthesize headimgview;
@synthesize nickimg;
@synthesize nickname;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    app= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    nickname.text = app.nickname;
    // Do any additional setup after loading the view.
    nickimg.layer.cornerRadius = nickimg.frame.size.height/2;
    nickimg.layer.masksToBounds = YES;
    nickimg.layer.borderColor = [[UIColor whiteColor] CGColor];
    nickimg.layer.borderWidth = 1;

    nickimg.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicknickimage)];
    
    [nickimg addGestureRecognizer:singleTap1];
    nickimg.image = app.nickimg;
    
    headimgview .image = [UIImage imageNamed:[NSString stringWithFormat:@"setting_head_%d",app.nickbackimg]];
    tableview.delegate= self;
    tableview.dataSource= self;
    [tableview setBackgroundColor:[UIColor clearColor]];
  
}
-(void)clicknickimage
{
    
    UIAlertController * alert =[UIAlertController alertControllerWithTitle:@"选择头像" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                             {
                                 pickerview = [[UIImagePickerController alloc] init];//初始化
                                 pickerview.delegate = self;
                                 pickerview.allowsEditing = YES;//设置可编辑
                                 UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                                 pickerview.sourceType = sourceType;
                                 [self presentModalViewController:pickerview animated:YES];//进入照相界面
                             }];
    
    
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                            {
                                pickerview = [[UIImagePickerController alloc] init];//初始化
                                pickerview.delegate = self;
                                pickerview.allowsEditing = YES;//设置可编辑
                                UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                pickerview.sourceType = sourceType;
                                [self presentModalViewController:pickerview animated:YES];//进入照相界面
                            }];
    
    
    
    [alert addAction:camera];
    [alert addAction:photo];
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
  
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    app.nickimg = [info valueForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"SMILE!");
    nickimg.image = app.nickimg;
    
    NSFileManager *filemanger = [NSFileManager defaultManager];
    NSData *jpgdata = UIImageJPEGRepresentation(app.nickimg, 1);
    [filemanger createFileAtPath:[[FileCommon getCacheDirectory] stringByAppendingString:@"/nickimg.jpg"] contents:jpgdata attributes:nil];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *v=[[UIView alloc] init];
    return v;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
    cell.selectedBackgroundView = v;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1://电话
            
            [self showinputphone];
            
            break;
        case 2://背景
            
            [self performSegueWithIdentifier:@"showheadbackimg" sender:self];
            
            break;
    }
}

-(void)showinputphone
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"联系号码" message:@"请输入正确的号码" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
       UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           //保存
       }];
    
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    textField.placeholder = @"QQ\\微信\\手机号";
    text = textField;
//
//    
//    [textField setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.1 ]];
    textField.inputAccessoryView = [PublicCommon getInputToolbar:self sel:@selector(closeinputview)];
//    textField.textColor=[UIColor blackColor];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    textField.layer.borderWidth=1;
//    textField.layer.borderColor=[[[UIColor blackColor] colorWithAlphaComponent:0.5] CGColor];
//    textField.layer.cornerRadius = 4;

}];
  
        [self presentViewController:alert animated:YES completion:nil];
    
    
}

-(void)closeinputview
{
    [text resignFirstResponder];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell ;
    NSString *strtitle;
    switch (indexPath.row) {
        case 0:
       
            cell = [[UITableViewCell alloc] init];
            segmented = [[UISegmentedControl alloc] init];
            [segmented insertSegmentWithTitle:@"男" atIndex:0 animated:YES];
            [segmented insertSegmentWithTitle:@"女" atIndex:1 animated:YES];
            [segmented insertSegmentWithTitle:@"秘密" atIndex:2 animated:YES];
            segmented.selectedSegmentIndex=(int)app.setenum;
            segmented.frame = CGRectMake([PublicCommon GetALLScreen].size.width -140 -15, 10, 140 , 30);
            segmented.tintColor=[UIColor grayColor];
            [segmented addTarget:self action:@selector(segmentvaluechange) forControlEvents:UIControlEventValueChanged];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.contentView addSubview:segmented];
            cell.textLabel.text=@"性别设置";
            
            
            break;
        case 1:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"2"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//            strtitle =[NSString stringWithFormat:@"电话号码 - %@"]
        
            cell.textLabel.text=@"联系号码";
            cell.detailTextLabel.text = app.phone;
            
            break;
        case 2:
            cell = [[UITableViewCell alloc] init];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text=@"头像背景设置";
            break;
        case 3:
            cell = [[UITableViewCell alloc] init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            switchisenable = [[UISwitch alloc] init];
            switchisenable.on=app.IsOpen;
            switchisenable.frame =CGRectMake([PublicCommon GetALLScreen].size.width -switchisenable.frame.size.width -15, 10,
                switchisenable.frame.size.width, switchisenable.frame.size.height);
            [switchisenable addTarget:self action:@selector(switchchangeevent) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:switchisenable];
            cell.textLabel.text=@"免打扰";
            
            break;
        case 4:
            cell = [[UITableViewCell alloc] init];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text=@"自己说过的话";
            break;
        case 5:
            cell = [[UITableViewCell alloc] init];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text=@"分享APP";
            break;
        case 6:
            cell = [[UITableViewCell alloc] init];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text=@"关于";
            break;

    }
    return cell;
}



//打扰开关
-(void)switchchangeevent
{
    app.IsOpen = switchisenable.on;
    
}

//性别选择
-(void)segmentvaluechange
{
    switch (segmented.selectedSegmentIndex) {
        case 0:
            segmented.tintColor=[UIColor colorWithRed:0.094f green:0.694f blue:0.992f alpha:1.00f];
            break;
        case 1:
            segmented.tintColor=[UIColor colorWithRed:0.871f green:0.184f blue:0.608f alpha:1.00f];
            break;
        case 2:
            segmented.tintColor=[UIColor grayColor];
            break;
   
    }
}

//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

-(void)changeheadbackimg:(int)headindex
{
        headimgview .image = [UIImage imageNamed:[NSString stringWithFormat:@"setting_head_%d",headindex]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@",segue.identifier);
    if ([segue.identifier isEqualToString:@"showheadbackimg"])
    {
        BackPagerViewController *b = segue.destinationViewController;
        b.mview = self;
    }
}


@end
