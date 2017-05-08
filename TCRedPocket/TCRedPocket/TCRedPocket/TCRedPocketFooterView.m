//
//  TCRedPocketFooterView.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketFooterView.h"
#import <Masonry.h>

@interface TCRedPocketFooterView ()

@end


@implementation TCRedPocketFooterView

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
    
    UIView *contentView = [UIView new];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    UILabel *leftLbl = [[UILabel alloc] init];
    leftLbl.textAlignment = NSTextAlignmentLeft;
    leftLbl.text = @"红包将存入";
    leftLbl.textColor = [UIColor whiteColor];
    leftLbl.font = [UIFont systemFontOfSize:13];
    leftLbl.backgroundColor = [UIColor clearColor];
    leftLbl.numberOfLines = 0;
    [contentView addSubview:leftLbl];
    [leftLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(contentView.mas_left);
        make.height.mas_equalTo(contentView.mas_height);
        make.top.mas_equalTo(contentView.mas_top);
    }];
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [centerBtn addTarget:self action:@selector(footerViewBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"我的钱包"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:strRange];
    [centerBtn setAttributedTitle:str forState:UIControlStateNormal];
    [centerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    centerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [contentView addSubview:centerBtn];
    [centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftLbl.mas_right);
        make.height.mas_equalTo(contentView.mas_height);
        make.top.mas_equalTo(contentView.mas_top);
    }];
    
    UILabel *rightLbl = [[UILabel alloc] init];
    rightLbl.textAlignment = NSTextAlignmentLeft;
    rightLbl.text = @",满30元可体现";
    rightLbl.textColor = [UIColor whiteColor];
    rightLbl.font = [UIFont systemFontOfSize:13];
    [contentView addSubview:rightLbl];
    [rightLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(centerBtn.mas_right);
        make.height.mas_equalTo(contentView.mas_height);
        make.right.mas_equalTo(contentView.mas_right);
        make.top.mas_equalTo(contentView.mas_top);
    }];
}

-(void)footerViewBtnAction:(UIButton *)btn{
    
}



@end
