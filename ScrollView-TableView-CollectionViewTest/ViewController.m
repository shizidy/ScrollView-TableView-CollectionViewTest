//
//  ViewController.m
//  ScrollView-TableView-CollectionViewTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "SideMenuView.h"
#import "HeaderMenuView.h"
#import "ContentMenuView.h"

#define kScreenWidth UIScreen.mainScreen.bounds.size.width
#define kScreenHeight UIScreen.mainScreen.bounds.size.height
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavigationBarHeight (kStatusBarHeight > 20.f ? 88.f : 64.f)
#define KHomeIndicatorHeight (kStatusBarHeight > 20.f ? 34.f : 0.f)
//判断是否是刘海屏
#define IsFullScreen \
({BOOL IsFullScreen = NO;\
if (@available(iOS 11.0, *)) {\
IsFullScreen = kStatusBarHeight > 20;\
}\
(IsFullScreen);})

@interface ViewController () <ContentMenuViewDelegate, HeaderMenuViewDelegate, SideMenuViewDelegate>

@property (nonatomic, strong) UIView *allButtonView;
@property (nonatomic, strong) SideMenuView *sideView;
@property (nonatomic, strong) HeaderMenuView *headerView;
@property (nonatomic, strong) ContentMenuView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)setUI {
    [self addAllButtonView];
    [self addHeaderMenuView];
    [self addSideView];
    [self addContentMenuView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HomeViewController *vc = [[HomeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addAllButtonView {
    self.allButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, 80, 50)];
    [self.view addSubview:self.allButtonView];
    
    UIButton *allButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.allButtonView.frame), CGRectGetHeight(self.allButtonView.frame))];
    [self.allButtonView addSubview:allButton];
    [allButton setTitle:@"全部" forState:UIControlStateNormal];
    allButton.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
}

- (void)addHeaderMenuView {
    self.headerView = [[HeaderMenuView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.allButtonView.frame), kNavigationBarHeight, kScreenWidth - CGRectGetMaxX(self.allButtonView.frame), CGRectGetHeight(self.allButtonView.frame))];
    [self.view addSubview:self.headerView];
    self.headerView.delegate = self;
}

- (void)addSideView {
    self.sideView = [[SideMenuView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.allButtonView.frame), CGRectGetWidth(self.allButtonView.frame), kScreenHeight - CGRectGetMaxY(self.allButtonView.frame) - KHomeIndicatorHeight)];
    [self.view addSubview:self.sideView];
    self.sideView.delegate = self;
}

- (void)addContentMenuView {
    self.contentView = [[ContentMenuView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sideView.frame), CGRectGetMaxY(self.headerView.frame), kScreenWidth - CGRectGetMaxX(self.sideView.frame), kScreenHeight - CGRectGetMaxY(self.headerView.frame) - KHomeIndicatorHeight)];
    [self.view addSubview:self.contentView];
    self.contentView.delegate = self;
}

#pragma mark - ContentMenuViewDelegate
- (void)contentMenuViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isMemberOfClass:[UITableView class]]) {
        [self.sideView toScrollSideMenuView:scrollView];
    }
    if ([scrollView isMemberOfClass:[UIScrollView class]]) {
        [self.headerView toScrollHeaderMenuView:scrollView];
    }
}

#pragma mark - HeaderMenuViewDelegate
- (void)headerMenuViewDidScroll:(UIScrollView *)scrollView {
    [self.contentView toScrollContentScrollView:scrollView];
}

#pragma mark - SideMenuViewDelegate
- (void)sideMenuViewDidScroll:(UIScrollView *)scrollView {
    [self.contentView toScrollContentTableView:scrollView];
}

@end
