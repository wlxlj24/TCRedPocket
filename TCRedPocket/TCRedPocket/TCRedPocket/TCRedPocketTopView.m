//
//  TCRedPocketTopView.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketTopView.h"
#import <Masonry.h>

@interface TCRedPocketTopView ()

@property (nonatomic,strong) UILabel *moneyLbl;

@end

@implementation TCRedPocketTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}


-(void)setupViews{
    
    self.backgroundColor = [UIColor colorWithRed:0.882 green:0.271 blue:0.271 alpha:1];
    
    UIButton *leftNavBtn = [UIButton new];
    [leftNavBtn setImage:[UIImage imageNamed:@"RP_Back"] forState:UIControlStateNormal];
    [self addSubview:leftNavBtn];
    [leftNavBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(@30);
        make.left.mas_equalTo(self.mas_left).offset(8);
        make.top.mas_equalTo(self.mas_top).offset(26);
    }];
    
    UIImageView *bgIV = [UIImageView new];
    bgIV.image = [UIImage imageNamed:@"RP_TopBackground"];
    bgIV.contentMode = UIViewContentModeScaleAspectFill;
    bgIV.clipsToBounds = YES;
    [self addSubview:bgIV];
    CGFloat bgHeight = 135.0/375.0*[UIScreen mainScreen].bounds.size.width;
    [bgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(bgHeight);
        
    }];
    
    self.moneyLbl = [[UILabel alloc] init];
    self.moneyLbl.textAlignment = NSTextAlignmentCenter;
    self.moneyLbl.text = @"32.12元";
    self.moneyLbl.textColor = [UIColor whiteColor];
    self.moneyLbl.font = [UIFont systemFontOfSize:30];
    [self addSubview:self.moneyLbl];
    [self.moneyLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-12);
    }];
    
    UILabel *topLbl = [[UILabel alloc] init];
    topLbl.text = @"你已领取";
    topLbl.textColor = [UIColor colorWithRed:1 green:0.855 blue:0.267 alpha:1];
    topLbl.font = [UIFont systemFontOfSize:13];
    topLbl.numberOfLines = 0;
    [self addSubview:topLbl];
    [topLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.moneyLbl.mas_top).offset(4);
    }];
    
}



@end
