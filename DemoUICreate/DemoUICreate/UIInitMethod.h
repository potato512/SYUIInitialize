//
//  UIInitMethod.h
//  DemoUIInit
//
//  Created by zhangshaoyu on 14-5-21.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//  功能描述：用于创建UI子类，避免重复编码，造成代码冗余

#import <Foundation/Foundation.h>

/// 自适应大小类型（宽高，或宽）
typedef enum
{
    /// 自适应宽
    AutoSizelabelHorizontal,
    
    /// 自适应宽高
    AutoSizelabelAll
}AutoSizelabelType;

@interface UIInitMethod : NSObject

/****************************************************************/

#pragma mark - 创建UI

#pragma mark UIAlertView
/// 实例化UIAlertView
UIAlertView *InsertAlert(UIAlertViewStyle style, NSString *title, NSString *message, NSInteger tag, id delegate, NSString *cancel, NSString *ok);

/// 实例化UIAlertView，带转动视图
UIAlertView *InsertAlertWithActivityIndicatior(NSString *message, NSInteger tag, id delegate);

/// 实例化UIAlertView，带输入框
UIAlertView *InsertAlertWithTextfield(NSString *title, NSString *cancel, NSString *ok, NSString *set, NSInteger tag, id delegate, SEL selector);

#pragma mark UIDatePicker
/// 实例化UIDatePicker
UIDatePicker *InsertDatePicker(UIView *view, NSInteger tag, id delegate, UIInterfaceOrientation orientation);

#pragma mark UIScrollView
/// 实例化UIScrollView
UIScrollView *InsertScrollView(UIView *superView, CGRect rect, int tag,id<UIScrollViewDelegate> delegate);

#pragma mark UILabel
/// 实例化UILabel，带自适应高度
UILabel *InsertLabel(UIView *superView, CGRect cRect, NSTextAlignment align, NSString *contentStr, UIFont *textFont, UIColor *textColor, BOOL resize);

/// 实例化UILabel，带阴影
UILabel *InsertLabelWithShadow(UIView *superView, CGRect cRect, NSTextAlignment align, NSString *contentStr, UIFont *textFont, UIColor *textColor, BOOL resize, BOOL shadow, UIColor *shadowColor, CGSize shadowOffset);

#pragma mark UIWebView
/// 实例化UIWebView
UIWebView *InsertWebView(UIView *superView,CGRect cRect, id<UIWebViewDelegate>delegate, int tag);

/// UIWebView使用
void WebSimpleLoadRequest(UIWebView *web, NSString *strURL);
void WebSimpleLoadRequestWithCookie(UIWebView *web, NSString *strURL, NSString *cookies);

#pragma mark UIbutton
/// 实例化UIbutton（带标题的圆角样式）
UIButton *InsertButtonRoundedRect(UIView *view, CGRect rc, int tag, NSString *title, id target, SEL action);

/// 实例化UIbutton（带图片的自定义样式）
UIButton *InsertImageButton(UIView *view, CGRect rc, int tag, UIImage *img, UIImage *imgH, id target, SEL action);

/// 实例化UIbutton（带图片及标题的自定义样式）
UIButton *InsertImageButtonWithTitle(UIView *view, CGRect rc, int tag, UIImage *img, UIImage *imgH, NSString *title, UIEdgeInsets edgeInsets, UIFont *font, UIColor *color, id target, SEL action);

/// 实例化UIbutton（带选中图片的自定义样式）
UIButton *InsertImageButtonWithSelectedImage(UIView *view, CGRect rc, int tag, UIImage *img, UIImage *imgH, UIImage *imgSelected, BOOL selected, id target, SEL action);

/// 实例化UIbutton（带选中图片及标题的自定义样式）
UIButton *InsertImageButtonWithSelectedImageAndTitle(UIView *view, CGRect rc, int tag, UIImage *img, UIImage *imgH, UIImage *imgSelected, BOOL selected, NSString *title, UIEdgeInsets edgeInsets, UIFont *font, UIColor *color, id target, SEL action);

/// 实例化UIbutton（自定义样式）
UIButton *InsertButtonWithType(UIView *view, CGRect rc, int tag, id target, SEL action, UIButtonType type);

#pragma mark UITableView
/// 实例化UITableView
UITableView *InsertTableView(UIView *superView, CGRect rect, id<UITableViewDataSource> dataSoure, id<UITableViewDelegate> delegate, UITableViewStyle style, UITableViewCellSeparatorStyle cellStyle);

#pragma mark UITextField
/// 实例化UITextField，未设置字体颜色
UITextField *InsertTextField(UIView *view, id delegate, CGRect rc, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment);

/// 实例化UITextField，设置字体颜色
UITextField *InsertTextFieldWithTextColor(UIView *view, id delegate, CGRect rc, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, UIColor *textFieldColor);

/// 实例化UITextField，带边框及圆角
UITextField *InsertTextFieldWithBorderAndCorRadius(UIView *view, id delegate, CGRect rc, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, float borderwidth, UIColor *bordercolor, UIColor *textFieldColor, float cornerRadius);

#pragma mark UITextView
/// 实例化UITextView，未设置字体颜色
UITextView *InsertTextView(UIView *view, id delegate, CGRect rc, UIFont *font, NSTextAlignment textAlignment);

/// 实例化UITextView，设置字体颜色
UITextView *InsertTextViewWithTextColor(UIView *view, id delegate, CGRect rc, UIFont *font, NSTextAlignment textAlignment, UIColor *textcolor);

