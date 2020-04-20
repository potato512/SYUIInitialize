//
//  SYUIInitMethod.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 14-5-21.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//  功能描述：用于创建UI子类，避免重复编码，造成代码冗余
//  https://github.com/potato512/SYUIInitialize

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 自适应大小类型（宽高，或宽）
typedef NS_ENUM(NSInteger, UIAutoSizelabelType) {
    /// 自适应宽
    UIAutoSizelabelHorizontal,
    /// 自适应宽高
    UIAutoSizelabelAll
};

#pragma mark - UI适配

/// 适配机型标准 iPhone4/5/6/6p/X/XR/XsMax/11/11Pro/11ProMax（默认iPhone6）
typedef NS_ENUM(NSInteger, UIAutoLayoutType) {
    /// 适配机型标准 4.7 iPhone6/6s/7/8 [750 * 1334]（默认iPhone6）
    UIAutoLayoutTypeiPhone6,
    /// 适配机型标准 3.5 iPhone4/4s [640 * 960]
    UIAutoLayoutTypeiPhone4,
    /// 适配机型标准 4.0 iPhone5/5S/5C/SE [640 * 1136]
    UIAutoLayoutTypeiPhone5,
    /// 适配机型标准 5.5 iPhone6P/6sP/7P/8P [1242 * 2208]
    UIAutoLayoutTypeiPhone6P,
    /// 适配机型标准 5.8 iPhoneX/Xs/11Pro [1125 * 2436]
    UIAutoLayoutTypeiPhoneX,
    /// 适配机型标准 6.1 iPhoneXR/11 [828 * 1792]
    UIAutoLayoutTypeiPhoneXR,
    /// 适配机型标准 6.5 iPhoneXsMax/11ProMax [1242 * 2688]
    UIAutoLayoutTypeiPhoneXsMax
};

/// 弹窗视图控制器回调
typedef void (^AlertControllerClick)(int index, NSString *title, NSArray *textFields);

/// 适配调用单例
#define UIAutoSize (SYUIAutoSize.share)

/****************************************************************/

@interface SYUIAutoSizeModel : NSObject

/// 类方法
+ (instancetype)autoSizeModelWith:(NSString *)name size:(CGSize)size inch:(CGFloat)inch;

/// 适配机型名称
@property (nonatomic, strong) NSString *typeName;
/// 适配机型大小
@property (nonatomic, assign) CGSize typeSize;
/// 适配机型尺寸
@property (nonatomic, assign) CGFloat typeInch;

/**
 示例：
 SYUIAutoSizeModel *model = [SYUIAutoSizeModel new];
 model.typeName = @"iPhoneXR";
 model.typeSize = CGSizeMake(414, 896);
 model.typeInch = 6.1;
 */

@end

@interface SYUIAutoSize : NSObject

+ (instancetype)share;

/// 是否自适配（默认YES，在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {} 初始化设置）
@property (nonatomic, assign) BOOL isAuto;
/// 适配机型标准 iPhone4/5/6/6p/X/XR/XsMax/11/11Pro/11ProMax（默认iPhone6，在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {} 初始化设置）
@property (nonatomic, assign) UIAutoLayoutType layoutType __attribute__((deprecated("Use defaultLayout instead.")));
/// 适配机型标准（默认iPhone6，4.7，[375 * 667]）
@property (nonatomic, strong) SYUIAutoSizeModel *defaultLayout;

/// 适配机型名称
@property (nonatomic, assign, readonly) NSString *layoutName;
/// 适配机型尺寸
@property (nonatomic, assign, readonly) CGFloat layoutInch;
/// 适配机型大小
@property (nonatomic, assign, readonly) CGSize layoutSize;
/// 适配机型比例X轴
@property (nonatomic, assign, readonly) CGFloat layoutWidth;
/// 适配机型比例Y轴
@property (nonatomic, assign, readonly) CGFloat layoutHeight;
/// 适配机型比例
@property (nonatomic, assign, readonly) CGPoint layoutScale;
/// 适配机型比例X轴
@property (nonatomic, assign, readonly) CGFloat layoutScaleX;
/// 适配机型比例Y轴
@property (nonatomic, assign, readonly) CGFloat layoutScaleY;

@end

/****************************************************************/

#pragma mark - UI实例化

@interface SYUIInitMethod : NSObject

#pragma mark - UIView

UIView *UIViewInitialize(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat borderwidth, UIColor *bordercolor, CGFloat corRadius);

