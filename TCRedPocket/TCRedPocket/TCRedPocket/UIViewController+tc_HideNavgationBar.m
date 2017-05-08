//
//  UIViewController+tc_HideNavgationBar.m
//  TCRedPocket
//
//  Created by TailC on 2017/5/8.
//  Copyright © 2017年 TCBeta. All rights reserved.
//

#import "UIViewController+tc_HideNavgationBar.h"

@implementation UIViewController (tc_HideNavgationBar)

-(void)hideNavigationBarWithAnimation:(BOOL)animated{
    if (!self.navigationController) {
        return;
    }
    [self.navigationController setNavigationBarHidden:true animated:animated];
    
}

-(void)showNavigationBarWithAnimation:(BOOL)animated{
    if (!self.navigationController) {
        return;
    }
    [self.navigationController setNavigationBarHidden:false animated:animated];
}


@end
