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
 14 iPhoneXsMax  6.5 1242*2688 414*896 @3x
 15 iPhoneXR     6.1 828*1792  414*896 @2x
 16 iPhone11     5.8 1125*2436 375*812 @3x
 17 iPhone11Pro  6.1 828*1792  414*896 @2x
 18 iPhone11ProMax 6.5 1242*2688 414*896 @3x
 */


#define SYUIAutoSizeScaleX (SYUIAutoSize.share.layoutScaleX)
#define SYUIAutoSizeScaleY (SYUIAutoSize.share.layoutScaleY)
//
#define SYUIFontAutoSize(size) [UIFont systemFontOfSize:(size * SYUIAutoSizeScaleX)]
#define SYUIFontBoldAutoSize(size) [UIFont boldSystemFontOfSize:(size * SYUIAutoSizeScaleX)]
#define SYUIFontNameAutoSize(name, size) [UIFont fontWithName:name size:(size * SYUIAutoSizeScaleX)]

////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////

CG_INLINE CGFloat
CGRectGetMinXAutoSize(CGFloat x) {
    CGFloat value = x * SYUIAutoSizeScaleX;
    return value;
}

CG_INLINE CGFloat
CGRectGetMinYAutoSize(CGFloat y) {
    CGFloat value = y * SYUIAutoSizeScaleY;
    return value;
}

CG_INLINE CGFloat
CGRectGetWidthAutoSize(CGFloat width) {
    CGFloat value = width * SYUIAutoSizeScaleX;
    return value;
}

CG_INLINE CGFloat
CGRectGetHeightAutoSize(CGFloat height) {
    CGFloat value = height * SYUIAutoSizeScaleY;
    return value;
}

CG_INLINE CGFloat
CGFloatAutoSize(CGFloat size) {
    CGFloat value = size * SYUIAutoSizeScaleX;
    return value;
}

CG_INLINE CGPoint
CGPointMakeAutoSize(CGFloat x, CGFloat y) {
    CGPoint value;
    value.x = x * SYUIAutoSizeScaleX;
    value.y = y * SYUIAutoSizeScaleY;
    return value;
}

CG_INLINE CGSize
CGSizeMakeAutoSize(CGFloat width, CGFloat height) {
    CGSize value;
    value.width = width * SYUIAutoSizeScaleX;
    value.height = height * SYUIAutoSizeScaleY;
    return value;
}

CG_INLINE CGRect
CGRectMakeAutoSize(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect value;
    value.origin.x = x * SYUIAutoSizeScaleX;
    value.origin.y = y * SYUIAutoSizeScaleY;
    value.size.width = width * SYUIAutoSizeScaleX;
    value.size.height = height * SYUIAutoSizeScaleY;
    return value;
}

/// 统一按照一个UI标准适配
CG_INLINE CGRect
CGRectMakeNew1(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {

    // 适配原则:宽、高均按照宽度比缩放
    CGRect rect;
    rect.origin.x = x * SYUIAutoSizeScaleX;
    rect.size.width = width * SYUIAutoSizeScaleX;
    rect.size.height = height * SYUIAutoSizeScaleX;
    rect.origin.y = y * SYUIAutoSizeScaleY + (SYUIAutoSizeScaleY - SYUIAutoSizeScaleX) * height * 0.5;
    return rect;
}

/// frame1:在5s/6/6p UI标准上的frame  frame2:在iPhoneX及以上设备UI标准上的frame
CG_INLINE CGRect
CGRectMakeNew2(CGRect frame1,CGRect frame2)
{
    CGFloat ScreenWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat ScreenHeight = UIScreen.mainScreen.bounds.size.height;

    if (ScreenHeight/ScreenWidth >2.0)  // iPhoneX, iPhoneXS, iPhoneXR, iPhoneXS Mas 11~
    {
        return CGRectMakeNew1(frame2.origin.x, frame2.origin.y, frame2.size.width, frame2.size.height);

    }else if (ScreenHeight/ScreenWidth >1.5)  // 5s/6/6p上的frame
    {
        return CGRectMakeNew1(frame1.origin.x, frame1.origin.y, frame1.size.width, frame1.size.height);
        
    }else if (ScreenHeight/ScreenWidth <1)  // 横屏
    {
    }
    return CGRectZero;
}

////////////////////////////////////////////////////////////////////////////////////

// iPhoneX, iPhoneXS, iPhoneXR, iPhoneXS Mas
#define kScreenHeightSafeArea [UIScreen mainScreen].bounds.size.height
#define kScreenWidthSafeArea  [UIScreen mainScreen].bounds.size.width
#define isSafeArea ((kScreenHeightSafeArea == 812.0f || kScreenHeightSafeArea == 896.0f) ? YES : NO)

///
#define kHeightCoefficientSafeArea (isSafeArea ? 667.0f / 667.0f : kScreenHeightSafeArea / 667.0f)

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
    rect.origin.x = x * SYUIAutoSizeScaleX;
    rect.origin.y = y * SYUIAutoSizeScaleY;
    rect.size.width = width * SYUIAutoSizeScaleX;
    rect.size.height = height;
    if (isTop) {
        // 顶端时
        rect.size.height = (hideNav ? (kHeightStatusSafeArea + height * SYUIAutoSizeScaleY) : height * SYUIAutoSizeScaleY);
    } else {
        // 底部时
        rect.origin.y = (hideTabBar ? (y - kHeightBottomSafeArea) : y);
        rect.size.height = (hideTabBar ? (kHeightBottomSafeArea + height * SYUIAutoSizeScaleY) : height * SYUIAutoSizeScaleY);
    }
    return rect;
}

////////////////////////////////////////////////////////////////////////////////////


#endif
