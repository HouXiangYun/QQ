//
//  LoginViewCtr.h
//  QQ
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 aa. All rights reserved.
//

#import "HXYMyViewController.h"

@interface LoginViewCtr : HXYMyViewController
@property (weak, nonatomic) IBOutlet UITextField *cNumLbl;
@property (weak, nonatomic) IBOutlet UITextField *pwdLbl;
- (IBAction)LoginBtn:(UIButton *)sender;

@end
