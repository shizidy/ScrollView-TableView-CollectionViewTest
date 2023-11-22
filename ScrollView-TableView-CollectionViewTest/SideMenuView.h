//
//  SideMenuView.h
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SideMenuViewDelegate <NSObject>

- (void)sideMenuViewDidScroll:(UIScrollView *)scrollView;

@end

@interface SideMenuView : UIView
- (void)toScrollSideMenuView:(UIScrollView *)scrollView;
- (instancetype)initWithFrame:(CGRect)frame delegate:(id<SideMenuViewDelegate>)delegate;
@property (nonatomic, weak) id<SideMenuViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
