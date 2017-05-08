//
//  TCRedPocketVC.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketVC.h"
#import "UIViewController+tc_HideNavgationBar.h"

@interface TCRedPocketVC ()

@end

@implementation TCRedPocketVC

#pragma mark - Life Cycle
-(void)dealloc{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hideNavigationBarWithAnimation:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self showNavigationBarWithAnimation:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init
-(void)setupData{
    
}

-(void)setupView{
    
}

#pragma mark - Network Request

#pragma mark - UITableViewDelegate

#pragma mark - CustomDelegate

#pragma mark - Event Response

#pragma mark - Private Methods

#pragma mark - Public Methods

#pragma mark - Getters And Setters


@end
