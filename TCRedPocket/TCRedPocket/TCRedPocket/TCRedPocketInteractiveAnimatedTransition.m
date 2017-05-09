//
//  TCRedPocketInteractiveAnimatedTransition.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/9.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "TCRedPocketInteractiveAnimatedTransition.h"
#import "TCRedPocketPushAnimator.h"
#import "TCRedPocketPopAnimator.h"

@interface TCRedPocketInteractiveAnimatedTransition ()

@property (nonatomic,strong) TCRedPocketPushAnimator *pushAnimator;
@property (nonatomic,strong) TCRedPocketPopAnimator *popAnimator;

@end

@implementation TCRedPocketInteractiveAnimatedTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimator;
        
    }else if (operation == UINavigationControllerOperationPop){
        return self.popAnimator;
    }
    return nil;
}



- (TCRedPocketPushAnimator *)pushAnimator {
	if (_pushAnimator == nil) {
        _pushAnimator = [[TCRedPocketPushAnimator alloc] init];
        _pushAnimator.fromPoint = self.fromPoint;
	}
	return _pushAnimator;
}
- (TCRedPocketPopAnimator *)popAnimator {
	if (_popAnimator == nil) {
        _popAnimator = [[TCRedPocketPopAnimator alloc] init];
        _popAnimator.fromPoint = self.fromPoint;
	}
	return _popAnimator;
}


@end