UIView *UIViewInitializeWithBorder(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat borderWidth, UIColor *borderColor);

UIView *UIViewInitializeWithCorRadius(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat corRadius);

/// 设置view的边框属性
void UIViewReloadLayer(UIView *view, CGFloat radius, UIColor *bordercolor, CGFloat borderwidth);

#pragma mark - UILabel

UILabel *UILabelInitializeWithShadow(UIView *superView, CGRect rect, NSTextAlignment align, NSString *text, UIFont *textFont, UIColor *textColor, BOOL resize, BOOL shadow, UIColor *shadowColor, CGSize shadowOffset);

UILabel *UILabelInitialize(UIView *superView, CGRect rect, NSTextAlignment align, NSString *text, UIFont *textFont, UIColor *textColor, BOOL resize);

void UILabelReloadSize(UILabel *label, UIAutoSizelabelType autoType);

#pragma mark - UIImageView

UIImageView *UIImageViewInitialize(UIView *superview, CGRect rect, UIImage *image);

#pragma mark - UIProgressView

UIProgressView *UIProgressViewInitialize(UIView *superview, CGRect rect, UIProgressViewStyle style, CGFloat progressValue, UIColor *progressColor, UIColor *trackColor);

#pragma mark - UIActivityIndicatorView

UIActivityIndicatorView *UIActivityIndicatorViewInitialize(UIView *superview, CGRect rect, UIColor *bgroundColor, UIColor *styleColor, UIActivityIndicatorViewStyle style);

#pragma mark - UIPageControl

UIPageControl *UIPageControlInitialize(UIView *superview, CGRect rect, NSInteger pageCounts, NSInteger currentPage, UIColor *pageColor, UIColor *currentPageColor);

#pragma mark - UIAlertController

UIAlertController *UIAlertControllerInitialize(id target, UIAlertControllerStyle type, NSString *title, NSString *message, NSArray *textfiledsAction, NSArray *titlesAction, AlertControllerClick buttonClick);

#pragma mark - UIScrollView

UIScrollView *UIScrollViewInitialize(UIView *superView, CGRect rect, int tag, id<UIScrollViewDelegate> delegate);

#pragma mark - UITableView

UITableView *UITableViewInitialize(UIView *superView, CGRect rect, id<UITableViewDataSource> dataSoure, id<UITableViewDelegate> delegate, UITableViewStyle style, UITableViewCellSeparatorStyle cellStyle);

#pragma mark - UICollectionView

UICollectionView *UICollectionViewInitialize(UICollectionViewScrollDirection direction, UIView *superView, CGRect rect, id<UICollectionViewDelegate>delegate, id<UICollectionViewDataSource>dataSource, Class cellClass, Class headerViewClass, Class footerViewClass);

#pragma mark - UITextField

UITextField *UITextFieldInitialize(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, float borderwidth, UIColor *bordercolor, UIColor *textFieldColor, float cornerRadius, BOOL isSecureText, UIKeyboardType keyboardType, UIReturnKeyType returnkeyType);

UITextField *UITextFieldInitializeWithTextColor(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, UIColor *textFieldColor);

UITextField *UITextFieldInitializeWithBorderAndCorRadius(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, float borderWidth, UIColor *borderColor, UIColor *textFieldColor, float cornerRadius);

#pragma mark - UITextView

UITextView *UITextViewInitialize(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, float borderWidth, UIColor *borderColor, UIColor *textColor, float cornerRadius, UIKeyboardType keyboardType, UIReturnKeyType returnkeyType);

UITextView *UITextViewInitializeWithTextColor(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, UIColor *textColor);

UITextView *UITextViewInitializeWithBorderAndCorRadius(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, float borderWidth, UIColor *borderColor, UIColor *textColor, float cornerRadius);

#pragma mark - UISearchBar

/// 搜索视图
UISearchBar *UISearchBarInitialize(UIView *superview, CGRect rect, id delegate, NSString *placeholder, UISearchBarStyle style, UIColor *tintColor, UIColor *barColor, UIImage *bgroundImage);

#pragma mark - UIDatePicker

UIDatePicker *UIDatePickerInitialize(UIView *view, NSInteger tag);

#pragma mark - UIPickerView

UIPickerView *UIPickerViewInitialize(UIView *superview, CGRect rect);

#pragma mark - UIBarButtonItem

UIBarButtonItem *UIBarButtonItemInitializeWithTitle(NSString *title, int tag, UIBarButtonItemStyle style, id target, SEL action);

