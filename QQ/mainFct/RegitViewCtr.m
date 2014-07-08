//
//  RegitViewCtr.m
//  QQ
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 aa. All rights reserved.
//

#import "RegitViewCtr.h"

@interface RegitViewCtr ()<NSURLConnectionDataDelegate,UITextFieldDelegate>
{
    NSMutableData * serverData;
}
@end

@implementation RegitViewCtr

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//文本框处理
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField==_userTF)
    {
        [_PwdTF becomeFirstResponder];
    }
    else if(textField == _PwdTF)
    {
        [_testPwdTF becomeFirstResponder];
    }
    else if(textField == _testPwdTF)
    {
        [self regitBtn];
    }
    return YES;
}
//注册
- (IBAction)regitBtn{
    
}
#pragma mark 网络代理
//服务器开始响应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    
}
//接收数据,拼接数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [serverData appendData:data];
}
//处理数据,将数据转换成字符显示
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString * result = [[NSString alloc]initWithData:serverData encoding:NSUTF8StringEncoding];
    //释放内存
    serverData = nil;
    NSLog(@"aaa");
}
//错误处理
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error.localizedDescription);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
