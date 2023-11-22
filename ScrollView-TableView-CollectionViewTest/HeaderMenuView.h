//
//  HeaderMenuView.h
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HeaderMenuViewDelegate <NSObject>

- (void)headerMenuViewDidScroll:(UIScrollView *)scrollView;

@end

@interface HeaderMenuView : UIView
@property (nonatomic, weak)id<HeaderMenuViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame delegate:(id<HeaderMenuViewDelegate>)delegate;
- (void)toScrollHeaderMenuView:(UIScrollView *)scrollView;
@end

NS_ASSUME_NONNULL_END
