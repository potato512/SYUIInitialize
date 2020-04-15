//
//  SYUIInitMethod.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 14-5-21.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import "SYUIInitMethod.h"

#pragma mark - UI适配

#define kScreenWidth  ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

static NSString *const kScaleX = @"scaleX";
static NSString *const kScaleY = @"scaleY";


/****************************************************************/

@implementation SYUIAutoSizeModel

+ (instancetype)autoSizeModelWith:(NSString *)name size:(CGSize)size inch:(CGFloat)inch
{
    SYUIAutoSizeModel *model = [[SYUIAutoSizeModel alloc] init];
    model.typeName = name;
    model.typeSize = size;
    model.typeInch = inch;
    return model;
}

@end

@interface SYUIAutoSize ()

@property (nonatomic, strong) NSDictionary *scaleDict;

@end

@implementation SYUIAutoSize

+ (instancetype)share
{
    static SYUIAutoSize *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isAuto = YES;
        // 默认iPhone6
        SYUIAutoSizeModel *model = [SYUIAutoSizeModel autoSizeModelWith:@"iPhone 6" size:CGSizeMake(375, 667) inch:4.7];
        self.defaultLayout = model;
    }
    return self;
}

- (NSString *)layoutName
{
    if (self.defaultLayout) {
        return self.defaultLayout.typeName;
    }
    //
    NSString *result = @"iPhone 6";
    if (self.layoutType == UIAutoLayoutTypeiPhone4) {
        result = @"iPhone 4";
    } else if (self.layoutType == UIAutoLayoutTypeiPhone5) {
        result = @"iPhone 5";
    } else if (self.layoutType == UIAutoLayoutTypeiPhone6) {
        result = @"iPhone 6";
    } else if (self.layoutType == UIAutoLayoutTypeiPhone6P) {
        result = @"iPhone 6Plus";
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneX) {
        result = @"iPhone X";
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneXR) {
        result = @"iPhone XR";
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneXsMax) {
        result = @"iPhone Xs Max";
    }
    return result;
}

- (CGFloat)layoutInch
{
    if (self.defaultLayout) {
        return self.defaultLayout.typeInch;
    }
    //
    CGFloat result = 4.7;
    if (self.layoutType == UIAutoLayoutTypeiPhone4) {
        result = 3.5;
    } else if (self.layoutType == UIAutoLayoutTypeiPhone5) {
        result = 4.0;
    } else if (self.layoutType == UIAutoLayoutTypeiPhone6) {
        result = 4.7;
    } else if (self.layoutType == UIAutoLayoutTypeiPhone6P) {
        result = 5.5;
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneX) {
        result = 5.8;
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneXR) {
        result = 6.1;
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneXsMax) {
        result = 6.5;
    }
    return result;
}

- (CGSize)layoutSize
{
    if (self.defaultLayout) {
        return self.defaultLayout.typeSize;
    }
    //
    CGSize result = CGSizeMake(375, 667);
    if (self.layoutType == UIAutoLayoutTypeiPhone4) {
        result = CGSizeMake(320, 480);
    } else if (self.layoutType == UIAutoLayoutTypeiPhone5) {
        result = CGSizeMake(320, 568);
    } else if (self.layoutType == UIAutoLayoutTypeiPhone6) {
        result = CGSizeMake(375, 667);
    } else if (self.layoutType == UIAutoLayoutTypeiPhone6P) {
        result = CGSizeMake(414, 736);
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneX) {
        result = CGSizeMake(375, 812);
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneXR) {
        result = CGSizeMake(414, 896);
    } else if (self.layoutType == UIAutoLayoutTypeiPhoneXsMax) {
        result = CGSizeMake(414, 896);
    }
    return result;
}

- (CGFloat)layoutWidth
{
    CGFloat value = self.layoutSize.width;
    return value;
}

- (CGFloat)layoutHeight
{
    CGFloat value = self.layoutSize.height;
    return value;
}

- (CGPoint)layoutScale
{
    CGPoint point = CGPointMake(self.layoutScaleX, self.layoutScaleY);
    return point;
}

- (CGFloat)layoutScaleX
{
    NSNumber *number = self.scaleDict[kScaleX];
    CGFloat scale = number.doubleValue;;
    return scale;
}

