//
//  ViewController.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "ViewController.h"
#import "TCRedPocketVC.h"
#import "TCDefine.h"
#import "TCRedPocketInteractiveAnimatedTransition.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *redpocketBtn;
@property (nonatomic,strong) TCRedPocketInteractiveAnimatedTransition *animatedTransition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.animatedTransition = nil;
    self.navigationController.delegate = nil;
    
    self.view.backgroundColor = [UIColor greenColor];
    
}

- (IBAction)pushToRedPocketVC:(id)sender {
    
    //1. 设置代理
    self.animatedTransition = nil;
    self.navigationController.delegate = self.animatedTransition;
    
    //2. 传入必要的参数
    self.animatedTransition.fromPoint = self.redpocketBtn.center;
    
    TCRedPocketVC *vc = [TCRedPocketVC new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (TCRedPocketInteractiveAnimatedTransition *)animatedTransition {
	if (_animatedTransition == nil) {
        _animatedTransition = [[TCRedPocketInteractiveAnimatedTransition alloc] init];
	}
	return _animatedTransition;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
