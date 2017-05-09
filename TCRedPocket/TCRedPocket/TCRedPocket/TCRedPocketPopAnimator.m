//
//  TCRedPocketPopAnimator.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/9.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketPopAnimator.h"

@implementation TCRedPocketPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    //有渐变的黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = [UIColor clearColor];
    bgView.alpha = 1;
    [containerView addSubview:bgView];
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    [containerView addSubview:fromView];
    
    
    //pop转场动画
    //1.frame size 从1到0
    //2.中心点变化
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        fromView.center = self.fromPoint;
        
        bgView.alpha = 0;
        
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        if (!wasCancelled) {
            [fromView removeFromSuperview];
        }
        [bgView removeFromSuperview];
        
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
        
    }];
    
}


@end