- (CGFloat)layoutScaleY
{
    NSNumber *number = self.scaleDict[kScaleY];
    CGFloat scale = number.doubleValue;
    return scale;
}

//
- (NSDictionary *)scaleDict
{
    if (_scaleDict == nil) {
        _scaleDict = @{kScaleX:@(1.0), kScaleY:@(1.0)};
        if (self.isAuto) {
            _scaleDict = @{kScaleX:@((self.layoutSize.width == kScreenWidth ? 1.0 : kScreenWidth / self.layoutSize.width)), kScaleY:@((self.layoutSize.height == kScreenHeight ? 1.0 : kScreenHeight / self.layoutSize.height))};
        }
    }
    return _scaleDict;
}

@end

/****************************************************************/

#pragma mark - UI实例化

@implementation SYUIInitMethod

#pragma mark - UIView

UIView *UIViewInitialize(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat borderwidth, UIColor *bordercolor, CGFloat corRadius)
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = bgroundColor;
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:view];
    }

    if (bordercolor && 0.0 < borderwidth) {
        view.layer.borderWidth = borderwidth;
        view.layer.borderColor = bordercolor.CGColor;
    }

    if (0.0 < corRadius) {
        view.layer.cornerRadius = corRadius;
        view.layer.masksToBounds = YES;
        view.clipsToBounds = YES;
    }
    
    return view;
}

UIView *UIViewInitializeWithBorder(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat borderWidth, UIColor *borderColor)
{
    return UIViewInitialize(superview, rect, bgroundColor, borderWidth, borderColor, 0.0);
}

UIView *UIViewInitializeWithCorRadius(UIView *superview, CGRect rect, UIColor *bgroundColor, CGFloat corRadius)
{
    return UIViewInitialize(superview, rect, bgroundColor, 0.0, nil, corRadius);
}

// 设置view的边框属性
void UIViewReloadLayer(UIView *view, CGFloat radius, UIColor *bordercolor, CGFloat borderwidth)
{
    if (view && [view isKindOfClass:[UIView class]]) {
        if (radius > 0.0) {
            view.layer.cornerRadius = radius;
            view.clipsToBounds = YES;
            view.layer.masksToBounds = YES;
        }
        
        if (bordercolor && borderwidth > 0.0) {
            view.layer.borderColor = bordercolor.CGColor;
            view.layer.borderWidth = borderwidth;
        }
    }
}

#pragma mark - UILabel

static CGFloat sizeSpace = 10.0;
UILabel *UILabelInitializeWithShadow(UIView *superView, CGRect rect, NSTextAlignment align, NSString *text, UIFont *textFont, UIColor *textColor, BOOL resize, BOOL shadow, UIColor *shadowColor, CGSize shadowOffset)
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = align;
    label.textColor = textColor;
    label.font = textFont;
    label.text = text;
    label.numberOfLines = 1;
    
    if (superView && [superView respondsToSelector:@selector(addSubview:)]) {
        [superView addSubview:label];
    }
    
    // 自适应大小
    if (resize && nil != text) {
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        
        CGSize size = CGSizeMake(rect.size.width, MAXFLOAT);
        CGSize labelsize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:textFont} context:nil].size;
        
        label.frame = CGRectMake(rect.origin.x, rect.origin.y, labelsize.width + sizeSpace, labelsize.height + sizeSpace);
    }
    
    if (shadow) {
        if (shadowColor) {
            label.shadowColor = shadowColor;
        }
        label.shadowOffset = shadowOffset;
    }
    
    return label;
}

UILabel *UILabelInitialize(UIView *superView, CGRect rect, NSTextAlignment align, NSString *text, UIFont *textFont, UIColor *textColor, BOOL resize)
{
    return UILabelInitializeWithShadow(superView, rect, align, text, textFont, textColor, resize, NO, nil, CGSizeMake(0.0, 0.0));
}

