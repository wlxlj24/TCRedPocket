//
//  TCRedPocketVC.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketVC.h"
#import "UIViewController+tc_HideNavgationBar.h"
#import <Masonry.h>
#import "TCRedListView.h"
#import "TCRedPocketDetailView.h"
#import "TCRedPocketFooterView.h"
#import "TCRedPocketTopView.h"
#import "TXScrollLabelView.h"

@interface TCRedPocketVC ()

@property (nonatomic,strong) TCRedPocketTopView *topView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) TCRedPocketFooterView *footerView;

@property (nonatomic,strong) TCRedListView *redListView;
@property (nonatomic,strong) TCRedPocketDetailView *rpDetailView;
@property (nonatomic,strong) TXScrollLabelView *scollLabelView;

@end

@implementation TCRedPocketVC

#pragma mark - Life Cycle
-(void)dealloc{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupView];
    [self setupActions];
    
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
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.footerView];
    
    [self.contentView addSubview:self.redListView];
    [self.contentView addSubview:self.scollLabelView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.height.mas_equalTo(self.topView.mas_width).multipliedBy(0.55);
        
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.footerView.mas_top);
    }];
    
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(self.footerView.mas_width).multipliedBy(0.12);
    }];
    
    [self.redListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(13);
        make.top.mas_equalTo(self.contentView.mas_top).offset(1);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-13);
        make.height.mas_equalTo(self.contentView.mas_width).multipliedBy(345.0/351.0);
    }];
    
    [self.scollLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.redListView.mas_bottom);
        make.left.mas_equalTo(self.redListView.mas_left);
        make.right.mas_equalTo(self.redListView.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
}

#pragma mark - Network Request

#pragma mark - Actions
-(void)setupActions{
    @weakify(self);
    [self.redListView setupRedpocketCellBtnAction:^(NSString *index, NSString *centerPoint) {
        CGPoint point = CGPointFromString(centerPoint);
        [weak_self showRedpocketDetailViewWithCenter:point];
        
    }];
}

-(void)showRedpocketDetailViewWithCenter:(CGPoint)center{
    TCRedPocketDetailView *redpocket = [[TCRedPocketDetailView alloc] initWithType:random()%3];
    [redpocket showWithPoint:center];
    
    [redpocket setupActionOfBecomeVIP:^{
        //跳转到充值VIP页面
        
    }];
}

#pragma mark - Private Methods

#pragma mark - Public Methods

#pragma mark - Getters And Setters
-(TCRedPocketTopView *)topView{
    if (!_topView) {
        _topView = [TCRedPocketTopView new];
        
    }
    return _topView;
}

-(UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor colorWithRed:0.882 green:0.271 blue:0.271 alpha:1];
    }
    return _contentView;
}

-(TCRedPocketFooterView *)footerView{
    if (!_footerView) {
        _footerView = [TCRedPocketFooterView new];
    }
    return _footerView;
}

-(TCRedListView *)redListView{
    if (!_redListView) {
        _redListView = [TCRedListView new];
    }
    return _redListView;
}


- (TCRedPocketDetailView *)rpDetailView {
	if (_rpDetailView == nil) {
        _rpDetailView = [[TCRedPocketDetailView alloc] init];
	}
	return _rpDetailView;
}


- (TXScrollLabelView *)scollLabelView {
	if (_scollLabelView == nil) {
        NSArray *scrollTexts = @[@"[女王大人] 领取了2.78元 \n [女王大对对对人] 领取了2.78元 \n [女王大重中之重人] 领取了2.78元",];
        _scollLabelView = [TXScrollLabelView scrollWithTextArray:scrollTexts type:TXScrollLabelViewTypeUpDown velocity:2 options:UIViewAnimationOptionCurveEaseInOut inset:UIEdgeInsetsZero];
        _scollLabelView.backgroundColor = [UIColor colorWithRed:0.800 green:0.224 blue:0.259 alpha:1];
        _scollLabelView.tx_centerX  = [UIScreen mainScreen].bounds.size.width * 0.5;
        _scollLabelView.scrollInset = UIEdgeInsetsMake(0, 10 , 0, 10);
        _scollLabelView.scrollSpace = 10;
        _scollLabelView.font = [UIFont systemFontOfSize:15];
        _scollLabelView.textAlignment = NSTextAlignmentLeft;
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width-26;
        CGFloat height = [UIScreen mainScreen].bounds.size.height - width * 0.55  - width * 345.0/351.0 - width * 0.12;
        CGFloat yy = width * 345.0/351.0;
        
        _scollLabelView.frame = CGRectMake(0, yy, width, height);
        [_scollLabelView beginScrolling];
        
	}
	return _scollLabelView;
}

- (void)scrollLabelView:(TXScrollLabelView *)scrollLabelView didClickWithText:(NSString *)text atIndex:(NSInteger)index{
    NSLog(@"%@--%ld",text, index);
}


@end
