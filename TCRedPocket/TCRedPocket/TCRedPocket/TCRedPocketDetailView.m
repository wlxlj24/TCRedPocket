//
//  TCRedPocketDetailView.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketDetailView.h"
#import <Masonry.h>

@interface TCRedPocketDetailView ()

@property (nonatomic,assign) TCRedPocketDetailViewType type;

@property (nonatomic,strong) UIView *darkView;  //半透明黑色背景
@property (nonatomic,strong) UIView *contentView;   //中间的view
@property (nonatomic,strong) UIButton *closeBtn;    //关闭button

@property (nonatomic,strong) UIImageView *contentBackgroundIV;  //背景
@property (nonatomic,strong) UIView *contentTopView;        //红包详情顶部view
@property (nonatomic,strong) UIView *contentBottomView;     //红包详情底部view

@property (nonatomic,copy) TCParas0Callback becomeVIPBtnActionCallback;

@property (nonatomic,assign) CGPoint fromPoint;

@end

@implementation TCRedPocketDetailView

- (instancetype)initWithType:(TCRedPocketDetailViewType)type
{
    self = [super init];
    if (self) {
        self.type = type;
        [self setupView];
    }
    return self;
}


-(void)setupView{
    
    [self addSubview:self.darkView];
    [self addSubview:self.contentView];
    [self addSubview:self.closeBtn];
    
    [self.contentView addSubview:self.contentBackgroundIV];
    [self.contentView addSubview:self.contentTopView];
    [self.contentView addSubview:self.contentBottomView];
    
    [self.darkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(@364);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY).offset(-25);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@30);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(12);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [self.contentBackgroundIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    
    [self.contentTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(125);
        make.left.mas_equalTo(self.contentView.mas_left).offset(35);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-35);
        make.height.mas_equalTo(@90);
    }];
    
    [self.contentBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-29);
        make.top.mas_equalTo(self.contentTopView.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    switch (self.type) {
        case TCRedPocketDetailViewType_Success:{
            [self layoutSuccessType];
            break;
        }
        case TCRedPocketDetailViewType_NoTimes_VIP:{
            [self layoutNotimesVIP];
            break;
        }
        case TCRedPocketDetailViewType_NoTiems_NO_VIP:{
            [self layoutNotimesNOVIP];
            break;
        }
        
        default:
            break;
    }
    
}

//成功领取
-(void)layoutSuccessType{
    
    //顶部
    UILabel *topTopLbl = [UILabel new];
    topTopLbl.textAlignment = NSTextAlignmentLeft;
    topTopLbl.text = @"- 红包金额 -";
    topTopLbl.textColor = [UIColor colorWithRed:1 green:0.855 blue:0.267 alpha:1];
    topTopLbl.font = [UIFont systemFontOfSize:16];
    topTopLbl.numberOfLines = 0;
    [self.contentTopView addSubview:topTopLbl];
    [topTopLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentTopView.mas_top).offset(13);
        make.centerX.mas_equalTo(self.contentTopView.mas_centerX);
    }];
    
    UILabel *topBottomLbl = [UILabel new];
    topBottomLbl.text = @"7.69元";
    topBottomLbl.textColor = [UIColor colorWithRed:0.886 green:0.286 blue:0.275 alpha:1];
    topBottomLbl.textAlignment = NSTextAlignmentCenter;
    topBottomLbl.font = [UIFont systemFontOfSize:19];
    [self.contentTopView addSubview:topBottomLbl];
    [topBottomLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topTopLbl.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.contentTopView.mas_centerX);
    }];
    
    
    //底部
    UILabel *bottomTopLbl = [UILabel new];
    bottomTopLbl.text = @"恭喜抽到红包!";
    bottomTopLbl.textColor = [UIColor whiteColor];
    bottomTopLbl.font = [UIFont systemFontOfSize:20];
    [self.contentBottomView addSubview:bottomTopLbl];
    [bottomTopLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentBottomView.mas_top).offset(40);
        make.centerX.mas_equalTo(self.contentBottomView.mas_centerX);
    }];
    
    UILabel *bottomBottomLbl = [UILabel new];
    bottomBottomLbl.text = @"零钱已存入钱包";
    bottomBottomLbl.textColor = [UIColor colorWithRed:0.800 green:0.082 blue:0 alpha:1];
    bottomBottomLbl.font = [UIFont systemFontOfSize:11];
    [self.contentBottomView addSubview:bottomBottomLbl];
    [bottomBottomLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentBottomView.mas_bottom).offset(-8);
        make.centerX.mas_equalTo(self.contentBottomView.mas_centerX);
    }];
    
}

//次数已用完,VIP
-(void)layoutNotimesVIP{
    UILabel *topLbl = [UILabel new];
    topLbl.text = @"今日次数已用完";
    topLbl.font = [UIFont systemFontOfSize:19];
    topLbl.textColor = [UIColor colorWithRed:0.945 green:0.086 blue:0.122 alpha:1];
    topLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentTopView addSubview:topLbl];
    
    [topLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentTopView.mas_top).offset(25);
        make.left.mas_equalTo(self.contentTopView.mas_left);
        make.right.mas_equalTo(self.contentTopView.mas_right);
    }];
    
    
    UILabel *bottomLbl = [UILabel new];
    bottomLbl.text = @"请明天再来领取红包";
    bottomLbl.textColor = [UIColor whiteColor];
    bottomLbl.font = [UIFont systemFontOfSize:20];
    [self.contentBottomView addSubview:bottomLbl];
    [bottomLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentBottomView.mas_top).offset(40);
        make.centerX.mas_equalTo(self.contentBottomView.mas_centerX);
    }];
    
}

