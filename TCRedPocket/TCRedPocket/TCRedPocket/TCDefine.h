//
//  TCDefine.h
//  ymd
//
//  Created by TailC on 16/7/22.
//  Copyright © 2016年 iDreamNet. All rights reserved.
//

#ifndef TCDefine_h
#define TCDefine_h

typedef void(^TCParas0Callback)(void);
typedef void(^TCParas1Callback)(id para);
typedef void(^TCParas2Callback)(id para, id para2);
typedef void(^TCParas3Callback)(id para, id para2, id para3);
typedef void(^TCParas4Callback)(id para, id para2, id para3, id para4);

#define kNavigationBarHeight 64
#define kStateBarHeight 20
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kIphone6Width 375
#define kIphone6Height 667

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#endif /* TCDefine_h */