void UILabelReloadSize(UILabel *label, UIAutoSizelabelType autoType)
{
    if (label && [label isKindOfClass:[UILabel class]]) {
        [label setNumberOfLines:0];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        
        CGSize size = CGSizeMake(label.frame.size.width, MAXFLOAT);
        CGSize labelsize = [label.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
        
        if (UIAutoSizelabelHorizontal == autoType) {
            label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, labelsize.width + sizeSpace, label.frame.size.height);
        } else if (UIAutoSizelabelAll == autoType) {
            label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, labelsize.width + sizeSpace, labelsize.height + sizeSpace);
        }
    }
}

#pragma mark - UIImageView

UIImageView *UIImageViewInitialize(UIView *superview, CGRect rect, UIImage *image)
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.backgroundColor = [UIColor clearColor];
    
    if (image) {
        [imageView setImage:image];
    }
    
    imageView.userInteractionEnabled = YES;
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:imageView];
    }
    
    return imageView;
}

#pragma mark - UIProgressView

UIProgressView *UIProgressViewInitialize(UIView *superview, CGRect rect, UIProgressViewStyle style, CGFloat progressValue, UIColor *progressColor, UIColor *trackColor)
{
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:rect];
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:progressView];
    }
    
    progressView.backgroundColor = [UIColor clearColor];
    progressView.progressViewStyle = style;
    progressView.progress = progressValue;
    
    if (progressColor && [progressView respondsToSelector:@selector(setProgressTintColor:)]) {
        progressView.progressTintColor = progressColor;
    }
    
    if (trackColor && [progressView respondsToSelector:@selector(setTrackTintColor:)]) {
        progressView.trackTintColor = trackColor;
    }
    
    return progressView;
}

#pragma mark - UIActivityIndicatorView

UIActivityIndicatorView *UIActivityIndicatorViewInitialize(UIView *superview, CGRect rect, UIColor *bgroundColor, UIColor *styleColor, UIActivityIndicatorViewStyle style)
{
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:rect];
    
    // 添加到父视图
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:activityView];
    }
    
    // 背景颜色
    activityView.backgroundColor = (bgroundColor ? bgroundColor : [UIColor clearColor]);
    
    // 类型
    activityView.activityIndicatorViewStyle = style;
    
    // 转圈圈图标颜色（iOS5.0以下才支持颜色设置）
    if (styleColor && [activityView respondsToSelector:@selector(setColor:)]) {
        activityView.color = styleColor;
    }
    
    return activityView;
}

#pragma mark - UIPageControl

UIPageControl *UIPageControlInitialize(UIView *superview, CGRect rect, NSInteger pageCounts, NSInteger currentPage, UIColor *pageColor, UIColor *currentPageColor)
{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:rect];
    pageControl.backgroundColor = [UIColor clearColor];
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:pageControl];
    }
    
    pageControl.numberOfPages = pageCounts;
    pageControl.currentPage = currentPage;
    
    if (pageColor && [pageControl respondsToSelector:@selector(setPageIndicatorTintColor:)]) {
        pageControl.pageIndicatorTintColor = pageColor;
    }
    
    if (currentPageColor && [pageControl respondsToSelector:@selector(setCurrentPageIndicatorTintColor:)]) {
        pageControl.currentPageIndicatorTintColor = currentPageColor;
    }
    
    return pageControl;
}

#pragma mark - UIAlertController

UIAlertController *UIAlertControllerInitialize(id target, UIAlertControllerStyle type, NSString *title, NSString *message, NSArray *textfiledsAction, NSArray *titlesAction, AlertControllerClick buttonClick)
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:type];
    
    /*
    // 添加按钮交互
    [titlesAction enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = obj;
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (buttonClick) {
                int index = (int)idx;
                buttonClick(index, title);
            }
        }];
        [alertController addAction:action];
    }];

    // 添加文本输入处理
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"网络名称";
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }];
    // 文本输入引用
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield = alertController.textFields.firstObject;
    }];
    [alertController addAction:confirmAction];
    */
    
    [textfiledsAction enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = obj;
        // 添加文本输入处理
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = title;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        }];
    }];
    //
    [titlesAction enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = obj;
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (buttonClick) {
                int index = (int)idx;
                buttonClick(index, title, alertController.textFields);
            }
        }];
        [alertController addAction:action];
    }];
    
    if (target && [target isKindOfClass:[UIViewController class]]) {
        [target presentViewController:alertController animated:YES completion:nil];
    }
    
    return alertController;
}

