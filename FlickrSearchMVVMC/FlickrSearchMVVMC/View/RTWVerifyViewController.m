//
//  RTWVerifyViewController.m
//  FlickrSearchMVVMC
//
//  Created by niwanglong on 2018/5/9.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "RTWVerifyViewController.h"

@interface RTWVerifyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFileldSMS;
@property (weak, nonatomic) IBOutlet UIButton *btnComplete;

@end

@implementation RTWVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpSubviews];
    [self dataBind];
}

- (void)setUpSubviews{
    [self.btnComplete setBackgroundColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btnComplete setBackgroundColor:[UIColor grayColor] forState:UIControlStateDisabled];
    self.btnComplete.layer.cornerRadius = 20.0f;
    self.btnComplete.layer.masksToBounds = YES;
}

- (void)dataBind{
    RAC(self.viewModel,smsCode) = self.textFileldSMS.rac_textSignal;
    RAC(self.textFileldSMS,textColor) = RACObserve(self.viewModel, textColor);
    self.btnComplete.rac_command = self.viewModel.commandComplete;
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
