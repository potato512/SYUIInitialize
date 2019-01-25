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

#import "SYAutoSizeCGRect.h"

/// 自适应大小类型（宽高，或宽）
typedef NS_ENUM(NSInteger, SYAutoSizelabelType) {
    /// 自适应宽
    SYAutoSizelabelHorizontal,
    
    /// 自适应宽高
    SYAutoSizelabelAll
};

/// 弹窗视图控制器回调
typedef void (^AlertControllerClick)(int indexButton, NSString *titleButton);

@interface SYUIInitMethod : NSObject

/****************************************************************/

#pragma mark - UIView

UIView *InsertView(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat borderwidth, UIColor *bordercolor, CGFloat corRadius);

UIView *InsertViewWithBorder(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat borderWidth, UIColor *borderColor);

UIView *InsertViewWithCorRadius(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat corRadius);

// 设置view的边框属性
void ViewReloadLayer(UIView *view, CGFloat radius, UIColor *bordercolor, CGFloat borderwidth);

#pragma mark - UILabel

UILabel *InsertLabelWithShadow(UIView *superView, CGRect rect, NSTextAlignment align, NSString *text, UIFont *textFont, UIColor *textColor, BOOL resize, BOOL shadow, UIColor *shadowColor, CGSize shadowOffset);

UILabel *InsertLabel(UIView *superView, CGRect rect, NSTextAlignment align, NSString *text, UIFont *textFont, UIColor *textColor, BOOL resize);

void LabelReloadSize(UILabel *label, SYAutoSizelabelType autoType);

#pragma mark - UIImageView

UIImageView *InsertImageView(UIView *superview, CGRect rect, UIImage *image);

#pragma mark - UIProgressView

UIProgressView *InsertProgressView(UIView *superview, CGRect rect, UIProgressViewStyle style, CGFloat progressValue, UIColor *progressColor, UIColor *trackColor);

#pragma mark - UIActivityIndicatorView

UIActivityIndicatorView *InsertActivityIndicatorView(UIView *superview, CGRect rect, UIColor *bgroundColor, UIColor *styleColor, UIActivityIndicatorViewStyle style);

#pragma mark - UIPageControl

UIPageControl *InsertPageControl(UIView *superview, CGRect rect, NSInteger pageCounts, NSInteger currentPage, UIColor *pageColor, UIColor *currentPageColor);

#pragma mark - UIAlertView

UIAlertView *InsertAlert(UIAlertViewStyle style, NSString *title, NSString *message, NSInteger tag, id delegate, NSString *cancel, NSString *ok);

UIAlertView *InsertAlertWithActivityIndicatior(NSString *message, NSInteger tag, id delegate, NSString *cancel);

UIAlertView *InsertAlertWithTextField(NSString *title, NSString *cancel, NSString *ok, NSString *set, NSInteger tag, id delegate, SEL selector);

#pragma mark - UIActionSheet

UIActionSheet *InsertActionSheetWithMoreButton(UIView *showView, id delegate, UIActionSheetStyle style, NSString *title, NSString *canael, NSString *destructive, NSString *titleFirst, NSString *titleSecond);

UIActionSheet *InsertActionSheet(UIView *showView, id delegate, UIActionSheetStyle style, NSString *title, NSString *canael, NSString *destructive);

#pragma mark - UIAlertController

UIAlertController *InsertAlertController(id target, UIAlertControllerStyle type, NSString *title, NSString *message, NSArray *titlesAction, AlertControllerClick buttonClick);

#pragma mark - UIScrollView

UIScrollView *InsertScrollView(UIView *superView, CGRect rect, int tag, id<UIScrollViewDelegate> delegate);

#pragma mark - UIWebView

UIWebView *InsertWebView(UIView *superView,CGRect rect, id<UIWebViewDelegate>delegate, int tag);

void WebViewRequest(UIWebView *web, NSString *strURL);

void WebViewRequestWithCookie(UIWebView *web, NSString *strURL, NSString *cookies);

#pragma mark - UITableView

UITableView *InsertTableView(UIView *superView, CGRect rect, id<UITableViewDataSource> dataSoure, id<UITableViewDelegate> delegate, UITableViewStyle style, UITableViewCellSeparatorStyle cellStyle);

#pragma mark - UICollectionView

UICollectionView *InsertCollectionView(UICollectionViewScrollDirection direction, UIView *superView, CGRect rect, id<UICollectionViewDelegate>delegate, id<UICollectionViewDataSource>dataSource, Class cellClass, Class headerViewClass, Class footerViewClass);

#pragma mark - UITextField

UITextField *InsertTextField(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, float borderwidth, UIColor *bordercolor, UIColor *textFieldColor, float cornerRadius, BOOL isSecureText, UIKeyboardType keyboardType, UIReturnKeyType returnkeyType);

