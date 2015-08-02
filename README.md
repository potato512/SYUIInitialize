# UIInitialize
UI控件初始化方法集成封装

使用方法
1 导入头文件 #import "UIInitMethod.h"

2 初始化使用UI控件 
// 创建view UIView *view = InsertView(self.window, CGRectMake(10.0, 60.0, 60.0, 60.0), [UIColor orangeColor]); ResetlayerWithView(view, 20.0, [UIColor greenColor], 5.0);

// 创建带边框的view InsertViewWithBorder(self.window, CGRectMake(30.0, 130.0, 60.0, 60.0), [UIColor greenColor], 0.5, [UIColor purpleColor]);

// 创建带边框及圆角的view InsertViewWithBorderAndCorRadius(self.window, CGRectMake(60.0, 200.0, 60.0, 60.0), [UIColor brownColor], 1.2, [UIColor redColor], 10.0);
