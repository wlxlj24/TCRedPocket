//
//  TCRedListView.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedListView.h"
#import <Masonry.h>


@interface TCRedListView ()

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong) NSMutableArray<UIView *> *redpocketViews;

@property (nonatomic,copy) TCParas2Callback cellBtnActionCallback;

@end

@implementation TCRedListView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    
    self.backgroundColor = [UIColor colorWithRed:0.800 green:0.224 blue:0.259 alpha:1];
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    for (int i = 0; i<3; i++) {
        [self layoutCellWithRow:i];
    }
    
    
}

-(void)layoutCellWithRow:(int)row{
    NSMutableArray<UIView *> *mArr2 = [NSMutableArray new];
    for (int i = row*3; i < 3*(row+1); i++) {
        UIView *view = [UIView new];
        [self.contentView addSubview:view];
        [self.redpocketViews addObject:view];
        [mArr2 addObject:view];
        view.backgroundColor = [UIColor whiteColor];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(view.mas_width).multipliedBy(230.0/220.0);
        }];
        
        UIButton *btn = [UIButton new];
        [btn setImage:[UIImage imageNamed:@"RP_UnOpen"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(redpocketBtnAciton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        btn.tag = i;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@72);
            make.width.mas_equalTo(@54);
            make.center.mas_equalTo(self.center);
        }];
        
    }
    
    [mArr2 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:1 tailSpacing:1];
    [mArr2 mas_makeConstraints:^(MASConstraintMaker *make) {
        if (row == 0){
            make.top.mas_equalTo(self.mas_top);
        }else if (row == 1){
            make.top.mas_equalTo(self.redpocketViews[0].mas_bottom).offset(1);
        }else if (row == 2){
            make.top.mas_equalTo(self.redpocketViews[3].mas_bottom).offset(1);
        }
        
        make.height.mas_equalTo(self.frame.size.height/3-2);
    }];
}

- (UIView *)contentView {
	if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
	}
	return _contentView;
}

//红包点击事件
-(void)redpocketBtnAciton:(UIButton *)btn{
    //动画效果 放大
    CGPoint point = [btn convertPoint:btn.center toView:[UIApplication sharedApplication].keyWindow];
    self.cellBtnActionCallback([NSString stringWithFormat:@"%ld",(long)btn.tag],NSStringFromCGPoint(point));
}

-(void)setupRedpocketCellBtnAction:(TCParas2Callback)callback{
    self.cellBtnActionCallback = callback;
}

- (NSMutableArray *)redpocketViews {
	if (_redpocketViews == nil) {
        _redpocketViews = [[NSMutableArray alloc] init];
	}
	return _redpocketViews;
}


@end
