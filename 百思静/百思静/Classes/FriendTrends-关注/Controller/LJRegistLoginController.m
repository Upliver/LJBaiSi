//
//  LJRegistLoginController.m
//  百思静
//
//  Created by 李学林 on 16/3/11.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LJRegistLoginController.h"

@interface LJRegistLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextField *secretField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBgLeadingConstraint;

@end

@implementation LJRegistLoginController

- (void)viewDidLoad {
    [super viewDidLoad];


}
- (IBAction)registOrLoginClick:(UIButton *)sender {
    
    if (self.loginBgLeadingConstraint.constant == 0) {
        
        self.loginBgLeadingConstraint.constant = - self.view.width;
        
        [sender setTitle:@"立即注册" forState:UIControlStateNormal];
        
    }else{
        self.loginBgLeadingConstraint.constant = 0;
        [sender setTitle:@"立即登录" forState:UIControlStateNormal];
    }
    
    
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}
- (IBAction)cancelClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
