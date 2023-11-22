//
//  ContentMenuView.h
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContentMenuViewDelegate <NSObject>

- (void)contentMenuViewDidScroll:(UIScrollView *)scrollView;

@end

@interface ContentMenuView : UIView

@property (nonatomic, weak) id<ContentMenuViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<ContentMenuViewDelegate>)delegate;
- (void)toScrollContentScrollView:(UIScrollView *)scrollView;
- (void)toScrollContentTableView:(UIScrollView *)scrollView;
@end

NS_ASSUME_NONNULL_END
