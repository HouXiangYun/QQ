//
//  RegitViewCtr.h
//  QQ
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 aa. All rights reserved.
//

#import "HXYMyViewController.h"

@interface RegitViewCtr : HXYMyViewController
@property (weak, nonatomic) IBOutlet UITextField *userTF;
@property (weak, nonatomic) IBOutlet UITextField *PwdTF;
@property (weak, nonatomic) IBOutlet UITextField *testPwdTF;
- (IBAction)regitBtn;

@end
