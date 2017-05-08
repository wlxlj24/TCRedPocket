//
//  TCRedPocketDetailView.h
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCDefine.h"

typedef NS_ENUM(NSUInteger, TCRedPocketDetailViewType) {
    TCRedPocketDetailViewType_Success,              //抽到红包
    TCRedPocketDetailViewType_NoTimes_VIP,          //次数使用完,VIP
    TCRedPocketDetailViewType_NoTiems_NO_VIP,       //次数使用完,不是VIP
};

@interface TCRedPocketDetailView : UIView

- (instancetype)initWithType:(TCRedPocketDetailViewType)type;
-(void)showWithPoint:(CGPoint)point;
-(void)setupActionOfBecomeVIP:(TCParas0Callback)callback;

@end
