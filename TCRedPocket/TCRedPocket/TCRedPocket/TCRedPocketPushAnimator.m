//
//  TCRedPocketPushAnimator.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/9.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketPushAnimator.h"
#import "TCDefine.h"

@implementation TCRedPocketPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    [containerView addSubview:fromView];
    
    //有渐变的黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = [UIColor clearColor];
    bgView.alpha = 0;
    [containerView addSubview:bgView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    //动画
    //1.从fromPoint center 到屏幕center
    //2.view从0到1
    CGPoint windowCenter = CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0);
    toView.center = self.fromPoint;
    toView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.center = windowCenter;
        
        toView.transform = CGAffineTransformIdentity;
        
        bgView.alpha = 1;
        
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        
        [fromView removeFromSuperview];
        [bgView removeFromSuperview];
        
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
    
}


@end
