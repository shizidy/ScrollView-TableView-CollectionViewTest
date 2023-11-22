//
//  ContentMenuView.m
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import "ContentMenuView.h"
#import "ContentTableViewCell.h"

@interface ContentMenuView () <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ContentMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<ContentMenuViewDelegate>)delegate {
    if (self = [super initWithFrame:frame]) {
        self.delegate = delegate;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * 3, 0);
    self.scrollView.pagingEnabled = NO;
    [self addSubview:self.scrollView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame) * 3, CGRectGetHeight(self.frame)) style:UITableViewStylePlain];
    [self.scrollView addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor blueColor];
    
    [self.tableView registerClass:[ContentTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ContentTableViewCell class])];
}

- (void)toScrollContentScrollView:(UIScrollView *)scrollView {
    self.scrollView.contentOffset = scrollView.contentOffset;
}

- (void)toScrollContentTableView:(UIScrollView *)scrollView {
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
    ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ContentTableViewCell class]) forIndexPath:indexPath];
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
    if ([self.delegate respondsToSelector:@selector(contentMenuViewDidScroll:)]) {
        [self.delegate contentMenuViewDidScroll:scrollView];
    }
}

#pragma mark - 懒加载
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[
            @"+2.52%",
            @"+1.22%",
            @"-1.11%",
            @"+3.34%",
            @"-1.11%",
            @"+2.22%",
            @"+1.22%",
            @"-1.11%",
            @"+3.34%",
            @"+1.22%",
            @"-1.11%",
            @"+3.34%",
            @"+2.52%",
            @"+1.22%",
            @"-1.11%",
            @"+3.34%",
            @"-1.11%",
            @"+2.22%",
            @"+1.22%",
            @"-1.11%",
            @"+3.34%",
            @"+1.22%",
            @"-1.11%",
            @"+3.34%"
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