#pragma mark - UIScrollView

UIScrollView *UIScrollViewInitialize(UIView *superView, CGRect rect, int tag, id<UIScrollViewDelegate> delegate)
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollView.tag = tag;
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = delegate;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    if (superView && [superView respondsToSelector:@selector(addSubview:)]) {
        [superView addSubview:scrollView];
    }
    
    return scrollView;
}

#pragma mark - UITableView

UITableView *UITableViewInitialize(UIView *superView, CGRect rect, id<UITableViewDataSource> dataSoure, id<UITableViewDelegate> delegate, UITableViewStyle style, UITableViewCellSeparatorStyle cellStyle)
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:style];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if (dataSoure) {
        tableView.dataSource = dataSoure;
    }
    if (delegate) {
        tableView.delegate = delegate;
    }
    tableView.separatorStyle = cellStyle;
    tableView.backgroundView = nil;
    
    if (superView && [superView respondsToSelector:@selector(addSubview:)]) {
        [superView addSubview:tableView];
    }
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    return tableView;
}

#pragma mark - UICollectionView

UICollectionView *UICollectionViewInitialize(UICollectionViewScrollDirection direction, UIView *superView, CGRect rect, id<UICollectionViewDelegate>delegate, id<UICollectionViewDataSource>dataSource, Class cellClass, Class headerViewClass, Class footerViewClass)
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:direction];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    collectionView.allowsSelection = YES;
    collectionView.allowsMultipleSelection = NO;
    collectionView.alwaysBounceVertical = YES;
    collectionView.backgroundColor = [UIColor clearColor];
    
    if (delegate) {
        collectionView.delegate = delegate;
    }
    if (dataSource) {
        collectionView.dataSource = dataSource;
    }
    if (superView && [superView respondsToSelector:@selector(addSubview:)]) {
        [superView addSubview:collectionView];
    }
    
    if (cellClass) {
        [collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    }
    if (headerViewClass) {
        [collectionView registerClass:headerViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(headerViewClass)];
    }
    if (footerViewClass) {
        [collectionView registerClass:footerViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(footerViewClass)];
    }
    
    return collectionView;
}

#pragma mark - UITextField

UITextField *UITextFieldInitialize(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, float borderwidth, UIColor *bordercolor, UIColor *textFieldColor, float cornerRadius, BOOL isSecureText, UIKeyboardType keyboardType, UIReturnKeyType returnkeyType)
{
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    textField.backgroundColor = [UIColor clearColor];
    textField.delegate = delegate;
    textField.placeholder = placeholder;
    textField.textAlignment = textAlignment;
    textField.contentVerticalAlignment = contentVerticalAlignment;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    textField.secureTextEntry = isSecureText;
    textField.keyboardType = keyboardType;
    textField.returnKeyType = returnkeyType;
    
    if (font) {
        textField.font = font;
    }
    if (textFieldColor) {
        textField.textColor = textFieldColor;
    }
    
    if (bordercolor && 0.0 < borderwidth) {
        textField.layer.borderWidth = borderwidth;
        textField.layer.borderColor = bordercolor.CGColor;
    }
    if (0.0 < cornerRadius) {
        textField.layer.cornerRadius = cornerRadius;
        textField.clipsToBounds = YES;
        textField.layer.masksToBounds = YES;
    }
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:textField];
    }
    
    return textField;
}

UITextField *UITextFieldInitializeWithTextColor(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, UIColor *textFieldColor)
{
    return UITextFieldInitialize(superview, delegate, rect, placeholder, font, textAlignment, contentVerticalAlignment, 0.0, nil, textFieldColor, 0.0, NO, UIKeyboardTypeDefault, UIReturnKeyDefault);
}

UITextField *UITextFieldInitializeWithBorderAndCorRadius(UIView *superview, id delegate, CGRect rect, NSString *placeholder, UIFont *font, NSTextAlignment textAlignment, UIControlContentVerticalAlignment contentVerticalAlignment, float borderWidth, UIColor *borderColor, UIColor *textFieldColor, float cornerRadius)
{
    return UITextFieldInitialize(superview, delegate, rect, placeholder, font, textAlignment, contentVerticalAlignment, borderWidth, borderColor, textFieldColor, cornerRadius, NO, UIKeyboardTypeDefault, UIReturnKeyDefault);
}