/// 实例化UITextView，带边框及圆角
UITextView *InsertTextViewWithBorderAndCorRadius(UIView *view, id delegate, CGRect rc, UIFont *font, NSTextAlignment textAlignment, float borderwidth, UIColor *bordercolor, UIColor *textcolor, float cornerRadius);

#pragma mark UISwitch
/// 实例化UISwitch
UISwitch *InsertSwitch(UIView *view, CGRect rc);

#pragma mark UIImageView
/// 实例化UIImageView
UIImageView *InsertImageView(UIView *view, CGRect rect, UIImage *image);

#pragma mark UIView
/// 实例化UIView
UIView *InsertView(UIView *view, CGRect rect, UIColor *backColor);

/// 实例化UIView，带边框
UIView *InsertViewWithBorder(UIView *view, CGRect rect, UIColor *backColor, CGFloat borderwidth, UIColor *bordercolor);

/// 实例化UIView，带边框和圆角
UIView *InsertViewWithBorderAndCorRadius(UIView *view, CGRect rect, UIColor *backColor, CGFloat borderwidth, UIColor *bordercolor, CGFloat corRadius);

#pragma mark UIPickerView
/// 实例化UIPickerView
UIPickerView *InsertPickerView(UIView *view, CGRect rect);

#pragma mark UIBarButtonItem
UIBarButtonItem *InsertBarButtonItem(CGRect rect, int tag, UIImage *normalImage, UIImage *hightlightImage, NSString *titleBtn, UIFont *titleFont, UIColor *titleColor, id target, SEL action);

#pragma mark UIProgressView
UIProgressView *InsertProgressView(UIView *view, CGRect rect, UIProgressViewStyle style, CGFloat progressValue, UIColor *progressColor, UIColor *backColor);

#pragma mark UIActivityIndicatorView
UIActivityIndicatorView *InsertActivityIndicatorView(UIView *view, CGRect rect, UIColor *backColor, UIColor *styleColor, UIActivityIndicatorViewStyle style);

#pragma mark UIActionSheet
/// 两个按钮（取消与确定）
UIActionSheet *InsertActionSheet(UIView *view, id delegate, UIActionSheetStyle style, NSString *title, NSString *canael, NSString *confirm);

/// 四个按钮（取消与确定与其他）
UIActionSheet *InsertActionSheetWithTwoSelected(UIView *view, id delegate, UIActionSheetStyle style, NSString *title, NSString *canael, NSString *confirm, NSString *firstBtn, NSString *sectionBtn);

#pragma mark UISearchBar
/// 搜索视图
UISearchBar *InsertSearchBar(UIView *view, CGRect rect, id delegate, NSString *placeholder);

/// 搜索视图（可自定义样式）
UISearchBar *InsertSearchBarWithStyle(UIView *view, CGRect rect, id delegate, NSString *placeholder, UISearchBarStyle style, UIColor *tintColor, UIColor *barColor, UIImage *backImage);

#pragma mark UIPageControl
UIPageControl *InsertPageControl(UIView *view, CGRect rect, NSInteger pageCounts, NSInteger currentPage, UIColor *backColor, UIColor *pageColor, UIColor *currentPageColor);

#pragma mark UISlider
/// 创建UISlider
UISlider *insertSlider(UIView *view, CGRect rect, id target, SEL action);

/// 创建UISlider（自定义最大最小值）
UISlider *insertSliderWithValue(UIView *view, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue);

/// 创建UISlider（自定义最大最小值，及颜色显示）
UISlider *insertSliderWithValueAndColor(UIView *view, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor);

/// 创建UISlider（自定义最大最小值，及颜色，图标显示）
UISlider *insertSliderWithValueAndColorAndImage(id view, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor, UIImage *minImage, UIImage *maxImage);

#pragma mark UISegmentedControl
/// 创建UISegmentedControl
UISegmentedControl *insertSegment(UIView *view, NSArray *titleArray, CGRect rect, id target, SEL action);

/// 创建UISegmentedControl（设置颜色）
UISegmentedControl *insertSegmentWithColor(UIView *view, NSArray *titleArray, CGRect rect, id target, SEL action, UIColor *tintColor);

/// 创建UISegmentedControl（设置颜色及被始化被选择索引）
UISegmentedControl *insertSegmentWithSelectedIndexAndColor(UIView *view, NSArray *titleArray, CGRect rect, id target, SEL action, NSInteger selectedIndex, UIColor *tintColor);

#pragma mark UIImagePickerController
UIImagePickerController *InsertImagePicker(UIImagePickerControllerSourceType style, id delegate, UIImage *navImage);

/****************************************************************/

#pragma mark - 视图或视图控制器的操作
/// 视图上添加子视图控制器
void AddSubController(UIView *view, UIViewController *ctrl, BOOL animation);

/// 移除父视图控制器中的子视图控制器
void RemoveSubController(UIViewController *ctrl, BOOL animation);

/// 移除父视图中的子视图
void RemoveAllSubviews(UIView *view);

/****************************************************************/

#pragma mark - 设置时间定时器

/// 设置时间定时器
NSTimer *SetTimer(NSTimeInterval timeElapsed, id target, SEL selector);

/// 设置时间定时器，附带用户数据信息
NSTimer *SetTimerWithUserData(NSTimeInterval timeElapsed, id data, id target, SEL selector);

/// 停止时间定时器
void KillTimer(NSTimer *timer);

/****************************************************************/

#pragma mark - UI样式设置

// 设置view的边框属性
void ResetlayerWithView(UIView *view, CGFloat radius, UIColor *bordercolor, CGFloat borderwidth);

/// 设置自适应标签宽高
void ResetlabelAutoSize(UILabel *label, AutoSizelabelType autotype);

/****************************************************************/

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
