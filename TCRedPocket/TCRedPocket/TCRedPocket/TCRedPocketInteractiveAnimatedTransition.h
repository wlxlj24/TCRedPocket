//
//  TCRedPocketInteractiveAnimatedTransition.h
//  TCRedPocket
//
//  Created by TailC on 2017/5/9.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TCRedPocketInteractiveAnimatedTransition : NSObject<UINavigationControllerDelegate>

@property (nonatomic,assign) CGPoint fromPoint;   //开始动画时,view的中心点

@end