UITextField *InsertTextFieldWithTextColor(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, UIColor *textFieldColor);

UITextField *InsertTextFieldWithBorderAndCorRadius(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, float borderWidth, UIColor *borderColor, UIColor *textFieldColor, float cornerRadius);

#pragma mark - UITextView

UITextView *InsertTextView(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, float borderWidth, UIColor *borderColor, UIColor *textColor, float cornerRadius, UIKeyboardType keyboardType, UIReturnKeyType returnkeyType);

UITextView *InsertTextViewWithTextColor(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, UIColor *textColor);

UITextView *InsertTextViewWithBorderAndCorRadius(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, float borderWidth, UIColor *borderColor, UIColor *textColor, float cornerRadius);

#pragma mark - UISearchBar

/// 搜索视图
UISearchBar *InsertSearchBar(UIView *superview, CGRect rect, id delegate, NSString *placeholder, UISearchBarStyle style, UIColor *tintColor, UIColor *barColor, UIImage *bgroundImage);

#pragma mark - UIDatePicker

UIDatePicker *InsertDatePicker(UIView *view, NSInteger tag, id delegate, UIInterfaceOrientation orientation);

#pragma mark - UIPickerView

UIPickerView *InsertPickerView(UIView *superview, CGRect rect);

#pragma mark - UIBarButtonItem

UIBarButtonItem *InsetBarButtonItemWithTitle(NSString *title, int tag, UIBarButtonItemStyle style, id target, SEL action);

UIBarButtonItem *InsetBarButtonItemWithImage(UIImage *image, int tag, UIBarButtonItemStyle style, id target, SEL action);

UIBarButtonItem *InsertBarButtonItemWithButton(CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIFont *titleFont, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIEdgeInsets titleEdge, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

#pragma mark - UIbutton

UIButton *InsertButton(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIFont *titleFont, UIEdgeInsets titleEdge, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

UIButton *InsertButtonWithTitle(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIFont *titleFont, id target, SEL action);

UIButton *InsertButtonWithTitleAndImage(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIEdgeInsets titleEdge, UIFont *font, UIColor *colorNormal, UIColor *colorHighlight, UIColor *colorSelected, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, id target, SEL action);

UIButton *InsertButtonWithTitleAndBgroundImage(UIView *superview, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIEdgeInsets titleEdge, UIFont *font, UIColor *colorNormal, UIColor *colorHighlight, UIColor *colorSelected, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

UIButton *InsertButtonWithBgroundImage(UIView *superview, CGRect rect, int tag, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action);

UIButton *InsertButtonWithImage(UIView *superview, CGRect rect, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, BOOL selected, int tag, id target, SEL action);

#pragma mark - UISwitch

UISwitch *InsertSwitch(UIView *superview, CGRect rect, id target, SEL action);

#pragma mark - UISlider

// 创建UISlider
UISlider *InsertSlider(UIView *superview, CGRect rect, id target, SEL action);

// 创建UISlider（自定义最大最小值）
UISlider *InsertSliderWithValue(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue);

// 创建UISlider（自定义最大最小值，及颜色显示）
UISlider *InsertSliderWithValueAndColor(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor);

// 创建UISlider（自定义最大最小值，及颜色，图标显示）
UISlider *InsertSliderWithValueAndColorAndImage(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor, UIImage *minImage, UIImage *maxImage);

#pragma mark - UISegmentedControl

// 创建UISegmentedControl
UISegmentedControl *InsertSegment(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action);

// 创建UISegmentedControl（设置颜色）
UISegmentedControl *InsertSegmentWithColor(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action, UIColor *tintColor);

// 创建UISegmentedControl（设置颜色及被始化被选择索引）
UISegmentedControl *InsertSegmentWithSelectedIndexAndColor(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action, NSInteger selectedIndex, UIColor *tintColor);

#pragma mark - UIImagePickerController

UIImagePickerController *InsertImagePicker(UIImagePickerControllerSourceType style, id delegate, UIImage *navImage);

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
NSTimer *InsetTimer(NSTimeInterval time, id userInfo, BOOL isRepeat, id target, SEL action);

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
 #import "UIInitMethod.h"
 
 2 初始化使用UI控件
 // 创建view
 UIView *view = InsertView(self.window, CGRectMake(10.0, 60.0, 60.0, 60.0), [UIColor orangeColor]);
 ResetlayerWithView(view, 20.0, [UIColor greenColor], 5.0);
 
 // 创建带边框的view
 InsertViewWithBorder(self.window, CGRectMake(30.0, 130.0, 60.0, 60.0), [UIColor greenColor], 0.5, [UIColor purpleColor]);
 
 // 创建带边框及圆角的view
 InsertViewWithBorderAndCorRadius(self.window, CGRectMake(60.0, 200.0, 60.0, 60.0), [UIColor brownColor], 1.2, [UIColor redColor], 10.0);
 
 */
