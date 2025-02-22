//
//  YZProgressHUD.m
//  CarPooling_Project
//
//  Created by 马远征 on 14-5-31.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "YZProgressHUD.h"
#import <MBProgressHUD.h>

@interface YZProgressHUD() <MBProgressHUDDelegate>
@property (nonatomic, strong) MBProgressHUD *HUD;
@end

@implementation YZProgressHUD

+ (instancetype)progressHUD
{
    static dispatch_once_t pred;
    static YZProgressHUD *httpRequest = nil;
    dispatch_once(&pred, ^{ httpRequest = [[self alloc] init]; });
    return httpRequest;
}

#pragma mark - 在window上显示hud
- (void)showOnWindow:(UIWindow*)window labelText:(NSString*)labelText detailText:(NSString*)detailText
{
    _HUD = [[MBProgressHUD alloc]initWithWindow:window];
    [window addSubview:_HUD];
    _HUD.delegate = self;
    _HUD.labelText = labelText;
    _HUD.detailsLabelText = detailText;
    [_HUD show:YES];
}

#pragma mark - 在view上显示hud
- (void)showOnView:(UIView*)view labelText:(NSString*)labelText detailText:(NSString*)detailText
{
    _HUD = [[MBProgressHUD alloc]initWithView:view];
    [view addSubview:_HUD];
    _HUD.delegate = self;
    _HUD.labelText = labelText;
    _HUD.detailsLabelText = detailText;
    [_HUD show:YES];
}

#pragma mark - 显示HUD进度条
- (void)showProgressOnView:(UIView *)view labelText:(NSString *)labelText detailText:(NSString *)detailText
{
    _HUD = [[MBProgressHUD alloc]initWithView:view.window];
    [view addSubview:_HUD];
    _HUD.mode = MBProgressHUDModeDeterminate;
    _HUD.delegate = self;
    _HUD.labelText = labelText;
    _HUD.detailsLabelText = detailText;
    [_HUD show:YES];
}

#pragma mark - 更新HUD的进度（MBProgressHUDModeDeterminate）
- (void)updateProgress:(double)value labelText:(NSString *)labelText detailText:(NSString *)detailText
{
    if (_HUD && _HUD.mode == MBProgressHUDModeDeterminate)
    {
        _HUD.progress = value;
        _HUD.labelText = labelText;
        _HUD.detailsLabelText = detailText;
    }
}
#pragma mark - 改变hud为风火轮模式
- (void)changeHUDWithText:(NSString*)labelText detailText:(NSString*)detailText
{
    if (_HUD)
    {
        _HUD.mode = MBProgressHUDModeIndeterminate;
        _HUD.labelText = labelText;
        _HUD.detailsLabelText = detailText;
    }
}

#pragma mark - 错误提示,显示后隐藏
- (void)showWithError:(UIWindow *)window labelText:(NSString *)labelText detailText:(NSString *)detailText
{
    _HUD = [[MBProgressHUD alloc]initWithWindow:window];
    [window addSubview:_HUD];
    _HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YZProgressHUD.bundle/tips_failed"]];
	_HUD.mode = MBProgressHUDModeCustomView;
    _HUD.delegate = self;
    _HUD.labelText = labelText;
    _HUD.detailsLabelText = detailText;
    [_HUD show:YES];
    [_HUD hide:YES afterDelay:1];
}

#pragma mark - 提示成功后隐藏
- (void)hideWithSuccess:(NSString*)labelText detailText:(NSString*)detailText
{
    if (_HUD == nil)
    {
        return;
    }
    _HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YZProgressHUD.bundle/tips_smile"]];
	_HUD.mode = MBProgressHUDModeCustomView;
	_HUD.labelText = labelText;
    _HUD.detailsLabelText = detailText;
    [_HUD hide:YES afterDelay:1];
}

#pragma mark - 提示失败后隐藏
- (void)hideWithError:(NSString*)labelText detailText:(NSString*)detailText
{
    if (_HUD == nil)
    {
        return;
    }
    _HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YZProgressHUD.bundle/tips_failed"]];
	_HUD.mode = MBProgressHUDModeCustomView;
	_HUD.labelText = labelText;
    _HUD.detailsLabelText = detailText;
    [_HUD hide:YES afterDelay:1];
}

#pragma mark - 隐藏
- (void)hide
{
    if (_HUD)
    {
        [_HUD hide:YES];
    }
}

#pragma mark -
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [_HUD removeFromSuperview];
	_HUD = nil;
}
@end