#pragma mark - UITextView

UITextView *UITextViewInitialize(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, float borderWidth, UIColor *borderColor, UIColor *textColor, float cornerRadius, UIKeyboardType keyboardType, UIReturnKeyType returnkeyType)
{
    UITextView *textView = [[UITextView alloc] initWithFrame:rect];
    textView.backgroundColor = [UIColor clearColor];
    textView.delegate = delegate;
    textView.font = font;
    textView.textAlignment = textAlignment;
    textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textView.autocorrectionType = UITextAutocorrectionTypeNo;
    
    textView.keyboardType = keyboardType;
    textView.returnKeyType = returnkeyType;
    
    if (font) {
        textView.font = font;
    }
    if (textColor) {
        textView.textColor = textColor;
    }
    
    if (borderColor && 0.0 < borderWidth) {
        textView.layer.borderWidth = borderWidth;
        textView.layer.borderColor = borderColor.CGColor;
    }
    
    if (0.0 < cornerRadius) {
        textView.layer.cornerRadius = cornerRadius;
        textView.clipsToBounds = YES;
        textView.layer.masksToBounds = YES;
    }
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:textView];
    }
    
    return textView;
}

UITextView *UITextViewInitializeWithTextColor(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, UIColor *textColor)
{
    return UITextViewInitialize(superview, delegate, rect, font, textAlignment, 0.0, nil, textColor, 0.0, UIKeyboardTypeDefault, UIReturnKeyDefault);
}

UITextView *UITextViewInitializeWithBorderAndCorRadius(UIView *superview, id delegate, CGRect rect, UIFont *font, NSTextAlignment textAlignment, float borderWidth, UIColor *borderColor, UIColor *textColor, float cornerRadius)
{
    return UITextViewInitialize(superview, delegate, rect, font, textAlignment, borderWidth, borderColor, textColor, cornerRadius, UIKeyboardTypeDefault, UIReturnKeyDefault);
}

#pragma mark - UISearchBar

// 搜索视图
UISearchBar *UISearchBarInitialize(UIView *superview, CGRect rect, id delegate, NSString *placeholder, UISearchBarStyle style, UIColor *tintColor, UIColor *barColor, UIImage *bgroundImage)
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:rect];
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:searchBar];
    }
    
    searchBar.delegate = delegate;
    searchBar.placeholder = placeholder;
    
    if ([searchBar respondsToSelector:@selector(setSearchBarStyle:)]) {
        searchBar.searchBarStyle = style;
    }
    
    if (tintColor) {
        searchBar.tintColor = tintColor;
    }
    
    if (barColor && [searchBar respondsToSelector:@selector(setBarTintColor:)]) {
        searchBar.barTintColor = barColor;
    }
    
    if (bgroundImage && [searchBar respondsToSelector:@selector(setBackgroundImage:)]) {
        searchBar.backgroundImage = bgroundImage;
    }
    
    return searchBar;
}

#pragma mark - UIDatePicker

UIDatePicker *UIDatePickerInitialize(UIView *superview, NSInteger tag)
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:superview.bounds];
    datePicker.tag = tag;
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:datePicker];
    }
    return datePicker;
}

#pragma mark - UIPickerView

UIPickerView *UIPickerViewInitialize(UIView *superview, CGRect rect)
{
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:rect];
    pickerView.showsSelectionIndicator = YES;
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:pickerView];
    }
    
    return pickerView;
}

#pragma mark - UIBarButtonItem

UIBarButtonItem *UIBarButtonItemInitializeWithTitle(NSString *title, int tag, UIBarButtonItemStyle style, id target, SEL action)
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
    buttonItem.tag = tag;
    
    return buttonItem;
}

UIBarButtonItem *UIBarButtonItemInitializeWithImage(UIImage *image, int tag, UIBarButtonItemStyle style, id target, SEL action)
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithImage:image style:style target:target action:action];
    buttonItem.tag = tag;
    
    return buttonItem;
}