//次数已用完,非VIP
-(void)layoutNotimesNOVIP{
    UILabel *topLbl = [UILabel new];
    topLbl.text = @"今日次数已用完";
    topLbl.font = [UIFont systemFontOfSize:19];
    topLbl.textColor = [UIColor colorWithRed:0.945 green:0.086 blue:0.122 alpha:1];
    topLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentTopView addSubview:topLbl];
    
    [topLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentTopView.mas_top).offset(25);
        make.left.mas_equalTo(self.contentTopView.mas_left);
        make.right.mas_equalTo(self.contentTopView.mas_right);
    }];
    
    
    UILabel *bottomTopLbl = [UILabel new];
    bottomTopLbl.textAlignment = NSTextAlignmentCenter;
    bottomTopLbl.textColor = [UIColor whiteColor];
    bottomTopLbl.text = @"成为会员每日可";
    bottomTopLbl.font = [UIFont systemFontOfSize:16];
    [self.contentBottomView addSubview:bottomTopLbl];
    
    [bottomTopLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentBottomView.mas_top).offset(15);
        make.centerX.mas_equalTo(self.contentBottomView.mas_centerX);
    }];
    
    UILabel *bottomBottomLbl = [UILabel new];
    bottomBottomLbl.textAlignment = NSTextAlignmentCenter;
    bottomBottomLbl.textColor = [UIColor whiteColor];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"免费领取6次红包"];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1 green:0.855 blue:0.267 alpha:1] range:NSMakeRange(4,2)];
    [text addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(4,2)];
    bottomBottomLbl.attributedText = text;
    bottomBottomLbl.font = [UIFont systemFontOfSize:16];
    [self.contentBottomView addSubview:bottomBottomLbl];
    
    [bottomBottomLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomTopLbl.mas_bottom).offset(10);
        make.centerX.mas_equalTo(bottomTopLbl.mas_centerX);
    }];
    
    UIButton *bottomBtn = [UIButton new];
    bottomBtn.backgroundColor = [UIColor colorWithRed:1 green:0.855 blue:0.267 alpha:1];
    [bottomBtn setTitle:@"立即成为会员" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor colorWithRed:1 green:0.325 blue:0.247 alpha:1] forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [bottomBtn addTarget:self action:@selector(notimes_noVIP_bottomBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentBottomView addSubview:bottomBtn];
    
    [bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@110);
        make.height.mas_equalTo(@30);
        make.centerX.mas_equalTo(self.contentBottomView.mas_centerX);
        make.bottom.mas_equalTo(self.contentBottomView.mas_bottom).offset(-23);
    }];
    
}

#pragma mark Action
//立即成为VIP
-(void)notimes_noVIP_bottomBtnAction:(UIButton *)btn{
    self.becomeVIPBtnActionCallback();
}

//关闭button
-(void)closeBtnAction:(UIButton *)btn{
    //消失动画
    //1.frame size from 1 to 0
    //2.center point change
    self.contentView.alpha = 1.0;
    self.closeBtn.alpha = 1.0;
    self.darkView.alpha = 1.0;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = 0.0;
        self.closeBtn.alpha = 0.0;
        self.darkView.alpha = 0.0;
        self.contentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.contentView.center = self.fromPoint;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

#pragma mark Public Method
-(void)showWithPoint:(CGPoint)point{
    
    self.fromPoint = point;
    
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    //显示动画
    //1.frame size 从0到1
    //2.center point 变更
    self.contentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    self.contentView.center = point;
    self.contentView.alpha = 0.0;
    self.closeBtn.alpha = 0.0;
    self.darkView.alpha = 0.0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.transform = CGAffineTransformIdentity;
        self.contentView.center = CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0);
        
        self.closeBtn.alpha = 1.0f;
        self.darkView.alpha = 1.0f;
        self.contentView.alpha = 1.0f;
        
    } completion:^(BOOL finished) {

    }];
    
}

-(void)setupActionOfBecomeVIP:(TCParas0Callback)callback{
    self.becomeVIPBtnActionCallback = callback;
}


#pragma mark Getter

- (UIView *)darkView {
	if (_darkView == nil) {
        _darkView = [[UIView alloc] init];
        _darkView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
	}
	return _darkView;
}
- (UIView *)contentView {
	if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
	}
	return _contentView;
}
- (UIButton *)closeBtn {
	if (_closeBtn == nil) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:[UIImage imageNamed:@"RP_Close"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _closeBtn;
}


- (UIImageView *)contentBackgroundIV {
	if (_contentBackgroundIV == nil) {
        _contentBackgroundIV = [[UIImageView alloc] init];
        _contentBackgroundIV.image = [UIImage imageNamed:@"RP_Detail"];
	}
	return _contentBackgroundIV;
}


- (UIView *)contentTopView {
	if (_contentTopView == nil) {
        _contentTopView = [[UIView alloc] init];
	}
	return _contentTopView;
}
- (UIView *)contentBottomView {
	if (_contentBottomView == nil) {
        _contentBottomView = [[UIView alloc] init];
	}
	return _contentBottomView;
}

@end
