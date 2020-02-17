//
//  SYAutoSizeCGRect.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 15/6/11.
//  Copyright (c) 2015年 zhangshaoyu. All rights reserved.
//  根据版本尺寸界面比例适配

#ifndef zhangshaoyu_AutoSizeCGRect_h
#define zhangshaoyu_AutoSizeCGRect_h

#import "SYUIInitMethod.h"

////////////////////////////////////////////////////////////////////////////////////

/*
 各版本尺寸
 01 iPhone4      3.5 640*960   320*480 @2x
 02 iPhone4S     3.5 640*960   320*480 @2x
 03 iPhone5      4.0 640*1136  320*568 @2x
 04 iPhone5S     4.0 640*1136  320*568 @2x
 05 iPhone5C     4.0 640*1136  320*568 @2x
 06 iPhone6      4.7 750*1334  375*667 @2x
 07 iPhone6Plus  5.5 1242*2208 414*736 @3x
 08 iPhone7      4.7 750*1334  375*667 @2x
 09 iPhone7Plus  5.5 1242*2208 414*736 @3x
 10 iPhone8      4.7 750*1334  375*667 @2x
 11 iPhone8Plus  5.5 1242*2208 414*736 @3x
 12 iPhoneX      5.8 1125*2436 375*812 @3x
 13 iPhoneXs     5.8 1125*2436 375*812 @3x
 14 iPhoneXs Max 6.5 1242*2688 414*896 @3x
 15 iPhoneXR     6.1 828*1792  414*896 @2x

 */


#define UIAutoSizeScaleX (SYUIInitMethod.shareUIInit.layoutScaleX)
#define UIAutoSizeScaleY (SYUIInitMethod.shareUIInit.layoutScaleY)

#define UIFontAutoSize(size) [UIFont systemFontOfSize:(size * UIAutoSizeScaleX)]
#define UIFontBoldAutoSize(size) [UIFont boldSystemFontOfSize:(size * UIAutoSizeScaleX)]
#define UIFontNameAutoSize(name, size) [UIFont fontWithName:name size:(size * UIAutoSizeScaleX)]

////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////

CG_INLINE CGFloat
CGRectGetMinXAutoSize(CGFloat x) {
    CGFloat value = x * UIAutoSizeScaleX;
    return value;
}

CG_INLINE CGFloat
CGRectGetMinYAutoSize(CGFloat y) {
    CGFloat value = y * UIAutoSizeScaleY;
    return value;
}

CG_INLINE CGFloat
CGRectGetWidthAutoSize(CGFloat width) {
    CGFloat value = width * UIAutoSizeScaleX;
    return value;
}

CG_INLINE CGFloat
CGRectGetHeightAutoSize(CGFloat height) {
    CGFloat value = height * UIAutoSizeScaleY;
    return value;
}

CG_INLINE CGFloat
CGFloatAutoSize(CGFloat size) {
    CGFloat value = size * UIAutoSizeScaleX;
    return value;
}

CG_INLINE CGPoint
CGPointMakeAutoSize(CGFloat x, CGFloat y) {
    CGPoint value;
    value.x = x * UIAutoSizeScaleX;
    value.y = y * UIAutoSizeScaleY;
    return value;
}

CG_INLINE CGSize
CGSizeMakeAutoSize(CGFloat width, CGFloat height) {
    CGSize value;
    value.width = width * UIAutoSizeScaleX;
    value.height = height * UIAutoSizeScaleY;
    return value;
}

CG_INLINE CGRect
CGRectMakeAutoSize(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect value;
    value.origin.x = x * UIAutoSizeScaleX;
    value.origin.y = y * UIAutoSizeScaleY;
    value.size.width = width * UIAutoSizeScaleX;
    value.size.height = height * UIAutoSizeScaleY;
    return value;
}

CG_INLINE CGRect
CGRectDidMakeAutoSize(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect value;
    value.origin.x = x;
    value.origin.y = y;
    value.size.width = width * UIAutoSizeScaleX;
    value.size.height = height * UIAutoSizeScaleY;
    return value;
}

CG_INLINE CGRect
CGRectShouldMakeAutoSize(CGFloat x, CGFloat y, CGFloat width, CGFloat height, BOOL autoW, BOOL autoH) {
    CGRect value;
    value.origin.x = x;
    value.origin.y = y;
    value.size.width = autoW ? width * UIAutoSizeScaleX : width;
    value.size.height = autoH ? height * UIAutoSizeScaleY : height;
    return value;
}

////////////////////////////////////////////////////////////////////////////////////

// iPhoneX, iPhoneXS, iPhoneXR, iPhoneXS Mas
#define kScreenHeightiPhoneSafeArea [UIScreen mainScreen].bounds.size.height
#define kScreenWidthiPhoneSafeArea  [UIScreen mainScreen].bounds.size.width
#define isSafeArea ((kScreenHeightiPhoneSafeArea == 812.0f || kScreenHeightiPhoneSafeArea == 896.0f) ? YES : NO)

///
#define kHeightCoefficientiPhoneSafeArea (isSafeArea ? 667.0f / 667.0f : kScreenHeightiPhoneSafeArea / 667.0f)

///
#define kHeightStatusSafeArea (isSafeArea ? 44.0f : 20.0f)
///
#define kHeightNavigationSafeArea (44.0f)
///
#define kHeightStatusNavigationSafeArea (kHeightStatusSafeArea + kHeightNavigationSafeArea)
///
#define kHeightBottomSafeArea (isSafeArea ? 34.0f : 0.0f)

CG_INLINE CGFloat
CGRectGetTopSafeArea(CGFloat y, BOOL hideNav) {
    CGFloat value = (hideNav ? (kHeightStatusSafeArea + y) : y);
    return value;
}

CG_INLINE CGFloat
CGRectGetBottomSafeArea(CGFloat y, BOOL hideNav) {
    CGFloat value = (hideNav ? (y - kHeightBottomSafeArea) : y);
    return value;
}

CG_INLINE CGFloat
CGRectGetHeightTopSafeArea(CGFloat height, BOOL hideNav) {
    CGFloat value = (hideNav ? (kHeightStatusSafeArea + height) : height);
    return value;
}

CG_INLINE CGFloat
CGRectGetHeightBottomSafeArea(CGFloat height, BOOL hideTabBar) {
    CGFloat value = (hideTabBar ? (kHeightBottomSafeArea + height) : height);
    return value;
}

/// iPhoneX适配
CG_INLINE CGRect
CGRectMakeSafeArea(CGFloat x, CGFloat y, CGFloat width, CGFloat height, BOOL hideNav, BOOL hideTabBar, BOOL isTop) {
    CGRect rect;
    rect.origin.x = x * UIAutoSizeScaleX;
    rect.origin.y = y * UIAutoSizeScaleY;
    rect.size.width = width * UIAutoSizeScaleX;
    rect.size.height = height;
    if (isTop) {
        // 顶端时
        rect.size.height = (hideNav ? (kHeightStatusSafeArea + height * UIAutoSizeScaleY) : height * UIAutoSizeScaleY);
    } else {
        // 底部时
        rect.origin.y = (hideTabBar ? (y - kHeightBottomSafeArea) : y);
        rect.size.height = (hideTabBar ? (kHeightBottomSafeArea + height * UIAutoSizeScaleY) : height * UIAutoSizeScaleY);
    }
    return rect;
}

////////////////////////////////////////////////////////////////////////////////////


#endif