UIBarButtonItem *UIBarButtonItemInitializeWithButton(CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIFont *titleFont, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIEdgeInsets titleEdge, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action)
{
    UIButton *button = UIButtonInitialize(nil, rect, tag, titleNormal, titleSelected, titleColorNormal, titleColorHighlight, titleColorSelected, titleFont, titleEdge, imageNormal, imageHighlight, imageSelected, imageEdge, bgImageNormal, bgImageHighlight, bgImageSelected, selected, target, action);
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItem;
}

#pragma mark - UIbutton

UIButton *UIButtonInitialize(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIFont *titleFont, UIEdgeInsets titleEdge, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action)
{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor clearColor];
    button.frame = rect;
    [button setTag:tag];
    button.selected = selected;
    
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (titleNormal) {
        [button setTitle:titleNormal forState:UIControlStateNormal];
    }
    if (titleSelected) {
        [button setTitle:titleSelected forState:UIControlStateSelected];
    }
    if (titleColorNormal) {
        [button setTitleColor:titleColorNormal forState:UIControlStateNormal];
    }
    if (titleColorHighlight) {
        [button setTitleColor:titleColorHighlight forState:UIControlStateHighlighted];
    }
    if (titleColorSelected) {
        [button setTitleColor:titleColorSelected forState:UIControlStateSelected];
    }
    if (titleFont) {
        button.titleLabel.font = titleFont;
    }
    button.titleEdgeInsets = titleEdge;
    
    if (imageNormal) {
        [button setImage:imageNormal forState:UIControlStateNormal];
    }
    if (imageHighlight) {
        [button setImage:imageHighlight forState:UIControlStateHighlighted];
    }
    if (imageSelected) {
        [button setImage:imageSelected forState:UIControlStateSelected];
    }
    button.imageEdgeInsets = imageEdge;
    
    if (bgImageNormal) {
        [button setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
    }
    if (bgImageHighlight) {
        [button setBackgroundImage:bgImageHighlight forState:UIControlStateHighlighted];
    }
    if (bgImageSelected) {
        [button setBackgroundImage:bgImageSelected forState:UIControlStateSelected];
    }
    
    if (superView && [superView respondsToSelector:@selector(addSubview:)]) {
        [superView addSubview:button];
    }
    
    return button;
}

UIButton *UIButtonInitializeWithTitle(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIColor *titleColorNormal, UIColor *titleColorHighlight, UIColor *titleColorSelected, UIFont *titleFont, id target, SEL action)
{
    return UIButtonInitialize(superView, rect, tag, titleNormal, titleSelected, titleColorNormal, titleColorHighlight, titleColorSelected, titleFont, UIEdgeInsetsZero, nil, nil, nil, UIEdgeInsetsZero, nil, nil, nil, NO, target, action);
}

UIButton *UIButtonInitializeWithTitleAndImage(UIView *superView, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIEdgeInsets titleEdge, UIFont *font, UIColor *colorNormal, UIColor *colorHighlight, UIColor *colorSelected, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, id target, SEL action)
{
    return UIButtonInitialize(superView, rect, tag, titleNormal, titleSelected, colorNormal, colorHighlight, colorSelected, font, UIEdgeInsetsZero, imageNormal, imageHighlight, imageSelected, UIEdgeInsetsZero, nil, nil, nil, NO, target, action);
}

UIButton *UIButtonInitializeWithTitleAndBgroundImage(UIView *superview, CGRect rect, int tag, NSString *titleNormal, NSString *titleSelected, UIEdgeInsets titleEdge, UIFont *font, UIColor *colorNormal, UIColor *colorHighlight, UIColor *colorSelected, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action)
{
    return UIButtonInitialize(superview, rect, tag, titleNormal, titleSelected, colorNormal, colorHighlight, colorSelected, font, titleEdge, nil, nil, nil, UIEdgeInsetsZero, bgImageNormal, bgImageHighlight, bgImageSelected, selected, target, action);
}