UIBarButtonItem *UIBarButtonItemInitializeWithImage(UIImage *image, int tag, UIBarButtonItemStyle style, id target, SEL action);

UIBarButtonItem *UIBarButtonItemInitializeWithButton(CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIFont *titleFont, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIEdgeInsets titleEdge, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

#pragma mark - UIbutton

UIButton *UIButtonInitialize(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIFont *titleFont, UIEdgeInsets titleEdge, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

UIButton *UIButtonInitializeWithTitle(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIFont *titleFont, id target, SEL action);

UIButton *UIButtonInitializeWithTitleAndImage(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIEdgeInsets titleEdge, UIFont *font, UIColor *colorNormal, UIColor *colorHighlight, UIColor *colorSelected, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, id target, SEL action);

UIButton *UIButtonInitializeWithTitleAndBgroundImage(UIView *superview, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIEdgeInsets titleEdge, UIFont *font, UIColor *colorNormal, UIColor *colorHighlight, UIColor *colorSelected, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

UIButton *UIButtonInitializeWithImageAndBgroundImage(UIView *superview, CGRect rect, int tag, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

UIButton *UIButtonInitializeWithBgroundImage(UIView *superview, CGRect rect, int tag, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

UIButton *UIButtonInitializeWithImage(UIView *superview, CGRect rect, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, BOOL selected, int tag, id target, SEL action);

#pragma mark - UISwitch

/// 创建UISwitch
UISwitch *UISwitchInitialize(UIView *superview, CGRect rect, id target, SEL action);

#pragma mark - UISlider

/// 创建UISlider
UISlider *UISliderInitialize(UIView *superview, CGRect rect, id target, SEL action);

/// 创建UISlider（自定义最大最小值）
UISlider *UISliderInitializeWithValue(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue);

/// 创建UISlider（自定义最大最小值，及颜色显示）
UISlider *UISliderInitializeWithValueAndColor(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor);

/// 创建UISlider（自定义最大最小值，及颜色，图标显示）
UISlider *UISliderInitializeWithValueAndColorAndImage(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor, UIImage *minImage, UIImage *maxImage);

#pragma mark - UISegmentedControl

/// 创建UISegmentedControl
UISegmentedControl *UISegmentedControlInitialize(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action);

/// 创建UISegmentedControl（设置颜色）
UISegmentedControl *UISegmentedControlInitializeWithColor(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action, UIColor *tintColor);

/// 创建UISegmentedControl（设置颜色及被始化被选择索引）
UISegmentedControl *UISegmentedControlWithSelectedIndexAndColor(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action, NSInteger selectedIndex, UIColor *tintColor);

#pragma mark - UIImagePickerController

/// 图片视图控制器
UIImagePickerController *UIImagePickerControllerInitialize(UIImagePickerControllerSourceType style, id delegate, UIImage *navImage);

#pragma mark - 父视图或父视图控制器的操作

/// 添加子控制器
void AddSubController(UIView *view, UIViewController *controller, BOOL animation);

/// 移除子控制器
void RemoveSubController(UIViewController *controller, BOOL animation);

/// 移除子视图
void RemoveAllSubviews(UIView *view);

/// 移除CALayer
void RemoveAllSublayers(UIView *view, Class class);

#pragma mark - 设置时间定时器

/// 初始化定时器
NSTimer *TimerInitialize(NSTimeInterval time, id userInfo, BOOL isRepeat, id target, SEL action);

/// 开始定时
void TimerStart(NSTimer *timer);

/// 停止定时
void TimerStop(NSTimer *timer);

/// 释放定时器
void TimerKill(NSTimer *timer);

@end

/*
 使用方法
 
 1 导入头文件
 #import "SYAutoSizeCGRect.h"
 
 2 初始化使用UI控件
 // 创建view
 UIView *view = UIViewInitialize(self.window, CGRectMake(10.0, 60.0, 60.0, 60.0), [UIColor orangeColor]);
 UIViewReloadLayer(view, 20.0, [UIColor greenColor], 5.0);
 
 // 创建带边框的view
 UIViewInitializeWithBorder(self.window, CGRectMake(30.0, 130.0, 60.0, 60.0), [UIColor greenColor], 0.5, [UIColor purpleColor]);
 
 // 创建带边框及圆角的view
 UIViewInitializeWithCorRadius(self.window, CGRectMake(60.0, 200.0, 60.0, 60.0), [UIColor brownColor], 1.2, [UIColor redColor], 10.0);
 
 */
