//
//  UIViewController+tc_HideNavgationBar.h
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (tc_HideNavgationBar)


/**
 隐藏导航栏

 @param animated animated description
 */
-(void)hideNavigationBarWithAnimation:(BOOL)animated;


/**
 显示导航栏

 @param animated animated description
 */
-(void)showNavigationBarWithAnimation:(BOOL)animated;

@end
