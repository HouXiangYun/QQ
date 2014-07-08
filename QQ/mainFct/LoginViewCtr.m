//
//  LoginViewCtr.m
//  QQ
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 aa. All rights reserved.
//

#import "LoginViewCtr.h"
#import "RegitViewCtr.h"
@interface LoginViewCtr ()<NSURLConnectionDataDelegate,UITextFieldDelegate>
{
    NSMutableData * serverData;
}
@end

@implementation LoginViewCtr

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
    NSLog(@"aa");
    [super viewDidLoad];
    self.title = @"登录";
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(regit)];
    self.navigationItem.rightBarButtonItems = @[item1];
}
-(void)regit
{
    RegitViewCtr * gitC = [[RegitViewCtr alloc]init];
    [self.navigationController pushViewController:gitC animated:YES];
}
-(IBAction)getLogin
{
    //拼接字符
   // NSString * cNumber = _cNumLbl.text;
  //  NSString * pwd = _pwdLbl.text;
    //1.url
    NSString * urlString = [NSString stringWithFormat:@"http://192.168.2.104:8080/gchat/login.htm"];
    NSURL * url = [NSURL URLWithString:urlString];
    //2.请求
    NSURLRequest * requst = [NSURLRequest requestWithURL:url];
    //3.连接
    NSURLConnection * connection = [NSURLConnection connectionWithRequest:requst delegate:self];
    //4.//开始连接
    [connection start];
}
- (IBAction)LoginBtn:(UIButton *)sender {
    //1.url
    NSURL * url = [NSURL URLWithString:@"http://192.168.2.154:8080/gchat/login.htm"];
    //2.建立请求
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:url];
    //3.连接
    NSURLConnection * connetion = [NSURLConnection connectionWithRequest:request delegate:self];
    //开始连接
    [connetion start];
    serverData = [[NSMutableData alloc]init];
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
    NSLog(@"返回的结果%@",result);
}
//错误处理
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error.localizedDescription);

}
@end