UIButton *UIButtonInitializeWithImageAndBgroundImage(UIView *superview, CGRect rect, int tag, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, UIEdgeInsets imageEdge, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action)
{
    return UIButtonInitialize(superview, rect, tag, nil, nil, nil, nil, nil, nil, UIEdgeInsetsZero, imageNormal, imageHighlight, imageSelected, imageEdge, bgImageNormal, bgImageHighlight, bgImageSelected, selected, target, action);
}

UIButton *UIButtonInitializeWithBgroundImage(UIView *superview, CGRect rect, int tag, UIImage *bgImageNormal, UIImage *bgImageHighlight, UIImage *bgImageSelected, BOOL selected, id target, SEL action)
{
    return UIButtonInitialize(superview, rect, tag, nil, nil, nil, nil, nil, nil, UIEdgeInsetsZero, nil, nil, nil, UIEdgeInsetsZero, bgImageNormal, bgImageHighlight, bgImageSelected, selected, target, action);
}

UIButton *UIButtonInitializeWithImage(UIView *superview, CGRect rect, UIImage *imageNormal, UIImage *imageHighlight, UIImage *imageSelected, BOOL selected, int tag, id target, SEL action)
{
    return UIButtonInitialize(superview, rect, tag, nil, nil, nil, nil, nil, nil, UIEdgeInsetsZero, imageNormal, imageHighlight, imageSelected, UIEdgeInsetsZero, nil, nil, nil, selected, target, action);
}

#pragma mark - UISwitch

/// 创建UISwitch
UISwitch *UISwitchInitialize(UIView *superview, CGRect rect, id target, SEL action)
{
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:rect];
    [switchView addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:switchView];
    }
    
    return switchView;
}

#pragma mark - UISlider

/// 创建UISlider
UISlider *UISliderInitialize(UIView *superview, CGRect rect, id target, SEL action)
{
    return UISliderInitializeWithValue(superview, rect, target, action, 0.0, 0.0);
}

/// 创建UISlider（自定义最大最小值）
UISlider *UISliderInitializeWithValue(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue)
{
    return UISliderInitializeWithValueAndColor(superview, rect, target, action, minVlaue, maxValue, nil, nil, nil);
}

/// 创建UISlider（自定义最大最小值，及颜色显示）
UISlider *UISliderInitializeWithValueAndColor(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor)
{
    return UISliderInitializeWithValueAndColorAndImage(superview, rect, target, action, minVlaue, maxValue, minColor, maxColor, thumbTintColor, nil, nil);
}

/// 创建UISlider（自定义最大最小值，及颜色，图标显示）
UISlider *UISliderInitializeWithValueAndColorAndImage(UIView *superview, CGRect rect, id target, SEL action, CGFloat minVlaue, CGFloat maxValue, UIColor *minColor, UIColor *maxColor, UIColor *thumbTintColor, UIImage *minImage, UIImage *maxImage)
{
    UISlider *sliderView = [[UISlider alloc] initWithFrame:rect];
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:sliderView];
    }
    
    sliderView.backgroundColor = [UIColor clearColor];
    
    if (minVlaue != maxValue) {
        sliderView.minimumValue = minVlaue;
        sliderView.maximumValue = maxValue;
    }
    
    if (minColor && [sliderView respondsToSelector:@selector(setMinimumTrackTintColor:)]) {
        sliderView.minimumTrackTintColor = minColor;
    }
    
    if (maxColor && [sliderView respondsToSelector:@selector(setMaximumTrackTintColor:)]) {
        sliderView.maximumTrackTintColor = maxColor;
    }
    
    if (thumbTintColor && [sliderView respondsToSelector:@selector(setThumbTintColor:)]) {
        sliderView.thumbTintColor = thumbTintColor;
    }
    
    if (minImage && [sliderView respondsToSelector:@selector(setMinimumValueImage:)]) {
        sliderView.minimumValueImage = minImage;
    }
    
    if (maxImage && [sliderView respondsToSelector:@selector(setMaximumValueImage:)]) {
        sliderView.maximumValueImage = maxImage;
    }
    
    if (target && action) {
        [sliderView addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    }
    
    return sliderView;
}

#pragma mark - UISegmentedControl

