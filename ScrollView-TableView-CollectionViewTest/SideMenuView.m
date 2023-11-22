//
//  SideMenuView.m
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import "SideMenuView.h"
#import "SideMenuTableViewCell.h"

@interface SideMenuView () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation SideMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<SideMenuViewDelegate>)delegate {
    if (self = [super initWithFrame:frame]) {
        self.delegate = delegate;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor orangeColor];
    
    [self.tableView registerClass:[SideMenuTableViewCell class] forCellReuseIdentifier:NSStringFromClass([SideMenuTableViewCell class])];
}

- (void)toScrollSideMenuView:(UIScrollView *)scrollView {
    self.tableView.contentOffset = scrollView.contentOffset;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SideMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SideMenuTableViewCell class]) forIndexPath:indexPath];
    [cell fillcellWithData:self.dataArray indexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDataDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sideMenuViewDidScroll:)]) {
        [self.delegate sideMenuViewDidScroll:scrollView];
    }
}

#pragma mark - 懒加载
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[
            @"国药控股",
            @"中国石油",
            @"中国高速",
            @"中集集团",
            @"ST浩源",
            @"融信中国",
            @"雨润集团",
            @"师傅大哥",
            @"期望二",
            @"而非",
            @"无纺布",
            @"如果",
            @"股份",
            @"国药控股",
            @"中国石油",
            @"中国高速",
            @"中集集团",
            @"ST浩源",
            @"融信中国",
            @"雨润集团",
            @"师傅大哥",
            @"期望二",
            @"而非",
            @"雨润集团"
        ];
    }
    return _dataArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