/// 创建UISegmentedControl
UISegmentedControl *UISegmentedControlInitialize(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action)
{
    return UISegmentedControlInitializeWithColor(superview, titleArray, rect, target, action, nil);
}

/// 创建UISegmentedControl（设置颜色）
UISegmentedControl *UISegmentedControlInitializeWithColor(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action, UIColor *tintColor)
{
    return UISegmentedControlInitializeWithSelectedIndexAndColor(superview, titleArray, rect, target, action, 0, tintColor);
}

/// 创建UISegmentedControl（设置颜色及被始化被选择索引）
UISegmentedControl *UISegmentedControlInitializeWithSelectedIndexAndColor(UIView *superview, NSArray *titleArray, CGRect rect, id target, SEL action, NSInteger selectedIndex, UIColor *tintColor)
{
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:titleArray];
    
    if (superview && [superview respondsToSelector:@selector(addSubview:)]) {
        [superview addSubview:segmentControl];
    }
    
    segmentControl.backgroundColor = [UIColor clearColor];
    segmentControl.frame = rect;
    segmentControl.momentary = YES;
    
    if (tintColor && [segmentControl respondsToSelector:@selector(setTintColor:)]) {
        segmentControl.tintColor = tintColor;
    }
    
    segmentControl.selectedSegmentIndex = selectedIndex;
    
    if (target && action) {
        [segmentControl addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    }
    
    return segmentControl;
}

#pragma mark - UIImagePickerController

/// 图片视图控制器
UIImagePickerController *UIImagePickerControllerInitialize(UIImagePickerControllerSourceType style, id delegate, UIImage *navImage)
{
    UIImagePickerController *imagePickController = [[UIImagePickerController alloc] init];
    imagePickController.sourceType = style;
    if (delegate) {
        imagePickController.delegate = delegate;
    }
    
    if (navImage && [imagePickController respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [imagePickController.navigationBar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    }
    
    return imagePickController;
}

#pragma mark - 父视图或父视图控制器的操作

/// 添加子控制器
void AddSubController(UIView *view, UIViewController *controller, BOOL animation)
{
    if (view == nil || ![view isKindOfClass:[UIView class]] || controller == nil || ![controller isKindOfClass:[UIViewController class]]) {
        return;
    }
    
    [controller viewWillAppear:animation];
    [view addSubview:controller.view];
    [controller viewDidAppear:animation];
}

/// 移除子控制器
void RemoveSubController(UIViewController *controller, BOOL animation)
{
    if (controller == nil || ![controller isKindOfClass:[UIViewController class]]) {
        return;
    }
    
    [controller viewWillDisappear:animation];
    [controller.view removeFromSuperview];
    [controller viewDidDisappear:animation];
}

/// 移除子视图
void RemoveAllSubviews(UIView *view)
{
    for (NSInteger i = view.subviews.count; i > 0; i--) {
        UIView *subView = [view.subviews objectAtIndex:(i - 1)];
        [subView removeFromSuperview];
    }
}

/// 移除CALayer
void RemoveAllSublayers(UIView *view, Class class)
{
    for (NSInteger i = view.layer.sublayers.count; i > 0; i--) {
        CALayer *sublayer = [view.layer.sublayers objectAtIndex:(i - 1)];
        if ([sublayer isKindOfClass:class]) {
            [sublayer removeFromSuperlayer];
        }
    }
}

#pragma mark - 设置时间定时器

/// 初始化定时器
NSTimer *TimerInitialize(NSTimeInterval time, id userInfo, BOOL isRepeat, id target, SEL action)
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:time target:target selector:action userInfo:userInfo repeats:isRepeat];
    // 设置定时器自已的 runloop 模式，避免受其他 runloop 事件影响
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer setFireDate:[NSDate distantFuture]];
    
    return timer;
}

/// 开始定时
void TimerStart(NSTimer *timer)
{
    [timer setFireDate:[NSDate distantPast]];
}

/// 停止定时
void TimerStop(NSTimer *timer)
{
    [timer setFireDate:[NSDate distantFuture]];
}

/// 释放定时器
void TimerKill(NSTimer *timer)
{
    if ([timer isValid]) {
        [timer invalidate];
        timer = nil;
    }
}

@end
